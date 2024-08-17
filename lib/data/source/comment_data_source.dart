import 'package:dio/dio.dart';
import 'package:nike/common/http_response_validator.dart';
import 'package:nike/data/model/comment.dart';

abstract class ICommentDataSource {
  Future<List<CommentModel>> getComment(int productId);
}

class CommentRemoteDataSource extends ICommentDataSource
    with HttpResponseValidator {
  final Dio httpClient;

  CommentRemoteDataSource(this.httpClient);
  @override
  Future<List<CommentModel>> getComment(int productId) async {
    Response response =
        await httpClient.get('comment/list?product_id=$productId');
    validator(response);
    List<CommentModel> commentList = [];

    for (var element in (response.data as List)) {
      commentList.add(CommentModel.fromJson(element));
    }
    return commentList;
  }
}
