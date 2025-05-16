import { cleanBun, cleanNpm, cleanTemp, cleanVSCode, cleanYarn } from './clean';

export const cleanupTasks: Record<string, () => Promise<string>> = {
  npm: cleanNpm,
  yarn: cleanYarn,
  bun: cleanBun,
  vscode: cleanVSCode,
  temp: cleanTemp
};
