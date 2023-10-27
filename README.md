# Flavors
## O que são Flavors 
Flavors permitem que você crie ambientes separados para seu aplicativo usando a mesma base de código. Por exemplo, você pode ter uma versão para seu aplicativo de produção completo, outra como aplicativo “gratuito” limitado, outra para testar recursos experimentais e assim por diante.

Digamos que você queira criar versões gratuitas e pagas do seu aplicativo Flutter. Você pode usar variações para configurar ambas as versões do aplicativo sem escrever dois aplicativos separados. Por exemplo, a versão gratuita do aplicativo possui funcionalidades básicas e anúncios. Por outro lado, a versão paga possui funcionalidades básicas do aplicativo, recursos extras, estilos diferentes para usuários pagos e sem anúncios.

Você também pode usar variações para desenvolvimento de recursos. Se você criou um novo recurso e deseja experimentá-lo, você pode configurar uma variação para testá-lo. Seu código de produção permanece inalterado até que você esteja pronto para implantar seu novo recurso.
Os sabores permitem definir configurações em tempo de compilação e definir parâmetros que são lidos em tempo de execução para personalizar o comportamento do seu aplicativo.

## Configurações 🤖 Android
A configuração de variações no Android pode ser feita no arquivo `build.gradle` do seu projeto.
1. Dentro do seu projeto Flutter, navegue até `Android / app / build.gradle`.
2. Crie um flavorDimension para agrupar os sabores de produtos adicionados. Gradle não combina sabores de produtos que compartilham o mesmo dimension.
3. Adicione um productFlavors objeto com os tipos desejados junto com valores para `dimension, resValue e applicationId ou applicationIdSuffix`.
   * O nome do aplicativo para cada build está localizado em `resValue`.
   * Se você especificar um `applicationIdSuffix` em vez de um `applicationId`, ele será anexado ao ID do aplicativo “base”.
  
## Configurações 🍎 iOS
1. Abra o seu projeto no Xcode.
2. Selecione `Produto > Esquema > Novo Esquema` no menu para adicionar um novo arquivo Scheme.
   * Um esquema descreve como o Xcode executa diferentes ações. Para os fins deste guia, o sabor e o esquema de exemplo são nomeados como coffee. As configurações de compilação no esquema coffee têm o sufixo `-coffee`.
3. Duplique as configurações de construção para diferenciar entre as configurações padrão que já estão disponíveis e as novas configurações do coffee.
   * Na guia Informações no final da lista suspensa configurações, clique no botão de adição e duplique cada nome de configuração(`Debug, Release, and Profile`). Duplique as configurações existentes, uma vez para cada ambiente.
4. Para combinar com a versão, adicione -coffee no final de cada novo nome de configuração.
5. Altere o coffee para corresponder às configurações de construção já criadas.
   * No projeto Runner , clique em Gerenciar Esquemas… e uma janela pop-up será aberta.
   * Clique duas vezes no esquema. Na próxima etapa (conforme mostrado na captura de tela), você modificará cada esquema para corresponder à sua configuração de compilação:

## Definindo configurações de inicialização [`.vscode`]
Adicione um arquivo `launch.json`, para permitir que você execute o comando `flutter run --flavor [environment name]`. No VSCode, defina as configurações de inicialização da seguinte forma:
1. No diretório raiz do seu projeto, adicione uma pasta chamada `.vscode`.
2. Dentro da pasta `.vscode`, crie um arquivo chamado `launch.json`.
3. No arquivo `launch.json`, adicione um objeto de configuração para cada variação. Cada configuração possui uma chave `name, request, type, program e args`.
```
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Main Coffee",
            "request": "launch",
            "type": "dart",
            "program": "lib/main_coffee.dart",
            "args": ["--flavor", "coffee", "--target", "lib/main_coffee.dart"]
        },
        {
            "name": "Main Cookie",
            "request": "launch",
            "type": "dart",
            "program": "lib/main_cookie.dart",
            "args": ["--flavor", "cookie", "--target", "lib/main_cookie.dart" ]
        },
    ]
```

## Links Úteis
- [Create flavors of a Flutter app](https://docs.flutter.dev/deployment/flavors) <br/>
- [Flutter Flavors, App Icons, and Firebase Tutorial](https://youtu.be/Vhm1Cv2uPko?si=fSR_OgCQR7UF7Fzi) <br/>

## Geral
* Flutter SDK: `3.10.4`
* Android: `>= SDK 21`
* IOS: `>= iOS 11.0 `

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

## 🍎 IOS
### Debug
1. Clone o projeto;
2. Execute `flutter pub get`;
3. Entre na pasta IOS (`cd ios`) e execute `pod install`;
4. Execute o projeto no `F5` (se necessário, abra o emulador com `open -a Simulator`);