import 'package:flaconi_case_study/modules/weather_information/domain/entity/weather_information_entity.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/bloc/weather_information_bloc.dart';
import 'package:flaconi_case_study/modules/weather_information/presentation/widgets/weather_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherListView extends StatelessWidget {
  const WeatherListView({
    Key? key,
    required this.didSelectItem,
    this.selectedItem = 0,
    this.areItemsSelectable = false,
  }) : super(key: key);

  final Function(WeatherInformationEntity, int) didSelectItem;
  final int selectedItem;
  final bool areItemsSelectable;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<WeatherInformationBloc>().add(
              const GetCurrentWeatherInformationForMultipleCitiesEvent(),
            );
      },
      child: BlocBuilder<WeatherInformationBloc, WeatherInformationState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final currentItem = context
                  .read<WeatherInformationBloc>()
                  .weatherInformation[index];
              return WeatherInfoItem(
                itemWeatherInformation: currentItem,
                isItemSelectable: areItemsSelectable,
                isSelected: selectedItem == index,
                didTapOnItem: () {
                  didSelectItem.call(currentItem, index);
                },
              );
            },
            itemCount: context
                .read<WeatherInformationBloc>()
                .weatherInformation
                .length,
          );
        },
      ),
    );
  }
}
