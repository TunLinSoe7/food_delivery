import 'package:flutter/material.dart';
class GridViewBuilderWidget extends StatelessWidget {
  const GridViewBuilderWidget({super.key, required this.count, required this.itemBuilder, required this.itemCount});
  final int count;
  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
        childAspectRatio: 0.8,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12
    ) , itemBuilder:itemBuilder,);
  }
}
