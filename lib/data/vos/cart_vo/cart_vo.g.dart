// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartVOAdapter extends TypeAdapter<CartVO> {
  @override
  final int typeId = 2;

  @override
  CartVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartVO(
      foodForYouVO: fields[0] as FoodForYouVO,
      quantity: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CartVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.foodForYouVO)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
