import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/model/weather_model.dart';

import '../services/weather_services.dart';

// ignore: must_be_immutable
class SearchPadge extends StatelessWidget {
  SearchPadge({super.key});
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Search a City'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (data) async {
                BlocProvider.of<GetWeatherCubit>(context)
                    .getWeather(cityName: data);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                labelText: '\t\t\tSearch',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60))),
                hintText: '\t\t\tEnter a City Name',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
