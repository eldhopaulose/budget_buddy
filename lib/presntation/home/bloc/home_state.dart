part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.success() = _Success;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.faield({required String erorr}) = _Faield;
}
