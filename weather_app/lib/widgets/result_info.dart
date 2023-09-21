import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

import '../screens/search_padge.dart';

class ResultInfo extends StatelessWidget {
  const ResultInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => SearchPadge(),
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 60),
              child: Text('Weather App'),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            getThemeColor(weatherModel.condition)[500]!,
            getThemeColor(weatherModel.condition)[300]!,
            getThemeColor(weatherModel.condition)[100]!,
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Column(
              children: [
                Center(
                  child: Text(
                    weatherModel.cityName,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                    child: Text(
                  'Last update (${weatherModel.date.hour} : ${weatherModel.date.minute})',
                  style: const TextStyle(fontWeight: FontWeight.w400),
                )),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30, bottom: 30, left: 60, right: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.network('https:${weatherModel.image}'),
                        ),
                        const Spacer(),
                        Text(
                          '${weatherModel.temp}',
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Max Temp: ${weatherModel.maxTemp.round()}',
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            Text('Min Temp: ${weatherModel.minTemp.round()}',
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Text(weatherModel.condition,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
