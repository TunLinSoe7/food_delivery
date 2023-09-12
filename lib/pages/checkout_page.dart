import 'package:flutter/material.dart';
import 'package:food_order_demo/pages/select_payment_page.dart';
import 'package:food_order_demo/utils/screen_width_height_utils.dart';
import 'package:food_order_demo/widgets/bottom_navigation_bar_widget.dart';
import 'package:food_order_demo/widgets/button_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../view_items/checkout_page_view_items.dart';
import '../widgets/app_bar_resuable_widget.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(
          navigationView: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total Payment",style: GoogleFonts.poppins(fontSize: 19),),
                  Text("200 MMK",style: GoogleFonts.poppins(fontSize: 19,color: Colors.cyan),),
                ],
              ),
              ButtonWidget(
                  onTap: (){
                    Get.to(const SelectPaymentPage());
                  },
                  buttonWidth: ScreenWidthUtil.screenWidth(context)*0.5, text: "CheckOut")
            ],
          )
      ),
      backgroundColor: const Color(0xFFF3F7F9),
      appBar: PreferredSize(preferredSize: const Size.fromHeight(50),
          child: AppBarResuableWidget(
            title:"CheckOut Page",
            leadingOnTap: () {
              Navigator.of(context).pop();
            },
            leadingIcon: Icons.close,
            color: Colors.white,
            iconColor: Colors.black,
          )),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildLocationInfo(context),
              Text("Summery Items",style: GoogleFonts.abyssinicaSil(fontSize: 18),),
              buildSummeryItems(context),
              buildCouponItems(),
              const SizedBox(height: 15,),
              Text("Summery Orders",style: GoogleFonts.abyssinicaSil(fontSize: 18),),
              const SizedBox(height: 15,),
             buildSummeryOrders(),
            ],
          ),
        ),
      ),
    );
  }
}
