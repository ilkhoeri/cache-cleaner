// (Electron entry)
import { app, BrowserWindow, ipcMain } from 'electron';
import path from 'path';
import { cleanupTasks } from './scripts';

let mainWindow: BrowserWindow | null = null;

const createWindow = () => {
  mainWindow = new BrowserWindow({
    width: 720,
    height: 480,
    resizable: false,
    webPreferences: {
      preload: path.join(__dirname, 'preload.ts')
    }
  });

  mainWindow.loadFile('index.html');
};

// Jalankan task berdasarkan key yang dikirim dari renderer
ipcMain.handle('run-cleanup', async (_, taskKey: string) => {
  const task = cleanupTasks[taskKey];
  if (task) {
    try {
      const result = await task();
      return { success: true, message: result };
    } catch (err) {
      return { success: false, message: String(err) };
    }
  }
  return { success: false, message: 'Unknown task' };
});

app.whenReady().then(() => {
  createWindow();
  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});
