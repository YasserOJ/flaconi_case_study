# Weather Application

## Author: Yasser Omar Jammeli

this flutter weather application is based on MVVM clean architecture.

To run this application you to type the following in the terminal:

```sh
flutter packages pub run build_runner build 
flutter run --dart-define-from-file=api-keys.json
```

> the first command is to run build_runner and generate generated code such routers for navigation
> and injectable to inject classes (Dependency injection)

> As for the run command it has the dart-define-from-file parameters which allows to add secret api
> key and get them from json file for more security
> PS: I had to push api-keys to repository for code integrity reasons but it should be ignored via
> .gitignore to keep value hidden and secure

It is Composed of two parts:
- Core
- And modules