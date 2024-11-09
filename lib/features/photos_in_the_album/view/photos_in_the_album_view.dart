import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/albums_of_user/model/albums_of_user.dart';
import 'package:infinity_list_comments/features/photos_in_the_album/bloc/photos_in_the_album_bloc.dart';
import 'package:infinity_list_comments/features/photos_in_the_album/view/components/photos_in_the_album_item.dart';
import 'package:infinity_list_comments/theme/theme_service.dart';
import 'package:infinity_list_comments/widgets/error_message_display.dart';
import 'package:infinity_list_comments/widgets/loading_state_display.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PhotosInTheAlbumView extends StatefulWidget {
  final AlbumsOfUser albumsOfUser;

  const PhotosInTheAlbumView({super.key, required this.albumsOfUser});

  @override
  State<PhotosInTheAlbumView> createState() => _PhotosInTheAlbumViewState();
}

class _PhotosInTheAlbumViewState extends State<PhotosInTheAlbumView> {
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<PhotosInTheAlbumBloc>().add(
      FetchPhotosFromAlbumEvent(albumId: widget.albumsOfUser.id ?? 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosInTheAlbumBloc, PhotosInTheAlbumState>(
      builder: (context, state) {
        return switch (state.status) {
          PhotosInTheAlbumStatus.initial => const LoadingStateDisplay(),
          PhotosInTheAlbumStatus.success => _buildSuccessContent(state),
          PhotosInTheAlbumStatus.failure =>
              ErrorMessageDisplay(message: state.errorMessage),
        };
      },
    );
  }

  Widget _buildSuccessContent(PhotosInTheAlbumState state) {
    return Center(
      child: CarouselSlider.builder(
        carouselController: _carouselController,
        itemCount: state.hasReachedMax ? state.photos.length : state.photos.length + 1,
        itemBuilder: (context, index, realIndex) {
          if (index >= state.photos.length) {
            return const LoadingStateDisplay();
          }
          return PhotosInTheAlbumItem(photosOfUser: state.photos[index]);
        },
        options: CarouselOptions(
          height: themeService.screenHeight * .65,
          aspectRatio: 16/9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
            if (_currentIndex >= state.photos.length - 1 && !state.hasReachedMax) {
              context.read<PhotosInTheAlbumBloc>().add(
                FetchPhotosFromAlbumEvent(albumId: widget.albumsOfUser.id ?? 0),
              );
            }
          },
        ),
      ),
    );
  }
}
