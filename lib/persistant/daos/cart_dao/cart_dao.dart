import 'package:food_order_demo/data/vos/cart_vo/cart_vo.dart';

abstract class CartDAO{
  void save(CartVO cartVO);
  List<CartVO> getCartVO();
  Stream watch();
  Stream<List<CartVO>?> getCartVOFromStream();
}