part of 'provider.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;
  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getsProduct() async {
    try {
      List<ProductModel> products = await ProductServices().getProduct();
      _products = products;
    } catch (e) {
      print(e);
    }
  }
}
