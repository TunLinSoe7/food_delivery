import 'package:food_order_demo/constant/hive_constant.dart';
import 'package:food_order_demo/data/vos/cart_vo/cart_vo.dart';
import 'package:food_order_demo/persistant/daos/cart_dao/cart_dao.dart';
import 'package:hive/hive.dart';

class CartDAOImpl extends CartDAO{
  @override
  List<CartVO> getCartVO() =>_cartBox().values.toList();

  @override
  Stream<List<CartVO>?> getCartVOFromStream()=>Stream.value(getCartVO());

  @override
  void save(CartVO cartVO) {
    if(cartVO!=null){
      _cartBox().put(cartVO.foodForYouVO.id, cartVO);
    }
  }

  @override
  Stream watch() =>_cartBox().watch();
  Box<CartVO> _cartBox()=>Hive.box(kCartBoxName);
}