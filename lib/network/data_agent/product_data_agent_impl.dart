import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_order_demo/data/vos/category_vo/category_vo.dart';
import 'package:food_order_demo/data/vos/food_for_yor_vo/food_for_you_vo.dart';
import 'package:food_order_demo/data/vos/product_vo/product_vo.dart';
import 'package:food_order_demo/network/data_agent/product_data_agent.dart';


class ProductDataAgentImpl extends ProductDataAgent{
  ProductDataAgentImpl._();
static final ProductDataAgentImpl _singleton=ProductDataAgentImpl._();
factory ProductDataAgentImpl()=>_singleton;
final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;
  ///Categories
  @override
  Future deleteCategory(id) =>_firebaseFireStore.collection('categories').doc(id.toString()).delete();
  @override
  Future<CategoryVO> getCategoryByID(int id) async{
    return _firebaseFireStore.collection('categories').doc(id.toString()).get().then((value) {
      final rawData = value.data();
      return CategoryVO.fromJson(Map<String, dynamic>.from(rawData as Map));
    });
  }

  @override
  Stream<List<CategoryVO>?> getCategoryListStream() =>
      _firebaseFireStore.collection('categories').snapshots().map(
              ( querySnapShot) => querySnapShot.docs
              .map<CategoryVO>((document) =>
              CategoryVO.fromJson(document.data()))
              .toList());

  @override
  Future saveCategory(CategoryVO categoryVO)=>_firebaseFireStore.
  collection('categories').doc(categoryVO.id.toString()).set(categoryVO.toJson());
  //
  // ///ProductVO
  // @override
  // Future<ProductVO> getProductByID(int id){
  //   return _firebaseFireStore.collection('sliderProducts').doc(id.toString()).get().then((value) {
  //     final rawData = value.data();
  //     return ProductVO.fromJson(Map<String, dynamic>.from(rawData as Map));
  //   });
  // }
  @override
  Stream<List<ProductVO>?> getProductListStream() =>
      _firebaseFireStore.collection('sliderProducts').snapshots().map(
              ( querySnapShot) => querySnapShot.docs
              .map<ProductVO>((document) =>
              ProductVO.fromJson(document.data()))
              .toList());
  @override
  Future saveProduct(ProductVO productVO)=>_firebaseFireStore.collection('sliderProducts')
      .doc(productVO.id.toString()).set(productVO.toJson());
///Food For You Data Get By ID
@override
  Future<FoodForYouVO> getFoodForYorProductByID(int id) async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodforyou')
        .where('id', isEqualTo: id)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      final productData = querySnapshot.docs.first.data() as Map<String, dynamic>;
      return FoodForYouVO.fromJson(Map<String,dynamic>.from(productData));
    } else {
      return throw Exception("Id not exist");
    }
  }

  ///Food For You Data Get By Stream
  @override
  Stream<List<FoodForYouVO>?> getFoodForYouListStream(){
    return _firebaseFireStore.collection('foodforyou').snapshots().
    map((event) =>event.docs.map<FoodForYouVO>((document) {
      FoodForYouVO foodForYouVO = FoodForYouVO.fromJson(document.data());
      return foodForYouVO;
    }).toList());
  }
}