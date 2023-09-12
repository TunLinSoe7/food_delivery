import 'package:flutter/material.dart';
import 'package:food_order_demo/constant/dimens.dart';
import 'package:food_order_demo/data/vos/food_for_yor_vo/food_for_you_vo.dart';
import 'package:food_order_demo/pages/product_detail_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../constant/string.dart';
import '../controllers/home_page_provider.dart';
import '../data/vos/category_vo/category_vo.dart';
import '../view_items/home_page_view_items.dart';
import '../widgets/app_bar_resuable_widget.dart';
import '../widgets/grid_view_builder_widget.dart';
import '../widgets/listview_scroll_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, Key? key1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7F9),
      appBar: PreferredSize(preferredSize: const Size.fromHeight(50),
      child: AppBarResuableWidget(
        leadingOnTap: () {

        },
        leadingIcon: Icons.sort,
        isTrue: true,
        color: Colors.cyan.withOpacity(0.8),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildLocationSearchBar(context),
            _buildCategoryList(context),
            _buildDiscountForYou(context),
            _buildFoodForYou(context),
          ],
        ),
      ),
    );
  }
  ///LocationSearchBarWidgetView
  Widget _buildLocationSearchBar(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding:  const EdgeInsets.only(top: kPS10x, right: kPS10x, left: kPS10x, bottom: kPS20x),
      color: Colors.cyan.withOpacity(0.8),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_outlined, color: Colors.white, size: kPS20x),
              Text(
                "Yangon, Hlaing Township, No.72",
                style: GoogleFonts.poppins(color: Colors.white, fontSize: kPS13x),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: kPS25x,
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: kPS10x),
            width: width * 0.9,
            padding: const EdgeInsets.all(kPS15x),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kPS10x),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Text(
                  "Search Product Here",
                  style: GoogleFonts.poppins(color: Colors.black, fontSize: kPS13x),
                ),
                const Spacer(),
                const Icon(
                  Icons.search,
                  size: kPS25x,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  ///CategoryListWidgetView
  Widget _buildCategoryList(BuildContext context) {
    return Selector<HomePageBloc, List<CategoryVO>?>(
      selector: (_, bloc) => bloc.getCategoryList,
      builder: (_, category, __) {
        return category == null
            ? const CircularProgressIndicator()
            : SizedBox(
          height: kPS100x,
          child: ListViewScrollWidget(
            itemCount: category.length,
            itemBuilder: (_, index) {
              return CategoryViewItems(image: "${category[index].image}", name: "${category[index].name}");
            },
          ),
        );
      },
    );
  }
///DiscountForYouTextWidgetView
  Widget _buildDiscountForYou(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPS15x),
      child: Row(
        children: [
          Text(kDailyDiscountText, style: GoogleFonts.abyssinicaSil(fontSize: kPS20x)),
        ],
      ),
    );
  }
  ///DiscountForYouWidgetView
  Widget _buildFoodForYou(BuildContext context) {
    return Selector<HomePageBloc, List<FoodForYouVO>?>(
      selector: (_, bloc) => bloc.getFoodForYouList,
      builder: (_, foodForYou, __) {
        return Padding(
          padding: const EdgeInsets.all(kPS15x),
          child: foodForYou == null
              ? const Center(child: CircularProgressIndicator())
              : GridViewBuilderWidget(
            itemCount: foodForYou.length,
            count: kPS2x,
            itemBuilder: (BuildContext context, int index) {
              return ProductItemWidget(
                image: "${foodForYou[index].image}",
                title: "${foodForYou[index].name}",
                store: "Hlaing Store",
                rating: "5.4",
                price: "\$ ${foodForYou[index].price}",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductDetailPage(id: foodForYou[index].id ?? 0)));
                },
                heroTag: "${foodForYou[index].name}hero",
              );
            },
          ),
        );
      },
    );
  }
}