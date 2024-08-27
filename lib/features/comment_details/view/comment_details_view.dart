import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/comment_details/bloc/comment_details_bloc.dart';
import 'package:infinity_list_comments/features/comment_details/view/components/comment_details.dart';

class CommentDetailsView extends StatelessWidget {
  const CommentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentDetailsBloc,CommentDetailsState>(builder: (context,state){
      switch(state.status) {
        case CommentDetailsStatus.loading:
          return const Center(child: CircularProgressIndicator());
        case CommentDetailsStatus.success:
          final comment = state.album;
          return CommentDetails(album: comment);
        case CommentDetailsStatus.failure:
        return Center(child: Text(state.errorMessage));
      }
    });
  }
}
