// preload.ts
import { contextBridge, ipcRenderer } from 'electron';

contextBridge.exposeInMainWorld('electronAPI', {
  runCleanup: () => ipcRenderer.invoke('run-cleanup'),
  onCleanupStatus: (callback: (message: string) => void) => {
    ipcRenderer.on('cleanup-status', (_, message) => callback(message));
  }
});
