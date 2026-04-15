# Post-Install Fixes for Ubuntu 24.04 / PHP 8.3

Run the apply script to apply all fixes at once:

```bash
cd fixes
sudo bash apply-fixes.sh
```

### What each fix does:
- **composer.json** — upgrades packages for PHP 8.3 compatibility
- **Models/MAVISLDAP.php** — adds missing fillable fields (ssl, enabled, pap_login, enable_login, message_flag) that caused Server Error on LDAP Settings Save
- **Controllers/Auth/AuthController.php** — fixes AD session user array vs object mismatch causing login warnings
