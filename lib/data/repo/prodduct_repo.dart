import 'package:dio/dio.dart';
import 'package:nike/common/end_point.dart';
import 'package:nike/data/model/product.dart';
import 'package:nike/data/source/product_data_source.dart';

Dio httpClient = Dio(BaseOptions(
  baseUrl: EndPoint.baseUrl,
));

final productRepo = ProductRepository(ProductRemoteDataSource(httpClient));

abstract class IProductRepository {
  Future<List<ProductModel>> getAll(int sort);
  Future<List<ProductModel>> getSearch(String search);
}

class ProductRepository implements IProductRepository {
  final IProductDataSource _dataSource;

  ProductRepository(this._dataSource);
  @override
  Future<List<ProductModel>> getAll(int sort) => _dataSource.getAll(sort);

  @override
  Future<List<ProductModel>> getSearch(String search) =>
      _dataSource.getSearch(search);
}
