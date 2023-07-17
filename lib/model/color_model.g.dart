// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ColorModelClassAdapter extends TypeAdapter<ColorModelClass> {
  @override
  final int typeId = 1;

  @override
  ColorModelClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ColorModelClass(
      appColor: fields[0] as Color,
    );
  }

  @override
  void write(BinaryWriter writer, ColorModelClass obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.appColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorModelClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
