import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_order_demo/constant/dimens.dart';
import 'package:food_order_demo/constant/string.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/images.dart';
import '../controllers/detail_page_provider.dart';
import '../data/vos/food_for_yor_vo/food_for_you_vo.dart';
import '../pages/cart_page.dart';
Widget buildProductDetailPageView(BuildContext context, DetailPageBloc bloc, FoodForYouVO? foodItem) {
  return CustomScrollView(
    slivers: [
      SliverAppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: kPS15x),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
            ),
          ),
        ),
        expandedHeight: kPS250x,
        flexibleSpace: FlexibleSpaceBar(
          background: Hero(
            tag: "${foodItem?.name}hero",
            child: CachedNetworkImage(
              imageUrl: "${foodItem?.image}",
              placeholder: (_, url) => Image.asset(kFoodPlaceholderImage),
              errorWidget: (_, error, __) => const Icon(Icons.error),
              fit: BoxFit.fill,
            ),
          ),
        ),
        pinned: true,
        actions: [
          InkWell(
            onTap: () {
              Get.to(const CartPage());
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.shopping_cart_outlined, color: Colors.black),
            ),
          ),
          const SizedBox(width: kPS15x),
        ],
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(kPS15x),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("${foodItem?.name}", style: GoogleFonts.poppins(fontSize: kPS18x)),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: kPS20x),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDetailInfo("15-20 min", Icons.timer),
                  _buildDetailInfo("(4.8)", Icons.star, color: Colors.yellow),
                  _buildDetailInfo("123 st", Icons.location_on_outlined, color: Colors.green),
                ],
              ),
              const SizedBox(
                height: kPS20x,
              ),
              Text(kDescriptionText, style: GoogleFonts.aBeeZee(fontSize: kPS20x)),
              const SizedBox(
                height: kPS20x,
              ),
              Text(
                "It is a long established fact that a reader will be distracted by the It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                style: GoogleFonts.abyssinicaSil(color: Colors.grey),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      )
    ],
  );
}
Widget _buildDetailInfo(String text, IconData icon, {Color? color}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.cyan.withOpacity(0.1),
      borderRadius: BorderRadius.circular(kPS10x),
    ),
    padding: const EdgeInsets.all(kPS10x),
    child: Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        const SizedBox(width: kPS5x),
        Text(text),
      ],
    ),
  );
}