#!/usr/bin/env node

import * as fs from 'fs';
import * as path from 'path';
import * as readline from 'readline';

const jsonPath = path.join(__dirname, 'cache-targets.json');

let targets: string[] = [];

try {
  const json = fs.readFileSync(jsonPath, 'utf8');
  targets = JSON.parse(json);
} catch (err: any) {
  console.error('❌ Gagal membaca cache-targets.json:', err.message);
  process.exit(1);
}

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function pauseAndExit(): void {
  rl.question('\n🟢 Selesai. Tekan ENTER untuk keluar...', () => {
    rl.close();
    process.exit(0);
  });
}

function expandEnvVariable(input: string): string {
  return input.replace(/^%([^%]+)%/, (_, key) => process.env[key] || '');
}

function cleanAll(): void {
  console.log('\n🧹 Memulai pembersihan cache...\n');

  targets.forEach((rawPath: string) => {
    const expandedPath = expandEnvVariable(rawPath);
    if (fs.existsSync(expandedPath)) {
      try {
        fs.rmSync(expandedPath, { recursive: true, force: true });
        console.log(`✅ ${expandedPath}`);
      } catch (err: any) {
        console.warn(`⚠️  Gagal hapus ${expandedPath}: ${err.message}`);
      }
    } else {
      console.log(`❎ Tidak ditemukan: ${expandedPath}`);
    }
  });

  pauseAndExit();
}

rl.question('⚠️  Hapus semua cache dev dan app? (y/n): ', (answer: string) => {
  if (answer.toLowerCase() === 'y') {
    cleanAll();
  } else {
    console.log('❌ Dibatalkan.');
    pauseAndExit();
  }
});
