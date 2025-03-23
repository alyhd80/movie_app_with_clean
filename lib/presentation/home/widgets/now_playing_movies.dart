import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/core/config/asssets/app_imagess.dart';
import 'package:movie_app/presentation/home/bloc/now_playing_cubit.dart';
import 'package:movie_app/presentation/home/bloc/now_playing_state.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlayingCubit()..getNowPlayingMovies(),
      child: BlocBuilder<NowPlayingCubit, NowPlayingState>(
          builder: (context, state) {
        if (state is NowPlayingMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is NowPlayingMoviesLoaded) {
          return Container(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context,index){
                  return MovieCard(movieEntity: state.movies[index]!);
                },
                separatorBuilder: (context,index)=>const SizedBox(width: 10,),
                itemCount: state.movies.length),
          );
        }
        if (state is FailureLoadNowPlayingMovies) {
          return Text(state.errorMessage);
        }

        return Container();
      }),
    );
  }
}
