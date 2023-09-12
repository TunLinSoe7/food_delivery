import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_order_demo/constant/dimens.dart';
import 'package:food_order_demo/constant/images.dart';
import 'package:food_order_demo/data/vos/food_for_yor_vo/food_for_you_vo.dart';
import 'package:food_order_demo/pages/checkout_page.dart';
import 'package:food_order_demo/pages/select_payment_page.dart';
import 'package:food_order_demo/utils/screen_width_height_utils.dart';
import 'package:food_order_demo/widgets/bottom_navigation_bar_widget.dart';
import 'package:food_order_demo/widgets/button_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../controllers/cart_page_provider.dart';
import '../view_items/cart_page_view_items.dart';
import '../widgets/app_bar_resuable_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartPageBloc>(
      create: (_)=>CartPageBloc(),
      child: Consumer<CartPageBloc>(
        builder: (_,bloc,__){
          final productList = bloc.getCartList;
          return  Scaffold(
              backgroundColor: const Color(0xFFF3F7F9),
              bottomNavigationBar: BottomNavigationBarWidget(
                  navigationView: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Total Payment",style: GoogleFonts.poppins(fontSize: kPS19x),),
                          Text("${bloc.totalPrice}",style: GoogleFonts.poppins(fontSize: 19,color: Colors.cyan),),
                        ],
                      ),
                      ButtonWidget(
                          onTap: (){
                            Get.to(const CheckOutPage());
                          },
                          buttonWidth: ScreenWidthUtil.screenWidth(context)*0.5, text: "Buy (${productList?.length} items)")
                    ],
                  )
              ),
              appBar: PreferredSize(preferredSize: const Size.fromHeight(50),
                  child: AppBarResuableWidget(
                    title:"Cart Page",
                    leadingOnTap: () {
                     Navigator.of(context).pop();
                    },
                    leadingIcon: Icons.close,
                    color: Colors.white,
                    iconColor: Colors.black,
                  )),
              body:bloc.getCartList==null?const CircularProgressIndicator():Column(
                children: [
                  Expanded(
                    child: ListView.builder(itemCount: bloc.getCartList?.length,itemBuilder: (_,index){
                      return CartListViewItem(
                          foodForYouVO: bloc.getCartList?[index].foodForYouVO,
                          decreaseTap: (){
                            bloc.decreaseCount(productList?[index]);
                          },
                          increaseTap: (){
                            bloc.increaseCount(productList?[index]);
                          }, quantity: productList?[index].quantity ?? 0,
                      );
                    }),
                  ),
                ],
              )
          );
        },
      ),
    );
  }
}
