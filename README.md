# Flavors

Os Flavors no Flutter possibilitam a criação de ambientes independentes para o seu aplicativo, tudo isso com a mesma base de código.

## Geral
* Flutter SDK: `3.10.4`

## 🤖 Android
### Debug
1. Clone o projeto;
2. Execute `flutter pub get`;
3. Execute o projeto;

```shell script
fvm flutter -run --flavor cookie
fvm flutter -run --flavor coffee

fvm flutter build apk --flavor cookie --split-per-abi --target ./lib/main_cookie.dart
fvm flutter build apk --flavor coffee --split-per-abi --target ./lib/main_coffee.dart
```
