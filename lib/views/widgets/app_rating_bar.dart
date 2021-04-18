import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AppRatingBar extends StatelessWidget {
  AppRatingBar({
    Key key,
    this.minRating = 1,
    this.initialRating = 5,
    this.itemColor = Colors.green,
    this.itemCount = 5,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 4.0),
    this.itemSize = 25,
    this.onRatingUpdate,
  }) : super(key: key);
  final double initialRating;
  final int itemCount;
  final double minRating;
  final EdgeInsets itemPadding;
  final Color itemColor;
  final double itemSize;
  final Function(double) onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      minRating: minRating,
      direction: Axis.horizontal,
      itemCount: itemCount,
      itemPadding: itemPadding,
      itemBuilder: (context, _) => Icon(
        Icons.stars,
        color: itemColor,
        size: itemSize,
      ),
      onRatingUpdate: onRatingUpdate,
    );
  }
}
