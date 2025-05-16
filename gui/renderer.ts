// const buttons = document.querySelectorAll<HTMLButtonElement>('button[data-task]');
// const log = document.getElementById('log') as HTMLPreElement;
// const loader = document.getElementById('loader') as HTMLElement;

// function setLoading(isLoading: boolean) {
//   if (loader) loader.style.display = isLoading ? 'block' : 'none';
// }

// function logMessage(message: string, isError = false) {
//   if (log) {
//     log.textContent = message;
//     log.style.color = isError ? 'crimson' : 'green';
//   }
// }

// buttons.forEach(button => {
//   button.addEventListener('click', async () => {
//     const taskKey = button.dataset.task;
//     if (!taskKey) return;

//     setLoading(true);
//     logMessage('Processing...');

//     try {
//       const result = await window.api.runCleanup(taskKey);
//       if (result.success) {
//         logMessage(result.message);
//       } else {
//         logMessage(result.message, true);
//       }
//     } catch (err) {
//       logMessage(String(err), true);
//     } finally {
//       setLoading(false);
//     }
//   });
// });

const taskButtons = document.querySelectorAll<HTMLButtonElement>('[data-task]');
const status = document.getElementById('status');

taskButtons.forEach(button => {
  button.addEventListener('click', async () => {
    const taskKey = button.dataset.task;
    if (!taskKey || !window.api?.runCleanup) return;

    status!.textContent = `Cleaning ${taskKey}...`;
    button.disabled = true;
    button.classList.add('loading');

    try {
      const result = await window.api.runCleanup(taskKey);
      if (result.success) {
        status!.textContent = `✅ ${result.message}`;
      } else {
        status!.textContent = `❌ ${result.message}`;
      }
    } catch (err) {
      status!.textContent = `❌ ${err}`;
    } finally {
      button.disabled = false;
      button.classList.remove('loading');
    }
  });
});
