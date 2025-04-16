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

My personal NixOS and Home Manager configurations, managed declaratively using [Nix Flakes](https://nixos.wiki/wiki/Flakes). This repository contains the system setup for my hosts and the user environment configuration for my user account.

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

1.  **Flakes:** The entire configuration is managed as a Nix Flake (`flake.nix`).
    * **Dependency Management:** Inputs (like `nixpkgs`, `home-manager`, `nixvim`) are explicitly defined and pinned in `flake.lock` for reproducible environments.
    * **Defined Outputs:** The flake exposes standard outputs like `nixosConfigurations` (for building specific NixOS systems) and `homeConfigurations` (for building standalone Home Manager environments), as well as custom outputs like `nixosModules.default` and `homeManagerModules.default` which represent shared module sets.

2.  **Host-Specific Configuration (`hosts/`):**
    * Each subdirectory (e.g., `hosts/dell-9510/`) represents a unique machine configuration.
    * The `configuration.nix` file here contains settings *specific* to that hardware or system role (hostname, networking details, hardware drivers, bootloader settings).
    * Crucially, it **imports the shared NixOS modules** (`outputs.nixosModules.default`) and acts as the place where you **enable or disable shared features/packages/desktops** for that specific host by setting flags (e.g., `config."my-nixos".features.keyd.enable = true;`).
    * It also integrates Home Manager for users present on that host.

3.  **User-Specific Configuration (`users/`):**
    * Each subdirectory (e.g., `users/fentas/`) contains the main `home.nix` entry point for a specific user's Home Manager configuration.
    * This `home.nix` **imports the shared Home Manager modules** (`outputs.homeManagerModules.default`) and **enables or disables shared user-level features/bundles** by setting flags (e.g., `config."my-home-manager".features.starship.enable = true;`).
    * It also contains user-specific settings that aren't intended to be shared (e.g., `home.username`, `home.stateVersion`).

4.  **Shared Modules (`modules/`):** This is the core of reusability.
    * **System vs. User Separation:** `my-nixos/` contains modules applied system-wide via NixOS, while `my-home-manager/` contains modules applied only to the user's environment via Home Manager.
    * **Categorization:** Within each (`my-nixos`, `my-home-manager`), modules are further grouped (e.g., `system`, `features`, `pkgs`, `desktops`, `bundles`). This makes related configurations easy to find.
    * **Individual Modules:** Each `.nix` file within a category ideally represents a single piece of functionality or configuration (e.g., `keyd.nix`, `starship/default.nix`).
    * **Dynamic Loading (`extendModules`):** The custom `mylib.extendModules` function processes these category directories. For each module file found:
        * It automatically defines a corresponding `.enable` option (e.g., `options."my-nixos".features."keyd".enable`).
        * It wraps the module's configuration so it's only included if that specific `.enable` flag is set to `true` in the host/user config.

5.  **Custom Library (`mylib/`):**
    * Centralizes reusable Nix functions (like `extendModules`, `addGroups`, `filesIn`, `fileNameOf`) used throughout the configuration.

**Benefits of this Structure:**

* **Clear Separation:** Easy to distinguish between system, user, host-specific, and shared settings.
* **High Reusability:** Shared modules and library functions minimize code duplication.
* **Easy Toggling:** Features, package sets, and even entire categories can be enabled/disabled via simple boolean flags in host/user configurations.
* **Scalability:** Adding new hosts, users, or features typically involves adding new files/directories following the established patterns, rather than making large changes to core files.
* **Maintainability:** Configuration for specific tools or features is localized within dedicated module files.

&nbsp;

### 🔒 Secrets Management

Secrets (API keys, passwords etc.) are not currently managed within this repository. Integration with tools like [agenix](https://github.com/ryantm/agenix) or [sops-nix](https://github.com/Mic92/sops-nix) would be required for declarative secret management.

### ❤️ Gratitude

* Base structure forked from [Sw3d15h-F1s4/nixos](https://github.com/Sw3d15h-F1s4/nixos).
* From `Sw3d15h-F1s4` itself: `Vimjoyer`, `EmergentMind`, `Wil Taylor`

### 📄 License

This configuration is licensed under the MIT License.