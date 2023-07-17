import 'package:auto_route/annotations.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/responsive_ui_setup/orientation_layout.dart';
import 'package:flaconi_case_study/core/utils/ui_utils/responsive_ui_setup/screen_type_layout.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/bloc/weather_information_bloc.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/views/weather_information_view_landscape.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/views/weather_information_view_portrait.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WeatherInformationView extends StatefulWidget {
  const WeatherInformationView({Key? key}) : super(key: key);

  @override
  State<WeatherInformationView> createState() => _WeatherInformationViewState();
}

class _WeatherInformationViewState extends State<WeatherInformationView> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherInformationBloc>().add(
            const GetCurrentWeatherInformationForMultipleCitiesEvent(),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: (BuildContext context) =>
            const WeatherInformationViewPortrait(),
        //landscape: (BuildContext context) => const WeatherInformationViewLandscape(),
      ),
    );
  }
}
