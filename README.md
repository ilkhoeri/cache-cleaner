# Cache Cleaner

A much more efficient and no-reinstall way to clean up cache files, trash, and build artifacts from developing applications using VS Code, Bun, Yarn, npm, etc. This often causes the C: folder to be full even though it doesn't store many personal files.

Here are the steps to clean up storage without reinstalling, but still produce a "like new" effect in the development environment:

## ✅ 1. Clear Package Manager Cache

### 🧹 Bun

```bash
bun pm cache clean
```

**Or delete manually**:

```bash
%USERPROFILE%\AppData\Local\bun\
```

### 🧹 Yarn

```bash
yarn cache clean
```

**Or delete manually**:

```bash
%LOCALAPPDATA%\Yarn\Cache
```

### 🧹 npm

```bash
npm cache clean --force
```

**Or delete manually**:

```bash
%APPDATA%\npm-cache
```

## ✅ 2. Delete .next, dist, build, node_modules, etc.

Find and delete all build result & dependencies folders:
Run in project root folder.

```powershell
Get-ChildItem -Recurse -Include "node_modules", ".next", "dist", "build" | Remove-Item -Recurse -Force
```

**Or manually**:

- Open project folders one by one
- Delete:
  - `node_modules`
  - `.next`, `build`, `dist`
  - `bun.lockb`, `package-lock.json`, `yarn.lock` (if you want to clean install later)

## ✅ 3. Clear VSCode Extension Cache

VSCode stores a lot of cache, history, and extensions:

```bash
%APPDATA%\Code\Cache
%APPDATA%\Code\CachedData
%APPDATA%\Code\User\workspaceStorage
```

If you don't mind losing your workspace history, you can delete it all.

## ✅ 4. Use Windows Clean-up Tool

Open `Disk Cleanup`:

- Press `Win + R`, type `%temp%`, Enter
  - Delete all contents of the `temp` folder.
- Press `Win + R`, type `cleanmgr`, Enter
  - Select `C:`
  - Check all except `"Downloads"`
  - Click `"OK"`

## ✅ 5. Check Largest Folders in `C:` Using WinDirStat

Download [WinDirStat](https://windirstat.net/), then:

- Run, select Local Disk (`C:`)
- Wait for scanning to complete
- Find folders with large block colors (usually `.cache`, `.npm`, `.bun`, etc.)
- Delete unimportant caches/deps

## ✅ 6. Use `Storage Sense` (Automatic)

Windows has a **Storage Sense** feature that can automatically clear the cache:

- `Settings` → `System` → `Storage`
- Enable _`Storage Sense`_
- Click _`Configure Storage Sense or run it now`_
- Check:
  - Temporary files
  - Unused apps
  - Downloads (optional)
- Run manually or set a schedule

## 🚀 Optional: Relocate `node_modules` to Drive D: (Continued)

If `C:` is small but you have a large `D:`, you can symlink `node_modules` or `.bun` to `D:` by default.

Example:

```bash
# Move npm cache to D
npm config set cache "D:\npm-cache" --global

# For buns (if using)
setx BUN_INSTALL "D:\bun"
```

## 🎯 Conclusion: The Most Effective Order

| Steps                                 | Effects            | Safe?   |
| ------------------------------------- | ------------------ | ------- |
| Clear Bun/Yarn/npm cache              | 💥 Large           | ✅ Safe |
| Clear `node_modules` and build output | 💥 Large           | ✅ Safe |
| Clean VSCode workspace & cache        | ⚠️ Medium          | ✅ Safe |
| Disk Cleanup & %TEMP%                 | 💥 Large           | ✅ Safe |
| Use WinDirStat                        | 🎯 Accurate Target | ✅ Safe |
| Enable Storage Sense                  | 🌀 Automatic       | ✅ Safe |
