import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgets/no_result.dart';
import 'package:weather_app/widgets/result_info.dart';

class HomePadge extends StatelessWidget {
  const HomePadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          if (state is GetWeatherInitial) {
            return NoResult();
          } else if (state is GetWeatherSuccess) {
            return ResultInfo();
          } else {
            return const Center(
              child: Text('Something Wrong'),
            );
          }
        },
      ),
    );
  }
}
