import 'package:dio/dio.dart';
import 'package:nike/common/http_response_validator.dart';
import 'package:nike/data/model/banner.dart';

abstract class IBannerDataSource {
  Future<List<BannerModel>> getBanner();
}

class BannerRemoteDataSource
    with HttpResponseValidator
    implements IBannerDataSource {
  final Dio httpClient;

  BannerRemoteDataSource(this.httpClient);
  @override
  Future<List<BannerModel>> getBanner() async {
    Response response = await httpClient.get('banner/slider');
    validator(response);
    List<BannerModel> bannerList = [];

    for (var element in (response.data as List)) {
      bannerList.add(BannerModel.fromJson(element));
    }
    return bannerList;
  }
}
