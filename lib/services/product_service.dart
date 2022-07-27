part of 'services.dart';

class ProductServices {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<List<ProductModel>> getProduct() async {
    var url = Uri.parse('$baseUrl/products');
    var headers = {"Content-Type": "application/json"};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products =
          (data).map((e) => ProductModel.fromJson(e)).toList();

      return products;
    } else {
      throw Exception('Gagal get product');
    }
  }
}
