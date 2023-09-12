import 'package:flutter/material.dart';
class ListViewScrollWidget extends StatelessWidget {
  const ListViewScrollWidget({super.key, required this.itemCount, required this.itemBuilder});
  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: itemCount,itemBuilder: itemBuilder
    );
  }
}
