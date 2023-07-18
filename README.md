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

### Core

the Core part of the application contains generic classes, helpers and utils
It is composed of:

- Common models: generic application models such as error model and result model
- constants: contains the application constants properties
- enums: contains the application enumerations
- exceptions: contains application custom exceptions classes
- managers: contains application properties holders (singleton)
- service: contains application base service which contains generic api methods
- useCase: contains application generic useCase class
- utils: contains application utils such as applicationSharedPrefrences, connectivity, dependency
  injection code, extensions, ui utils ...

### Modules

The modules part is the application different modules for example for this application we have the
weather information module

the module is composed of:

- Data : which holds module data source (remote and local), models and repository implementation
- Domain: which holds module repository interface, entities and useCases
- Presentation: which holds module views, widgets and stateManger classes (bloc fot this example)