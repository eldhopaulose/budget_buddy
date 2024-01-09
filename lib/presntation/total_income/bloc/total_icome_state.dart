part of 'total_icome_bloc.dart';

@freezed
class TotalIcomeState with _$TotalIcomeState {
  const factory TotalIcomeState.initial() = _Initial;
  const factory TotalIcomeState.success() = _Success;
  const factory TotalIcomeState.loading() = _Loading;
  const factory TotalIcomeState.faield({required String erorr}) = _Faield;
}
