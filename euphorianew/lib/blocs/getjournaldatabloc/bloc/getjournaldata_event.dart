part of 'getjournaldata_bloc.dart';

@freezed
class GetjournaldataEvent with _$GetjournaldataEvent {
  const factory GetjournaldataEvent.started() = _Started;
  const factory GetjournaldataEvent.getjournaldata() = _Getjournaldata;
  
}