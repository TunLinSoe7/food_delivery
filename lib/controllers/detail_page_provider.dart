import 'package:food_order_demo/data/model/product_model.dart';
import 'package:food_order_demo/data/vos/cart_vo/cart_vo.dart';
import 'package:food_order_demo/data/vos/food_for_yor_vo/food_for_you_vo.dart';
import 'package:food_order_demo/data/vos/product_vo/product_vo.dart';
import 'base_provider.dart';

class DetailPageBloc extends BaseBloc{
  final ProductModel _productModel=ProductModel();
  int _quantity= 1;
  FoodForYouVO? foodForYouVO;
  ProductVO? categoryVO;
  FoodForYouVO? _foodForYouListByID;
  bool _isDispose = false;
  get getQuantity=>_quantity;
  FoodForYouVO? get getFoodForYouListByID=>_foodForYouListByID;

  ///Add Product To Cart
  void addToCart(FoodForYouVO? foodForYouVO,int quantity){
    final cart = CartVO(foodForYouVO: foodForYouVO!,quantity:quantity );
    if(foodForYouVO!=null){
       _productModel.saveCart(cart);
    }
  }
  DetailPageBloc({required int feedID}) {
    _productModel.getFoodForYouByID(feedID).then((value) {
      if(value!=null){
        _foodForYouListByID = value;
      }
      notifyListeners();
    });

  }


  @override
  void dispose() {
    _isDispose=true;
    super.dispose();
  }
  @override
  void notifyListeners() {
     if(!_isDispose){
       super.notifyListeners();
     }
  }
}