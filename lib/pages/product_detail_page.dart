import 'package:flutter/material.dart';
import 'package:food_order_demo/constant/dimens.dart';
import 'package:food_order_demo/constant/string.dart';
import 'package:food_order_demo/utils/screen_width_height_utils.dart';
import 'package:food_order_demo/view_items/detail_page_view_items.dart';
import 'package:food_order_demo/widgets/bottom_navigation_bar_widget.dart';
import 'package:food_order_demo/widgets/button_widget.dart';
import 'package:provider/provider.dart';
import '../controllers/detail_page_provider.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.id});
  final int? id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailPageBloc>(
      create: (BuildContext context) {
        return DetailPageBloc(feedID: id!);
      },
      child: Consumer<DetailPageBloc>(
        builder: (_, bloc, __) {
          final foodItem = bloc.getFoodForYouListByID;
          return Scaffold(
            bottomNavigationBar:  foodItem == null
                ?null:Builder(
              builder: (context) {
                return Selector<DetailPageBloc,int>(
                  selector: (_,bloc)=>bloc.getQuantity,
                  builder: (_,quantity,__)=> BottomNavigationBarWidget(
                      navigationView:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonWidget(
                              onTap: (){
                            context.read<DetailPageBloc>().addToCart(foodItem,quantity);
                            },
                              buttonWidth:ScreenWidthUtil.screenWidth(context)*0.7
                              ,text: kAddToCartText),
                          Container(
                            height: kPS50x,
                            width: kPS50x,
                            margin: const EdgeInsets.all(kPS10x),
                            alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(kPS10x),
                                color: Colors.cyan.withOpacity(0.5)
                              ),
                              child: const Icon(Icons.favorite_border_outlined,color: Colors.red,)),
                        ],
                      )
                  ),
                );
              }
            ),
            body:  foodItem == null
                ? const Center(child: CircularProgressIndicator())
                : buildProductDetailPageView(context, bloc, foodItem),
          );
        },
      ),
    );
  }
}