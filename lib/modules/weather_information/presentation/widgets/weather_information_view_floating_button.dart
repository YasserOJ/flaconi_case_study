import 'package:flutter/material.dart';

class WeatherInformationViewFloatingButton extends StatelessWidget {
  final Function buttonClicked;

  const WeatherInformationViewFloatingButton({
    Key? key,
    required this.buttonClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        buttonClicked();
      },
      child: const Icon(Icons.add),
    );
  }
}
