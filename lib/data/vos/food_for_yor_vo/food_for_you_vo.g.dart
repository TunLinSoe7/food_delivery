// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_for_you_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodForYouVOAdapter extends TypeAdapter<FoodForYouVO> {
  @override
  final int typeId = 1;

  @override
  FoodForYouVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodForYouVO(
      id: fields[0] as int?,
      name: fields[1] as String?,
      price: fields[2] as int?,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FoodForYouVO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodForYouVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodForYouVO _$FoodForYouVOFromJson(Map<String, dynamic> json) => FoodForYouVO(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$FoodForYouVOToJson(FoodForYouVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
    };
