
import 'package:flutter/material.dart';

class ItemDismissableBuilder {
  final BuildContext _context;

  ItemDismissableBuilder(this._context);

  Widget build(Widget component, Function onDimissed, Key key) {
      return Dismissible(
        // Show a red background as the item is swiped away.
        background: Container(color: Colors.red),
        key: key,
        onDismissed: onDimissed,
        child: component,
      );
  }
}