import 'package:flutter/material.dart';
import 'package:food_ranks/blocs/food_review_bloc.dart';
import 'package:food_ranks/models/food_review.dart';
import 'package:food_ranks/models/food_summary.dart';
import 'package:provider/provider.dart';

class ReviewForm extends StatefulWidget {
  final FoodSummary foodSummary;

  const ReviewForm({Key key, this.foodSummary}) : super(key: key);
  @override
  ReviewFormState createState() {
    return ReviewFormState(foodSummary);
  }
}
// Create a corresponding State class. This class holds data related to the form.
class ReviewFormState extends State<ReviewForm> {
  final FoodSummary foodSummary;
  FoodReview foodReview = FoodReview();
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  ReviewFormState(this.foodSummary);
  String _validateValue(value) {
    if(value.isEmpty) {
      return 'Campo obrigatório!';
    }

    var valueAsDouble = double.parse(value, (e) => null);

    if(valueAsDouble == null) {
      return 'Campo precisa ser numérico';
    }

    if(valueAsDouble < 0 || valueAsDouble > 10) {
      return 'O valor do campo deve ser entre 0 e 10';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final foodReviewBloc = Provider.of<FoodReviewBloc>(context);
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(title: Text("FoodRanks"),),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.restaurant),
                  hintText: 'Ex: Burger King, Subway',
                  labelText: 'Restaurante',
                ),
                onChanged: (value) {
                  foodReview.flavor = double.parse(value);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.star),
                  hintText: 'Nota de 0 a 10',
                  labelText: 'Sabor',
                ),
                validator: _validateValue,
                onChanged: (value) {
                  foodReview.flavor = double.parse(value);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.star),
                  hintText: 'Nota de 0 a 10',
                  labelText: 'Textura',
                ),
                validator: _validateValue,
                onChanged: (value) {
                  foodReview.texture = double.parse(value);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.star),
                  hintText: 'Nota de 0 a 10',
                  labelText: 'Molho',
                ),
                validator: _validateValue,
                onChanged: (value) {
                  foodReview.sauce = double.parse(value);
                },
              ),

              new Container(
                  padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                  child: new RaisedButton(
                    child: const Text('Enviar'),
                    onPressed: () {
                      if(_formKey.currentState.validate()) {
                        foodReviewBloc.add(foodSummary.id, foodReview);
                        Navigator.pop(context);
                      }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}