# Ubuntu 24.04 / PHP 8.3 Composer Fix

## Problem
The original `composer.json` used outdated packages incompatible with PHP 8.3
on Ubuntu 24.04, causing a 500 error on login after installation.

## Affected packages and fixes

| Package | Original | Fixed |
|---|---|---|
| slim/slim | ^3.8 | ^3.12 |
| illuminate/database | ^5.5 | ^8.0 |
| respect/validation | ^1.1 | ^1.1 (kept, v2 breaks API) |
| slim/csrf | ^0.8.2 | ^1.3 |
| bacon/bacon-qr-code | ^1.0 | ^2.0 |
| irazasyed/telegram-bot-sdk | ^2.0 | ^3.0 |
| doctrine/dbal | ^2.7 | ^3.0 |
| guzzlehttp/guzzle | ^6.3 | ^7.0 |
| adldap2/adldap2 | ^9.1 | ^10.0 |
| symfony/yaml | ^4.2 | ^5.0 |
| jimtools/jwt-auth | ^1.0.0 | REMOVED (abandoned) |
| webmozart/json | ^1.2 | REMOVED (abandoned) |
| tuupola/slim-jwt-auth | not present | ^3.0 (replaces jimtools) |
