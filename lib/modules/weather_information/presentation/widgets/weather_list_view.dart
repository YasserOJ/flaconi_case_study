import 'package:auto_route/auto_route.dart';
import 'package:flaconi_case_study/core/utils/navigation_setup/app_router.gr.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/bloc/weather_information_bloc.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/weather_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherListView extends StatelessWidget {
  const WeatherListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(onRefresh: () async {
      context.read<WeatherInformationBloc>().add(
            const GetCurrentWeatherInformationForMultipleCitiesEvent(),
          );
    }, child: BlocBuilder<WeatherInformationBloc, WeatherInformationState>(
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return WeatherInfoItem(
              itemWeatherInformation: context
                  .read<WeatherInformationBloc>()
                  .weatherInformation[index],
              isSelected: true,
              didTapOnItem: () {
                context.router.push(
                  WeatherInformationDetailsPortraitRoute(
                    weatherInformationEntity: context
                        .read<WeatherInformationBloc>()
                        .weatherInformation[index],
                  ),
                );
              },
            );
          },
          itemCount:
              context.read<WeatherInformationBloc>().weatherInformation.length,
        );
      },
    ));
  }

  Future<void> onRefresh() async {}
}
