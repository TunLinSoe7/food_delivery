import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/images.dart';
import '../data/vos/food_for_yor_vo/food_for_you_vo.dart';
class CartListViewItem extends StatelessWidget {
  const CartListViewItem({super.key, required this.foodForYouVO, required this.decreaseTap, required this.increaseTap, required this.quantity});
  final FoodForYouVO? foodForYouVO;
  final GestureTapCallback decreaseTap;
  final GestureTapCallback increaseTap;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 15,right: 15,top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius:BorderRadius.circular(10),
              child: CachedNetworkImage(
                width: 80,
                height: 80,
                fit: BoxFit.fill,
                imageUrl: "${foodForYouVO?.image}",
                placeholder: (_,url)=>Image.asset(kFoodPlaceholderImage,fit: BoxFit.fill,),errorWidget: (_,url,error)=>Image.asset(kFoodPlaceholderImage,fit: BoxFit.fill,),)),
          const SizedBox(width: 10,),
          Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [
              Text("${foodForYouVO?.name}",style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
              Text("\$ ${foodForYouVO?.price}"),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.56,
                child:  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Builder(
                            builder: (context) {
                              return GestureDetector(
                                  onTap:decreaseTap,
                                  child: const Icon(Icons.remove_circle));
                            }
                        ),
                        const SizedBox(width: 5,),
                        Text("$quantity"),
                        const SizedBox(width: 5,),
                        Builder(
                            builder: (context) {
                              return GestureDetector(
                                  onTap:increaseTap,
                                  child: const Icon(Icons.add_circle));
                            }
                        ),
                      ],
                    ),
                    const Icon(Icons.delete_outline_sharp)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



