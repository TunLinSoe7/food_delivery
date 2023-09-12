import 'package:flutter/material.dart';

import 'package:food_order_demo/constant/hive_constant.dart';
import 'package:food_order_demo/data/vos/cart_vo/cart_vo.dart';
import 'package:food_order_demo/utils/enums.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'controllers/home_page_provider.dart';
import 'data/vos/food_for_yor_vo/food_for_you_vo.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(FoodForYouVOAdapter());
  Hive.registerAdapter(CartVOAdapter());
  await Hive.openBox<FoodForYouVO>(kFoodForYouBoxName);
  await Hive.openBox<CartVO>(kCartBoxName);

  runApp(
      MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (_)=>HomePageBloc()),

      ],child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageBloc bloc = Provider.of<HomePageBloc>(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food Order",
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bloc.currentIndex,
            onTap: (index){
              bloc.changeIndex(index);
            },
            type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.cyan.withOpacity(0.7),
              unselectedItemColor: Colors.black.withOpacity(0.4),
              items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.feed),label: "Orders"),
            BottomNavigationBarItem(icon: Icon(Icons.history),label: "History"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined),label: "Profile"),
          ]),
          body: Selector<HomePageBloc,int>(
            selector: (_,bloc)=>bloc.currentIndex,
            builder: (_,currentIndex,__){
              return IndexedStack(
                index: currentIndex,
                children: Pages.values.map((e) => e.pages).toList(),
              );
            },
          )),
    );
  }
}

