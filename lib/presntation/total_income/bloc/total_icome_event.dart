part of 'total_icome_bloc.dart';

@freezed
class TotalIcomeEvent with _$TotalIcomeEvent {
  const factory TotalIcomeEvent.started() = _Started;
  const factory TotalIcomeEvent.onBtnCliked(
      {required String money, required String topic}) = _OnBtnCliked;
}
