# 🧹 Clean Dev & App Cache with Script

> This script helps you free up disk space by safely removing temporary and cache files from development tools (like VSCode, bun, npm, deno, yarn, etc.) and some applications (e.g. Adobe, Zoom, MongoDB Compass, etc.).

A simple tool to **free up space** by deleting temporary and cache files.
Ideal after long coding sessions or when your disk feels too full!

---

## 📌 What It Does

✅ Removes unnecessary files from:

- Development tools: `bun`, `npm`, `yarn`, `deno`, etc.
- Editors: `VSCode`, etc.
- System temp folders
- Apps like `Adobe`, `Zoom`, `Kingsoft`, `MongoDB Compass`, `Microsoft PowerToys`, and more

❌ It **does NOT delete** any of your important project or personal files.
✅ Safe to run once a week or after heavy development.

---

## 📂 Files Included

- `clean-cache.ps1` → A **PowerShell script** that cleans up cache folders.
- `clean-cache.bat` → A **Batch script** to help run the PowerShell script more easily.

---

## 🛡️ Before You Start

- 🧑‍💻 **No coding required**, but you need to run the script **as Administrator**.
- 🚫 The script **does NOT delete your project files**.
- ✅ Safe to use regularly (e.g. weekly or after big projects).
- 🧼 Can help **recover gigabytes** of wasted space.

---

## ⚙️ How to Use

### 🟣 Option 1: Run via Batch File (Easy)

1. **Right-click** `clean-cache.bat`
2. Choose **"Run as administrator"**
3. When asked, **press `Y` on your keyboard** to start cleaning

✅ This is the **recommended option for most users**.

---

### 🟡 Option 2: Run via PowerShell (Advanced)

1. Press `Start` → search for **PowerShell**
2. **Right-click PowerShell**, choose **"Run as administrator"**
3. Go to the folder where the script is located, for example:

```powershell
cd C:\Users\YourName\Downloads\cache-cleaner\script
````

4. Then run:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope Process
.\clean-cache.ps1
```

5. Press `Y` to allow the script to run
6. Press `Y` again when prompted by the script to begin cleanup

---

## 📝 Notes

- Some folders might **fail to delete** if apps are running (e.g. VSCode, Zoom, etc). It's best to **close apps** first.
- If nothing happens, make sure you have **admin rights** and **PowerShell execution is allowed**.

---

## 🧹 What It Cleans

- Development caches from tools like:
  - `bun`, `npm`, `yarn`, `deno`, `pnpm`
- Editor caches like:
  - `VSCode` workspace & extension data
- Common system temp:
  - `%TEMP%`
- App junk from:
  - `Adobe` (Photoshop, Premiere, etc)
  - `Kingsoft`, `Zoom`, `MongoDB Compass`, `PowerToys`, `Microsoft Edge`

---

## ✅ Example Cleanup Result

```plaintext
Cleaning: C:\Users\you\AppData\Local\bun
✅ Cleared C:\Users\you\AppData\Local\bun

Cleaning: C:\Users\you\AppData\Roaming\npm-cache
✅ Cleared ...

🧹 Done! Development caches cleaned.
```

---

## 🧠 Tips

> Use this script **after uninstalling heavy apps**, or when your **C: drive is mysteriously full** despite minimal personal files.

- If you see warnings about permission denied, make sure you run as **Administrator**
- You can customize which folders get cleaned by editing `clean-cache.ps1`
- It's safe to run this script even if you're unsure — it will **only** remove caches and temporary data

---

## 📄 License

MIT — use it freely, improve it, share it!

---

## 🧑‍💻 Made by

**[Ilham Khoeri](https://github.com/ilkhoeri)** — UI Engineer & Developer Tool Creator
