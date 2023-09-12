import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../pages/cart_page.dart';
class AppBarResuableWidget extends StatelessWidget {
  const AppBarResuableWidget({super.key,  this.title,  this.isTrue=false, required this.leadingOnTap, required this.leadingIcon, required this.color, this.iconColor});
  final String? title;
  final bool isTrue;
  final GestureTapCallback leadingOnTap;
  final IconData leadingIcon;
  final Color color;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor:color ,
      title:  Text(title ?? '',style: GoogleFonts.abyssinicaSil(fontSize: 18,color: Colors.black),),
      leading: InkWell(
          onTap: leadingOnTap,
          child: Icon(leadingIcon,color: iconColor,)),
      actions:  [
        InkWell(
            child: Icon(Icons.mail_outline,color: iconColor,)),
        const SizedBox(width: 15,),
        InkWell(child: Icon(Icons.notifications_none_sharp,color: iconColor,)),
        const SizedBox(width: 15,),
        Visibility(
          visible: isTrue,
          child:
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkWell(
             onTap: (){
               Get.to(const CartPage());
             },
               child:const Icon(Icons.shopping_cart_outlined,color: Colors.white,)),
          ),
        ),
      ],
    );
  }
}
