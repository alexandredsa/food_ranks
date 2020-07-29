import 'package:flutter/material.dart';
import 'package:food_ranks/screens/summaries.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FoodRanks',
        theme: ThemeData(
          fontFamily: 'Ubuntu',
        ),
        home: Summaries(),
      ),
    );
  }
}