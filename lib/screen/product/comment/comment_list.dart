import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike/data/model/comment.dart';
import 'package:nike/data/model/product.dart';
import 'package:nike/data/repo/comment_repo.dart';
import 'package:nike/screen/product/comment/bloc/comment_bloc.dart';
import 'package:nike/widget/error_state.dart';

class CommentList extends StatelessWidget {
  final ProductModel productModel;
  const CommentList({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final comment = CommentListBloc(commentRepo, productModel.id);
        comment.add(CommentInitEvent());
        return comment;
      },
      child: BlocBuilder<CommentListBloc, CommentState>(
        builder: (context, state) {
          if (state is CommentLoadingState) {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is CommentSuccessState) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: state.commentList.length,
                (context, index) {
                  return CommentItem(
                    commentModel: state.commentList[index],
                  );
                },
              ),
            );
          } else if (state is CommentErrorState) {
            return SliverToBoxAdapter(
                child: ErrorState(
              exception: state.appException,
              onTap: () {
                BlocProvider.of<CommentListBloc>(context).add(
                  CommentRefreshEvent(),
                );
              },
            ));
          } else {
            throw ('stat is not support');
          }
        },
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  final CommentModel commentModel;
  const CommentItem({
    super.key,
    required this.commentModel,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.fromLTRB(8, 10, 8, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(commentModel.title),
                Text(
                  commentModel.date,
                  style: themeData.textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              commentModel.email,
              style: themeData.textTheme.bodySmall,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(commentModel.content)
          ],
        ));
  }
}
