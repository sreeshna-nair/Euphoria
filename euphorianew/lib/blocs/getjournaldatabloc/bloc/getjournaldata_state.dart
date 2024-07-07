part of 'getjournaldata_bloc.dart';

@freezed
class GetjournaldataState with _$GetjournaldataState {
  const factory GetjournaldataState.initial() = _Initial;
  const factory GetjournaldataState.sucess({required UserEmotionModel data}) = _Sucess;
  const factory GetjournaldataState.error() = _Error;
  
  
}
