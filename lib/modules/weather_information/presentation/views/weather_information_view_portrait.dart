import 'package:flaconi_case_study/modules/weather_information/presentation/bloc/weather_information_bloc.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/loading_indicator_widget.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/weather_information_view_app_bar.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/weather_information_view_floating_button.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/weather_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherInformationViewPortrait extends StatefulWidget {
  const WeatherInformationViewPortrait({Key? key}) : super(key: key);

  @override
  State<WeatherInformationViewPortrait> createState() =>
      _WeatherInformationViewPortraitState();
}

class _WeatherInformationViewPortraitState
    extends State<WeatherInformationViewPortrait> {
  bool shouldLoadingIndicator = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WeatherInformationViewAppBar(
        appBar: AppBar(),
        switchValueChanged: (bool value) {},
      ),
      floatingActionButton: WeatherInformationViewFloatingButton(
        buttonClicked: () {},
      ),
      body: BlocListener<WeatherInformationBloc, WeatherInformationState>(
        listener: (context, state) {
          setState(() {
            if (state is WeatherInformationLoading) {
              shouldLoadingIndicator = true;
            } else {
              shouldLoadingIndicator = false;
            }
          });
        },
        child: LoadingIndicatorWidget(
          shouldShowLoadingIndicator: shouldLoadingIndicator,
          child: const WeatherListView(),
        ),
      ),
    );
  }
}
