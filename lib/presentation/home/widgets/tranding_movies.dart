import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/config/asssets/app_imagess.dart';
import 'package:movie_app/presentation/home/bloc/trending_cubit.dart';
import 'package:movie_app/presentation/home/bloc/trending_state.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(),
      child:
          BlocBuilder<TrendingCubit, TrendingState>(builder: (context, state) {
        if (state is TrendingMoviesLoading) {
          return const Center(child:CircularProgressIndicator());
        }
        if (state is TrendingMoviesLoaded) {
          return FanCarouselImageSlider.sliderType1(
            imagesLink: state.movies.map((item) {
              print(AppImages.movieImageBasePath + item.posterPath.toString());
              return AppImages.movieImageBasePath + item.posterPath.toString();
            }).toList(),
            isAssets: false,
            autoPlay: false,
            sliderHeight: 400,
            showIndicator: true,
          );
        }
        if (state is FailureLoadTrendingMovies) {
          return Text(state.errorMessage);
        }

        return Container();
      }),
    );
  }
}
