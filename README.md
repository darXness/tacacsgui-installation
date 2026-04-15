# TACACSGUI Installation - Ubuntu 24.04 Edition

Fork of [ichantio/tacacsgui-installation](https://github.com/ichantio/tacacsgui-installation) with additional fixes for Ubuntu 24.04 / PHP 8.3.

# Tested on

| OS | PHP | Python | MySQL | tac_plus |
|---|---|---|---|---|
| Ubuntu Server 22.04 LTS | PHP 8.3.11 | Python 3.10.12 | MySQL 8.0.39 | tac_plus 2024-09 |
| **Ubuntu Server 24.04 LTS** | **PHP 8.3.6** | **Python 3.12.3** | **MySQL 8.0.39** | **tac_plus 2024-09** |

# Requirements

- Fresh Ubuntu 22.04 or 24.04 LTS
- `sudo` or `root` access
- `git` package installed
- Internet access

# How to Install

```bash
git clone https://github.com/darXness/tacacsgui-installation.git
cd tacacsgui-installation
chmod +x installer.sh

# Optional: edit install params
nano conf/install_params.conf

# Run installer
sudo ./installer.sh
```

# Post-Install Fixes (Required for Ubuntu 24.04 / PHP 8.3)

After installation, apply fixes to resolve PHP 8.3 compatibility issues:

```bash
cd fixes
sudo bash apply-fixes.sh
```

### What the fixes resolve:
| Fix | Issue |
|---|---|
| `composer.json` | Outdated packages incompatible with PHP 8.3 causing 500 error on login |
| `MAVISLDAP.php` | Missing fillable fields causing Server Error on LDAP Settings Save |
| `AuthController.php` | AD session array/object mismatch causing login warnings |

# AD Authentication Setup

After installation and fixes, configure AD login for the dashboard:

1. Log in as `tacgui`
2. Go to **MAVIS Settings** → **LDAP Settings**
3. Fill in your AD details:
   - **Type**: Microsoft
   - **LDAP Server**: your DC hostname or IP
   - **LDAP Base**: `DC=domain,DC=local`
   - **Username**: `svc_account@domain.local`
   - **Password**: service account password
   - **Search Attribute**: `sAMAccountName`
4. Click **Test** then **Save**
5. Go to **LDAP Groups** tab → add your AD admin group
6. Bind the group to **Administrator** role

# Firewall Setup

```bash
chmod +x setup-firewall.sh
sudo ./setup-firewall.sh --fw=ufw
```

# License

Apache-2.0
