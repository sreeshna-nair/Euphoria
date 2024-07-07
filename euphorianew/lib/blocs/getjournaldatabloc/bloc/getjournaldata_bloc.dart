import 'package:bloc/bloc.dart';
import 'package:euphoria/JournalPage/models/useremotionmodel.dart';
import 'package:euphoria/JournalPage/service/journalservice.dart';
import 'package:euphoria/hivemodel/journaldatamodel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'getjournaldata_event.dart';
part 'getjournaldata_state.dart';
part 'getjournaldata_bloc.freezed.dart';

class GetjournaldataBloc
    extends Bloc<GetjournaldataEvent, GetjournaldataState> {
  GetjournaldataBloc() : super(const _Initial()) {
    on<GetjournaldataEvent>((event, emit) async {
      // TODO: implement event handler
      try {
        if (event is _Getjournaldata) {
          final response = await viewjournal();
          // emit(const GetjournaldataState.initial());
          // Box box = await Hive.openBox<AddShopData>('shopData');
          // final allData = box.values.toList();
          // print(allData);
          emit(GetjournaldataState.sucess(data: response));
        }
      } catch (e) {
        emit(const GetjournaldataState.error());
      }
    });
  }
}
