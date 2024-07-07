
import 'package:hive/hive.dart';
part 'journaldatamodel.g.dart';

@HiveType(typeId: 0, adapterName: "JournalDataAdapter")
class AddShopData {
  @HiveField(0)
  String data;

  @HiveField(1)
  List<String>reasons;

  @HiveField(2)
  double rating;

  @HiveField(3)
  String datevalue;


  AddShopData({
    required this.data,
    required this.reasons,
    required this.rating,
    required this.datevalue
  });
}
