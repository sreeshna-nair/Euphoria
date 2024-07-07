// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journaldatamodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JournalDataAdapter extends TypeAdapter<AddShopData> {
  @override
  final int typeId = 0;

  @override
  AddShopData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddShopData(
      data: fields[0] as String,
      reasons: (fields[1] as List).cast<String>(),
      rating: fields[2] as double,
      datevalue: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddShopData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.reasons)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.datevalue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JournalDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
