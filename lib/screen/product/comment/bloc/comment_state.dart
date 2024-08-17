part of 'comment_bloc.dart';

sealed class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

final class CommentLoadingState extends CommentState {}

final class CommentSuccessState extends CommentState {
  final List<CommentModel> commentList;

  const CommentSuccessState({required this.commentList});
  @override
  // TODO: implement props
  List<Object> get props => [commentList];
}

final class CommentErrorState extends CommentState {
  final AppException appException;

  const CommentErrorState({required this.appException});

  @override
  // TODO: implement props
  List<Object> get props => [appException];
}
