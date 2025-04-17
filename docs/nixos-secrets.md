# NixOS Configuration Secrets

This repository stores encrypted secrets (like API keys, passwords, private keys) used by the main [fentas/nixos](https://github.com/fentas/nixos) configuration.

**⚠️ This repository must be kept private!** Access to this repository allows defining secrets, although decrypting them requires separate private keys.

## Encryption Method

* Secrets are managed using [Mozilla SOPS](https://github.com/mozilla/sops).
* Encryption uses the [age encryption](https://github.com/FiloSottile/age) backend.
* Secrets are encrypted for specific `age` public keys, which are typically derived from the **SSH keys** of the target NixOS hosts and/or users who need decryption access.

## File Structure

* **`.sops.yaml`**: SOPS configuration file. **Crucially, this defines which `age` public keys are allowed to decrypt the secrets.** You MUST configure this with the public keys corresponding to your target machines/users.
* **`nixos.enc.yaml`**: The main encrypted file containing secrets as key-value pairs in YAML format. You can create more `.enc.yaml` files if desired (e.g., `user-secrets.enc.yaml`) and adjust the `path_regex` in `.sops.yaml`.
* **`.gitignore`**: Ensures plaintext secrets (e.g., `secrets.yaml`) are not accidentally committed.

### nixos.env.yaml

```
user:
    <name>:
        password: <hashed password>
```

You can create the hashed password like
```
bash
# not the space in the beginning
# this will prevent history
 echo -n "password" | mkpasswd -s | xclip -selection clipboard
```

## Managing Secrets

You will need the `sops` and `age` (for `ssh-to-age`) command-line tools. You can get them via Nix: `nix-shell -p sops age`

**1. Get Recipient `age` Public Key(s)**

Before encrypting, you need the `age` public key for every machine/user that needs to decrypt. Derive these from their SSH public keys:

* **NixOS Host Key (for system secrets):** On the target machine, get the public key (e.g., Ed25519):
    ```bash
    cat /etc/ssh/ssh_host_ed25519_key.pub
    ```
    Pipe it to `ssh-to-age`:
    ```bash
    ssh-to-age -i /etc/ssh/ssh_host_ed25519_key.pub
    # Copy the output age1... key
    ```
* **User SSH Key (for user secrets):** Use the user's public key:
    ```bash
    ssh-to-age -i ~/.ssh/id_ed25519_sops.pub # Or id_ed25519.pub etc.
    # Copy the output age1... key
    ```

**2. Configure Recipients (`.sops.yaml`)**

Edit the `.sops.yaml` file in *this* repository. Add the `age` public keys (one per line, quoted, separated by commas if needed within the string value or use YAML multiline string) you collected under the `age:` key:

```yaml
# .sops.yaml
creation_rules:
  - path_regex: secrets\.enc\.yaml$ # Match the encrypted file(s)
    # Add one or more age public keys here VVVVVV
    age: >-
      age1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
      age1yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy