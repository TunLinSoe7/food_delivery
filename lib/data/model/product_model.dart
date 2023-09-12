import 'package:food_order_demo/data/vos/category_vo/category_vo.dart';
import 'package:food_order_demo/network/data_agent/product_data_agent.dart';
import 'package:food_order_demo/network/data_agent/product_data_agent_impl.dart';
import 'package:food_order_demo/persistant/daos/cart_dao/cart_dao_impl.dart';
import '../../persistant/daos/cart_dao/cart_dao.dart';
import '../vos/cart_vo/cart_vo.dart';
import '../vos/food_for_yor_vo/food_for_you_vo.dart';
import '../vos/product_vo/product_vo.dart';
import 'package:stream_transform/stream_transform.dart';
class ProductModel {
  ProductModel._();

  static final ProductModel _singleton = ProductModel._();

  factory ProductModel() => _singleton;

  final ProductDataAgent _productDataAgent = ProductDataAgentImpl();
  final CartDAO _cartDAO = CartDAOImpl();

  void saveFeed(CategoryVO categoryVO) => _productDataAgent.saveCategory(categoryVO);

  Future deleteProduct(int id) => _productDataAgent.deleteCategory(id);

  Stream<List<CategoryVO>?> getCategoryListStream() => _productDataAgent.getCategoryListStream();
  ///ProductVO
  void saveProduct(ProductVO productVO)=>_productDataAgent.saveProduct(productVO);
  Stream<List<ProductVO>?> getProductListStream()=>_productDataAgent.getProductListStream();
  ///FoodForYou
  Future<FoodForYouVO> getFoodForYouByID(int id)=>_productDataAgent.getFoodForYorProductByID(id);
  Stream<List<FoodForYouVO>?> getFoodForYouByStream()=>_productDataAgent.getFoodForYouListStream();
  ///CartItemVO
   Stream<List<CartVO>> getCartFromStream()=>_cartDAO.watch().startWith(_cartDAO.getCartVOFromStream())
       .map((event) => _cartDAO.getCartVO());
   void saveCart(CartVO cartVO)=>_cartDAO.save(cartVO);
}
