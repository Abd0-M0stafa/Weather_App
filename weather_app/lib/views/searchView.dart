import 'package:flutter/material.dart';
import 'package:weather_app/cubits/get_weather_cubit/cubit/get_waether_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Center(
          child: Text(
            'Search a City',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: TextField(
            cursorColor: Theme.of(context).primaryColor,
            onSubmitted: (value) async {
              BlocProvider.of<GetWaetherCubit>(context)
                  .getWeather(cityName: value);

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              labelText: 'search',
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 68, 68, 68),
              ),
              hintText: 'enter city name',
              suffixIcon: const Icon(Icons.search),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
