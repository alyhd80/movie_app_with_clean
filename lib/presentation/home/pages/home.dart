import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/app_bar/app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/constants/app_vectors.dart';
import 'package:movie_app/presentation/home/widgets/category_text.dart';
import 'package:movie_app/presentation/home/widgets/now_playing_movies.dart';
import 'package:movie_app/presentation/home/widgets/popular_tv.dart';
import 'package:movie_app/presentation/home/widgets/tranding_movies.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SvgPicture.asset(AppVectors.logo),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        CategoryText(title: "Trendings"),
          TrendingMovies(),
          SizedBox(height: 16,),
          CategoryText(title: "Now Playing"),
          SizedBox(height: 16,),

          NowPlayingMovies(),
          SizedBox(height: 16,),
          CategoryText(title: "Popular TV"),
          SizedBox(height: 16,),
        PopularTv(),
          SizedBox(height: 16,),



        ],),
      ),
    );
  }
}
