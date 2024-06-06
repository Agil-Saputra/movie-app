import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class RatingIndicator extends StatelessWidget {
  final Map item;
  const RatingIndicator({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: item['vote_average'] / 2,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          itemSize: 20.0,
          direction: Axis.horizontal,
        ),
        Text(
            "${(item['vote_average'] / 2).toStringAsFixed(2)} / ${NumberFormat('#,##,000').format(item['vote_count'])}")
      ],
    );
  }
}
