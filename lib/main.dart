import 'package:flaconi_case_study/core/utils/dependency_injection/component/app_component.dart';
import 'package:flaconi_case_study/core/utils/navigation_setup/app_router.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/values/app_colors.dart';
import 'package:flaconi_case_study/generated/l10n.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/bloc/weather_information_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lottie/lottie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AssetLottie('assets/splash_animation.zip').load();
  await initAppComponentLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherInformationBloc>(
          create: (BuildContext context) => locator<WeatherInformationBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: blue87CEEB),
          useMaterial3: true,
        ),
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          Localized.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const AppLocalizationDelegate().supportedLocales,
      ),
    );
  }
}
