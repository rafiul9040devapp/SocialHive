import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../bloc/comment_bloc.dart';
import 'components/bottom_loader.dart';
import 'components/comment_item.dart';

class CommentView extends StatefulWidget {
  const CommentView({super.key});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<CommentBloc>().add(FetchCommentEvent());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        switch (state.status) {

          case CommentStatus.initial:
            return const Center(child: CircularProgressIndicator());

          case CommentStatus.success:
            if (state.albums.isEmpty) {
              if (state.hasReachedMax) {
                return Center(child: Text(state.errorMessage));
              } else {
                return const Center(child: Text('no album available'));
              }
            }

            return ListView.builder(
              itemBuilder: (context, index) {
                return index >= state.albums.length
                    ? const  BottomLoader()
                    : CommentItem(album: state.albums[index]);
              },
              itemCount: state.hasReachedMax ? state.albums.length : state.albums.length + 1,
              controller: _scrollController,
            );

          case CommentStatus.failure:
            return Center(child: Text(state.errorMessage));
        }
      },
    );
  }

  void _onScroll() {
    if (_isBottom) context.read<CommentBloc>().add(FetchCommentEvent());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * .9);
  }
}
