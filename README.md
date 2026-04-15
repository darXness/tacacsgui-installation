# TACACSGUI Installation - Ubuntu 24.04 Edition

Fork of [ichantio/tacacsgui-installation](https://github.com/ichantio/tacacsgui-installation) with additional fixes for Ubuntu 24.04 / PHP 8.3.

## Tested on

| OS | PHP | Python | MySQL | tac_plus |
|---|---|---|---|---|
| Ubuntu Server 22.04 LTS | PHP 8.3.11 | Python 3.10.12 | MySQL 8.0.39 | tac_plus 2024-09 |
| **Ubuntu Server 24.04 LTS** | **PHP 8.3.6** | **Python 3.12.3** | **MySQL 8.0.39** | **tac_plus 2024-09** |

## Requirements
- Fresh Ubuntu 22.04 or 24.04 LTS
- `sudo` or `root` access
- `git` installed
- Internet access

## Install

```bash
git clone https://github.com/darXness/tacacsgui-installation.git
cd tacacsgui-installation
chmod +x installer.sh
sudo ./installer.sh
```

## Post-Install Fixes (Required for Ubuntu 24.04 / PHP 8.3)

```bash
cd fixes
sudo bash apply-fixes.sh
```

| Fix | Issue Resolved |
|---|---|
| composer.json | PHP 8.3 incompatible packages causing 500 error on login |
| MAVISLDAP.php | Missing fillable fields causing Server Error on LDAP Save |
| AuthController.php | AD session array/object mismatch on login |

## AD Authentication Setup

1. Login as `tacgui`
2. Go to **MAVIS Settings** → **LDAP Settings**
3. Configure your AD:
   - Type: `Microsoft`
   - Server: your DC IP or hostname
   - Base DN: `DC=domain,DC=local`
   - Username: `svc_account@domain.local`
   - Search Attribute: `sAMAccountName`
4. Click **Test** then **Save**
5. Go to **LDAP Groups** → add your AD group
6. Bind it to **Administrator** role

## License
Apache-2.0
