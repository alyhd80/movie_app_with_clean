import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/app_bar/app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/constants/app_vectors.dart';
import 'package:movie_app/presentation/home/pages/trending_text.dart';
import 'package:movie_app/presentation/home/widgets/tranding.dart';
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
          TrendingText(),
          TrendingMovies()
        ],),
      ),
    );
  }
}
