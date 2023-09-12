import '../data/model/product_model.dart';
import '../data/vos/cart_vo/cart_vo.dart';
import 'base_provider.dart';
class CartPageBloc extends BaseBloc{
  List<CartVO>? getCartList;
  final ProductModel _productModel=ProductModel();
  CartPageBloc(){
    ///CartItems
    _productModel.getCartFromStream().listen((event) {
      if(event!=null){
        getCartList =event;
      }
      notifyListeners();
    });
  }
  double get totalPrice {
    double total = 0.0;
    for (final product in getCartList!) {
      final priceString = product.foodForYouVO.price; // Default to '0' if price is null
      final price = double.tryParse(priceString.toString()) ?? 0.0; // Try parsing the price as a double, default to 0.0 if parsing fails
      final quantity = product.quantity ?? 0; // Default to 0 if quantity is null
      total += price * quantity;
    }
    return total;
  }


  void increaseCount(CartVO? productVO){
    productVO?.quantity = (productVO.quantity ?? 0)+1;
    notifyListeners();
  }
  void decreaseCount(CartVO? productVO){
    productVO?.quantity = (productVO.quantity ?? 0)-1;
    notifyListeners();
  }

}