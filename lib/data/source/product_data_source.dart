import 'package:dio/dio.dart';
import 'package:nike/common/http_response_validator.dart';
import 'package:nike/data/model/product.dart';

abstract class IProductDataSource {
  Future<List<ProductModel>> getAll(int sort);
  Future<List<ProductModel>> getSearch(String search);
}

class ProductRemoteDataSource
    with HttpResponseValidator
    implements IProductDataSource {
  final Dio httpClient;

  ProductRemoteDataSource(this.httpClient);
  @override
  Future<List<ProductModel>> getAll(int sort) async {
    Response response = await httpClient.get('product/list?sort=$sort');
    validator(response);
    List<ProductModel> productList = [];

    for (var element in (response.data as List)) {
      productList.add(ProductModel.fromJson(element));
    }

    return productList;
  }

  @override
  Future<List<ProductModel>> getSearch(String search) async {
    Response response = await httpClient.get('/product/search?q=$search');
    validator(response);
    List<ProductModel> productList = [];

    for (var element in (response.data as List)) {
      productList.add(ProductModel.fromJson(element));
    }

    return productList;
  }
}
