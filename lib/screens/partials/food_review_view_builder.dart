import 'package:flutter/material.dart';
import 'package:food_ranks/models/food_review.dart';
import 'package:food_ranks/models/food_summary.dart';
import 'package:food_ranks/screens/partials/item_dismissable.dart';

class FoodReviewViewBuilder {
  final Function onFoodReviewDelete;

  FoodReviewViewBuilder(this.onFoodReviewDelete);
  Widget buildCategoryNoteDisplay(double value, String display, {bool highlight = false}) {
    return Padding(padding: EdgeInsets.all(5),
        child: Column(
            children: <Widget>[
              Text(value.toStringAsFixed(2), style: TextStyle(fontSize: highlight ? 22 : 18, fontWeight: FontWeight.bold, color: !highlight? Colors.black54 : Colors.red)),
              Text(display, style: TextStyle(fontSize: 12, color: !highlight? Colors.black26 : Colors.redAccent),)
            ]
        )
    );
  }

  Widget buildResults(List<FoodReview> foodReviews) {
    return ListView.separated(
      itemCount: foodReviews?.length ?? 0,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {
        final review = foodReviews[index];
        return ItemDismissableBuilder(context).build(Card(
            elevation: 3,
            margin: EdgeInsets.only(left: 8, right: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(5), child: Text(review.name.toUpperCase(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        buildCategoryNoteDisplay(review.texture, "textura"),
                        buildCategoryNoteDisplay(review.sauce, "molho"),
                        buildCategoryNoteDisplay(review.flavor, "sabor"),
                        buildCategoryNoteDisplay(review.average, "total", highlight: true),
                      ],)

                  ],
                ),
              ],)

        ), (direction) => onFoodReviewDelete(direction, review), Key(review.id));
      },
    );
  }
}