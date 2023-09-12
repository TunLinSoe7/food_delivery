import 'package:food_order_demo/data/model/product_model.dart';
import 'package:food_order_demo/data/vos/category_vo/category_vo.dart';

import 'package:food_order_demo/utils/enums.dart';

import '../data/vos/food_for_yor_vo/food_for_you_vo.dart';
import '../data/vos/product_vo/product_vo.dart';
import 'base_provider.dart';
class HomePageBloc extends BaseBloc{
  bool _isDispose = false;
 final ProductModel _productModel = ProductModel();
  int _currentIndex = 0;
  List<CategoryVO>? _categoryList;
  List<ProductVO>? _productList;
  List<FoodForYouVO>? _foodForYouList;
  int get currentIndex => _currentIndex;
  List<CategoryVO>? get getCategoryList=>_categoryList;
  List<ProductVO>? get getProductList=>_productList;
  List<FoodForYouVO>? get getFoodForYouList=>_foodForYouList;

 HomePageBloc(){
   setLoadingState = LoadingState.loading;
   notifyListeners();
   ///Categories
 _productModel.getCategoryListStream().listen((event) {
    if(event?.isEmpty ?? true){
      setLoadingState = LoadingState.loading;
      setErrorMessage="Check NetWork Connection";
    }else{
      setLoadingState = LoadingState.complete;
      _categoryList = event;
      notifyListeners();
    }
 },onError: (error){
   setErrorMessage = error.toString();
   notifyListeners();
 });
 ///Discount Product
 _productModel.getProductListStream().listen((event) {
   if(event!=null){
      _productList = event;
   }
   notifyListeners();
 });
 ///Food For Yor
 _productModel.getFoodForYouByStream().listen((event) {
   print("=============>${event?.length}");
   if(event!=null){
      _foodForYouList = event;
   }
   notifyListeners();
 });

 }
  void changeIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
  @override
  void dispose() {
    _isDispose =true;
    super.dispose();
  }
  @override
  void notifyListeners() {
    if(!_isDispose){
      super.notifyListeners();
    }
  }
}