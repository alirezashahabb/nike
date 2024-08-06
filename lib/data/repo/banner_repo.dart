import 'package:dio/dio.dart';
import 'package:nike/common/end_point.dart';
import 'package:nike/data/model/banner.dart';
import 'package:nike/data/source/banner_data_source.dart';

Dio httpClient = Dio(BaseOptions(
  baseUrl: EndPoint.baseUrl,
));

final bannerRepo = BannerRepo(
  BannerRemoteDataSource(httpClient),
);

abstract class IBannerRep {
  Future<List<BannerModel>> getBanner();
}

class BannerRepo implements IBannerRep {
  final IBannerDataSource _dataSource;

  BannerRepo(this._dataSource);
  @override
  Future<List<BannerModel>> getBanner() => _dataSource.getBanner();
}
