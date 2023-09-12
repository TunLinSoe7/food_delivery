import 'package:food_order_demo/data/vos/food_for_yor_vo/food_for_you_vo.dart';
import '../../data/vos/category_vo/category_vo.dart';
import '../../data/vos/product_vo/product_vo.dart';


abstract class ProductDataAgent{
  ///Categories
  Stream<List<CategoryVO>?> getCategoryListStream();
  //Future<CategoryVO> getCategoryByID(int id);
  Future saveCategory(CategoryVO categoryVO);
  Future deleteCategory(id);
  ///Daily Discount
  Stream<List<ProductVO>?> getProductListStream();
  //Future<ProductVO> getProductByID(int id);
  Future saveProduct(ProductVO productVO);
  ///Food For You
  Stream<List<FoodForYouVO>?> getFoodForYouListStream();
  Future<FoodForYouVO> getFoodForYorProductByID(int id);

}