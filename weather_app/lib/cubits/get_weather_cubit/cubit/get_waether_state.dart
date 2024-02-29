part of 'get_waether_cubit.dart';

@immutable
sealed class GetWaetherState {}

final class Initial extends GetWaetherState {}

final class WeatherLoadedState extends GetWaetherState {}

final class WeatherFailureState extends GetWaetherState {}
