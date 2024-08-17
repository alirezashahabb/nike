import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nike/common/exception.dart';
import 'package:nike/data/model/comment.dart';
import 'package:nike/data/repo/comment_repo.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentListBloc extends Bloc<CommentEvent, CommentState> {
  final ICommentRepository _commentRepository;
  final int productId;
  CommentListBloc(this._commentRepository, this.productId)
      : super(CommentLoadingState()) {
    on<CommentEvent>((event, emit) async {
      if (event is CommentInitEvent || event is CommentRefreshEvent) {
        try {
          emit(CommentLoadingState());
          final comment = await _commentRepository.getComment(productId);
          emit(CommentSuccessState(commentList: comment));
        } catch (e) {
          emit(
            CommentErrorState(
              appException: e is AppException ? e : AppException(),
            ),
          );
        }
      }
    });
  }
}
