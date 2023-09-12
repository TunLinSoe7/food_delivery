import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/images.dart';
class CategoryViewItems extends StatelessWidget {
  const CategoryViewItems({super.key, required this.image, required this.name});
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: 10, left: 15, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: image,
                placeholder: (_,url)=>Image.asset(kFoodPlaceholderImage,fit: BoxFit.fill,),
                errorWidget: (_,url,error)=>const CircularProgressIndicator(),)),
          Text(name)
        ],
      ),
    );
  }
}

class ListViewScrollItemsView extends StatelessWidget {
  const ListViewScrollItemsView({super.key, required this.width, required this.image, required this.onTap});
  final double width;
  final String image;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: InkWell(
          onTap: onTap,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:  CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: image,
                placeholder: (_,url)=>Image.asset(kFoodPlaceholderImage,fit: BoxFit.fill,),
                errorWidget: (_,url,error)=>const CircularProgressIndicator(),)),
        ));
  }
}

class ProductItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final String store;
  final String rating;
  final String price;
  final String heroTag;
  final GestureTapCallback onTap;

  const ProductItemWidget({super.key,
    required this.image,
    required this.title,
    required this.store,
    required this.rating,
    required this.heroTag,
    required this.price, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 110,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              child: GestureDetector(
                  onTap: onTap,
                  child:  Hero(
                    tag: heroTag,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: image,
                      placeholder: (_,url)=>Image.asset(kFoodPlaceholderImage,fit: BoxFit.fill,),
                      errorWidget: (_,url,error)=>const CircularProgressIndicator(),
                    ),
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      store,
                      style: GoogleFonts.poppins(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(rating),
                  ],
                ),
                Text(
                  price,
                  style: GoogleFonts.poppins(
                    color: Colors.cyan.withOpacity(0.7),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
