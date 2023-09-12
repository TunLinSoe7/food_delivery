import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../generated/assets.dart';
///BuildLocationInfo
Widget buildLocationInfo(BuildContext context){
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    padding: const EdgeInsets.all(10),
    width: MediaQuery.of(context).size.width,
    height: 100,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
    ),
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.location_on_outlined),
            const SizedBox(width: 5,),
            Expanded(child: Text("Myanmar,Yangon,MarlarMyaing 4 Street",style: GoogleFonts.abhayaLibre(fontWeight: FontWeight.bold,fontSize: 18),)),
          ],
        ),
        const Spacer(),
        Text("Change Location",style: GoogleFonts.abhayaLibre(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.cyan),),
      ],
    ),
  );
}
///buildSummeryItems
Widget buildSummeryItems(context){
  return Container(
    margin: const EdgeInsets.only(top: 15),
    padding: const EdgeInsets.all(10),
    height: 180,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.cyan.withOpacity(0.2)
    ),
    child: Column(
      children: [
        ListTile(
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(Assets.imagesFriedChickenWingsPubFood,fit: BoxFit.fill,)),
          title: Text("Chicken"),
          subtitle: Text("100 MMK",style: GoogleFonts.abyssinicaSil(color: Colors.cyan),),
          trailing: Text("Quantity 1",style: GoogleFonts.abyssinicaSil(color: Colors.grey)),
        ),ListTile(
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(Assets.imagesFriedChickenWingsPubFood,fit: BoxFit.fill,)),
          title: Text("Chicken"),
          subtitle: Text("100 MMK",style: GoogleFonts.abyssinicaSil(color: Colors.cyan),),
          trailing: Text("Quantity 1",style: GoogleFonts.abyssinicaSil(color: Colors.grey)),
        ),
      ],
    ),
  );
}
///buildCouponItems
Widget buildCouponItems(){
  return Container(
    margin: const EdgeInsets.only(top: 20),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
    ),
    height: 70,
    child: Row(
      children: [
        Text("Enter Coupon Code",style: GoogleFonts.abyssinicaSil(color: Colors.cyan,fontSize: 16),),
        const Spacer(),
        OutlinedButton(onPressed: (){},style: OutlinedButton.styleFrom(
            side: const BorderSide(
                color: Colors.cyan
            )
        ), child: const Text("Use Coupon"),)
      ],
    ),
  );
}
///buildSummeryOrders
Widget buildSummeryOrders(){
  return  Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
    ),
    child: const Column(
      children: [
        ListTile(leading: Text("Delivery Fees"),trailing: Text("\$300"),),
        Divider(
          color: Colors.grey,
        ),
        ListTile(leading: Text("Subtotal"),trailing: Text("\$300"),),
        Divider(
          color: Colors.grey,
        ),
        ListTile(leading: Text("Tax"),trailing: Text("\$600"),),
      ],
    ),
  );
}