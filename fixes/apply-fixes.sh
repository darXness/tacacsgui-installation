#!/bin/bash
# Apply post-install fixes for Ubuntu 24.04 / PHP 8.3
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[1/3] Applying composer.json fix..."
cp "$SCRIPT_DIR/composer.json" /opt/tacacsgui/web/api/composer.json
cd /opt/tacacsgui/web/api
sudo -u www-data composer update --no-dev --ignore-platform-reqs --no-audit -W
sudo chown -R www-data:www-data /opt/tacacsgui/web/

echo "[2/3] Applying MAVISLDAP model fix..."
cp "$SCRIPT_DIR/Models/MAVISLDAP.php" /opt/tacacsgui/web/api/app/Models/MAVISLDAP.php

echo "[3/3] Applying AuthController fix..."
cp "$SCRIPT_DIR/Controllers/Auth/AuthController.php" /opt/tacacsgui/web/api/app/Controllers/Auth/AuthController.php

echo "Restarting Apache..."
systemctl restart apache2

echo "All fixes applied successfully!"
