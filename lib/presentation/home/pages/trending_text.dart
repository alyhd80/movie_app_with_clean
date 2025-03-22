import 'package:flutter/material.dart';

class TrendingText extends StatelessWidget {
  const TrendingText({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Padding(
      padding:  EdgeInsets.only(top: 12.0,left: 10),
      child: Text("Tredings ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
    );
  }
}
