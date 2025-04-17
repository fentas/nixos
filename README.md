<h3 align="center">
	my-nixos modular configuration
</h3>

<p align="center">
	<a href="https://github.com/fentas/nixos/stargazers">
		<img alt="Stargazers" src="https://img.shields.io/github/stars/fentas/nixos?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41"></a>
	<a href="https://github.com/fentas/nixos/releases/latest">
		<img alt="Releases" src="https://img.shields.io/github/release/fentas/nixos.svg?style=for-the-badge&logo=github&color=F2CDCD&logoColor=D9E0EE&labelColor=302D41"/></a>
	<a href="https://github.com/fentas/nixos/issues">
		<img alt="Issues" src="https://img.shields.io/github/issues/fentas/nixos?style=for-the-badge&logo=gitbook&color=B5E8E0&logoColor=D9E0EE&labelColor=302D41"></a>
</p>

&nbsp;

My personal NixOS and Home Manager configurations, managed declaratively using [Nix Flakes](https://nixos.wiki/wiki/Flakes). This repository contains the system setup for my hosts and the user environments.

&nbsp;

### ✨ Features

* Declarative system configuration with NixOS.
* Declarative user environment with [Home Manager](https://github.com/nix-community/home-manager).
* Modular design using custom helpers.
* Currently configured hosts: `dell-9510`.
* Configured desktop environments (selectable via modules): Plasma 6, Hyprland.
* User-specific configurations for `fentas`.

&nbsp;

### 🏛️ Modularity and Structure

This configuration emphasizes a modular structure to promote reusability, maintainability, and easy customization across different machines and user setups. Key components include:

💻 **Host-Specific Configuration (`hosts/`):**
   * Each subdirectory (e.g., `hosts/dell-9510/`) represents a unique machine configuration.

👤 **User-Specific Configuration (`users/`):**
   * Each subdirectory (e.g., `users/fentas/`) contains the main `home.nix` entry point for a specific user's Home Manager configuration.

🧩 **Shared Modules (`modules/`):** This is the core of reusability.
   * **Dynamic Loading (`extendModules`):** The custom `mylib.extendModules` function processes these category directories.

🛠️ **Custom Library (`mylib/`):**
   * Centralizes reusable Nix functions (like `extendModules`, `addGroups`, `filesIn`, `fileNameOf`) used throughout the configuration.

&nbsp;

**Benefits of this Structure:**

* **Clear Separation:** Easy to distinguish between system, user, host-specific, and shared settings.
* **High Reusability:** Shared modules and library functions minimize code duplication.
* **Easy Toggling:** Features, package sets, and even entire categories can be enabled/disabled via simple boolean flags in host/user configurations.
* **Scalability:** Adding new hosts, users, or features typically involves adding new files/directories following the established patterns, rather than making large changes to core files.
* **Maintainability:** Configuration for specific tools or features is localized within dedicated module files.

&nbsp;

### 🔒 Secrets Management

This configuration uses [sops-nix](https://github.com/Mic92/sops-nix) to manage secrets declaratively and securely.

&nbsp;

**Key Aspects:**

* **Tooling:** Secrets are encrypted using [Mozilla SOPS](https://github.com/mozilla/sops) with the [age](https://github.com/FiloSottile/age) backend (leveraging password-protected SSH keys for decryption).
* **Storage:** The **encrypted** secrets file(s) (e.g., `nixos.enc.yaml`) are stored in a **separate private Git repository**, which is included here as a Git submodule located at `./nixos-secrets/`. **Plaintext secrets are never committed to either repository.**
* **Encryption Keys:** Secrets are encrypted using the `age` public key(s) derived from specific SSH public keys (defined in `nixos-secrets/.sops.yaml`). These typically correspond to the target NixOS host(s) and/or user(s) who need decryption access.
* **Decryption:** `sops-nix` handles decryption automatically on the target machine during system activation (`nixos-rebuild switch`) or Home Manager activation (`home-manager switch`). This requires:
    * The corresponding **private SSH key** (the one used to generate the `age` public key during encryption) must be present on the target machine at the path(s) specified in the `sops.age.sshKeyPaths` option within the NixOS or Home Manager configuration.
    * For **password-protected** SSH keys, an `ssh-agent` must typically be running with the key added (`ssh-add /path/to/private/key`) so `sops` can use it for decryption without manual intervention during the build/activation.
* **Configuration:** Secrets are defined within the NixOS (`hosts/.../configuration.nix`) or Home Manager (`users/.../home.nix`) configurations.

&nbsp;

### ❤️ Gratitude

* Base structure forked from [Sw3d15h-F1s4/nixos](https://github.com/Sw3d15h-F1s4/nixos).
* From `Sw3d15h-F1s4` itself: `Vimjoyer`, `EmergentMind`, `Wil Taylor`

&nbsp;

<p align="center">Copyright &copy; 2025-present <a href="https://github.com/fentas" target="_blank">Jan Guth</a>
<p align="center"><a href="https://github.com/fentas/nixos/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=fentas&message=MIT&logoColor=d9e0ee&colorA=302d41&colorB=b7bdf8"/></a></p>