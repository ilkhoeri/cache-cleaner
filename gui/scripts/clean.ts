import { rm } from 'fs/promises';
import { homedir, tmpdir } from 'os';
import path from 'path';

export async function cleanNpm() {
  const npmCache = path.join(homedir(), '.npm');
  await rm(npmCache, { recursive: true, force: true });
  return 'npm cache cleaned';
}

export async function cleanYarn() {
  const yarnCache = path.join(homedir(), '.cache', 'yarn');
  await rm(yarnCache, { recursive: true, force: true });
  return 'yarn cache cleaned';
}

export async function cleanBun() {
  const bunCache = path.join(homedir(), '.bun');
  await rm(bunCache, { recursive: true, force: true });
  return 'bun cache cleaned';
}

export async function cleanVSCode() {
  const codeCache = path.join(homedir(), 'AppData', 'Roaming', 'Code', 'Cache');
  const codeUserCache = path.join(homedir(), 'AppData', 'Roaming', 'Code', 'User', 'workspaceStorage');
  await rm(codeCache, { recursive: true, force: true });
  await rm(codeUserCache, { recursive: true, force: true });
  return 'VSCode cache cleaned';
}

export async function cleanTemp() {
  const temp = tmpdir();
  await rm(temp, { recursive: true, force: true });
  return 'Temp folder cleaned';
}
