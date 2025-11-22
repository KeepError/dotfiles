# Dotfiles

My personal configuration for macOS, managing system settings, Homebrew packages, and application preferences.

## 📂 Structure

*   **`zsh/`**: Zsh configuration files (managed by Stow).
*   **`raycast/`**: Raycast settings and exports.
*   **`Brewfile`**: List of packages and casks to install.
*   **`macsettings.sh`**: Script to configure macOS defaults (Dock, Finder, etc.).
*   **`stow.sh`**: Symlinks dotfiles using GNU Stow.
*   **`rebuild.sh`**: The main entry point to install/update everything.

## 🚀 Getting Started

### 1. Install Homebrew
[Install Homebrew](https://brew.sh/) if it is not already installed.
*Note: You do not need to manually set the shell PATH for Homebrew immediately; the build script handles the binary path.*

### 2. Clone Repository
Clone this repository to your **Home** directory (e.g., `~/dotfiles`).

```bash
git clone <REPO_URL> ~/dotfiles
cd ~/dotfiles
```

### 3. Install & Configure
Run the rebuild script. This will:
1.  Install Bundle dependencies from `Brewfile`.
2.  Apply macOS system defaults (Dock, Finder, etc.).
3.  Symlink dotfiles using GNU Stow.

```bash
./rebuild.sh
```

---

## ⚙️ Manual Configuration

Some settings cannot be automated via scripts and require manual setup.

### Raycast
1.  **Import Settings:**
    *   Open Raycast.
    *   Go to Settings > Advanced > Import.
    *   Select the configuration file located in the `raycast/` directory of this repo.
2.  **Disable Spotlight:**
    *   System Settings > Keyboard > Keyboard Shortcuts > Spotlight.
    *   Uncheck **Show Spotlight search** (to allow Raycast to use `Cmd + Space`).
3.  **Fix Hyperkey Conflict:**
    *   System Settings > Keyboard > Keyboard Shortcuts > Services.
    *   Expand **Text**.
    *   Find **Convert Text to Simplified Chinese** & **Convert Text to Traditional Chinese**.
    *   Click the shortcut, then press `Backspace` (Delete) to remove the shortcut.
    *   *Reason: These system shortcuts often conflict with Raycast or Hyperkey setups.*

### Zen Browser
Zen Browser profiles must be imported manually.
1.  Open Zen Browser.
2.  Follow the guide here: [Zen Browser Profile Management](https://docs.zen-browser.app/guides/manage-profiles).
3.  Import the profile data/folder if you have exported it previously.

---

## 🛠 Development & Maintenance

### Updating
To update your system (Brew packages, dotfiles, or macOS settings), simply run the rebuild script again:

```bash
dot-rebuild
```

### Changing system packages
Packages are managed declaratively via the `Brewfile`.

To browse the list of packages go to [formulae.brew.sh](https://formulae.brew.sh).

> **⚠️ Important:** The rebuild script uses `brew bundle --cleanup`. Any packages installed manually via the terminal (e.g., `brew install <package>`) that are **not** added to the `Brewfile` will be automatically uninstalled when you run the script. This ensures your environment exactly matches the file.

### Customizing macOS Defaults
The `macsettings.sh` file handles system defaults using the `defaults` command.

**Reference:**
*   List of common defaults: [macos-defaults.com](https://macos-defaults.com)

**Debugging the Dock:**
To read the current Dock configuration (useful for finding Bundle IDs for `macsettings.sh`):

```bash
defaults read com.apple.dock persistent-apps
```

## 🔗 References

*   **Powerlevel10k Homebrew Installation:** [https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#homebrew](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#homebrew)