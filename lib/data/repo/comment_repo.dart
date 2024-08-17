import 'package:dio/dio.dart';
import 'package:nike/common/end_point.dart';
import 'package:nike/data/model/comment.dart';
import 'package:nike/data/source/comment_data_source.dart';

Dio httpClient = Dio(BaseOptions(
  baseUrl: EndPoint.baseUrl,
));

final commentRepo = CommentRepository(CommentRemoteDataSource(httpClient));

abstract class ICommentRepository {
  Future<List<CommentModel>> getComment(int productId);
}

class CommentRepository extends ICommentRepository {
  final ICommentDataSource _commentDataSource;

  CommentRepository(this._commentDataSource);
  @override
  Future<List<CommentModel>> getComment(int productId) =>
      _commentDataSource.getComment(productId);
}
