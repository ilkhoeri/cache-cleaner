#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const readline = require('readline');

// Path ke JSON (di direktori yang sama dengan .exe nanti)
const jsonPath = path.join(__dirname, '../script/cache-targets.json');

let targets = [];
try {
  targets = JSON.parse(fs.readFileSync(jsonPath, 'utf8'));
} catch (err) {
  console.error('❌ Gagal membaca cache-targets.json:', err.message);
  process.exit(1);
}

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function pauseAndExit() {
  rl.question('\n🟢 Selesai. Tekan ENTER untuk keluar...', () => {
    rl.close();
    process.exit(0);
  });
}

function cleanAll() {
  console.log('\n🧹 Memulai pembersihan cache...\n');
  targets.forEach((rawPath) => {
    const expandedPath = rawPath.replace(/^%([^%]+)%/, (_, key) => process.env[key] || '');
    if (fs.existsSync(expandedPath)) {
      try {
        fs.rmSync(expandedPath, { recursive: true, force: true });
        console.log(`✅ ${expandedPath}`);
      } catch (err) {
        console.warn(`⚠️  Gagal hapus ${expandedPath}: ${err.message}`);
      }
    } else {
      console.log(`❎ Tidak ditemukan: ${expandedPath}`);
    }
  });

  pauseAndExit();
}

rl.question('⚠️  Hapus semua cache dev dan app? (y/n): ', (answer) => {
  if (answer.toLowerCase() === 'y') {
    cleanAll();
  } else {
    console.log('❌ Dibatalkan.');
    pauseAndExit();
  }
});
