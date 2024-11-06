import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:infinity_list_comments/features/photos_of_user/bloc/photos_of_user_bloc.dart';
import 'package:infinity_list_comments/widgets/loading_state_display.dart';

import '../../../widgets/error_message_display.dart';
import '../../comment/view/components/bottom_loader.dart';
import 'component/photo_of_user_item.dart';

class PhotosOfUserView extends StatefulWidget {
  final int profileId;

  const PhotosOfUserView({super.key, required this.profileId});

  @override
  State<PhotosOfUserView> createState() => _PhotosOfUserViewState();
}

class _PhotosOfUserViewState extends State<PhotosOfUserView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context
        .read<PhotosOfUserBloc>()
        .add(FetchAllPhotosOfUser(profileId: widget.profileId));
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosOfUserBloc, PhotosOfUserState>(
      builder: (context, state) {
        return switch (state.status) {
          PhotoOfUserStatus.initial => const LoadingStateDisplay(),
          PhotoOfUserStatus.success => GridView.custom(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  const QuiltedGridTile(2, 2),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 2),
                ],
              ),
              controller: _scrollController,
              childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {

                    return  index >= state.photos.length
                          ? const  BottomLoader()
                          : PhotoOfUserItem(photosOfUser: state.photos[index]);

                },
                childCount: state.hasReachedMax
                    ? state.photos.length
                    : state.photos.length + 1,
              ),
            ),
          PhotoOfUserStatus.failure =>
            ErrorMessageDisplay(message: state.errorMessage),
        };
      },
    );
  }

  void _onScroll() {
    if (_isBottom) {
      context
          .read<PhotosOfUserBloc>()
          .add(FetchAllPhotosOfUser(profileId: widget.profileId));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * .8);
  }
}
