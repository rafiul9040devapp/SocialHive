import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/post/bloc/post_bloc.dart';
import 'package:infinity_list_comments/features/post/view/components/post_item.dart';
import 'package:infinity_list_comments/widgets/error_message_display.dart';

import '../../comment/view/components/bottom_loader.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<PostBloc>().add(FetchPostEvent());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(builder: (context, state) {
      switch (state.status) {
        case PostStatus.initial:
          return const Center(child: CircularProgressIndicator());
        case PostStatus.success:
          if (state.posts.isEmpty) {
            return const Center(child: Text('No Post Is Available'));
          }

          return ListView.builder(
            itemBuilder: (context, index) {
              return index >= state.posts.length
                  ? const  BottomLoader()
                  : PostItem(post: state.posts[index]);
            },
            itemCount: state.hasReachedMax ? state.posts.length : state.posts.length + 1,
            controller: _scrollController,
          );

        case PostStatus.failure:
          return ErrorMessageDisplay(message: state.errorMessage);
      }
    });
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(FetchPostEvent());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * .8);
  }
}
