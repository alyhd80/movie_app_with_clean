import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  final String title;
  const CategoryText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  EdgeInsets.only(top: 12.0,left: 10),
      child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
    );
  }
}
