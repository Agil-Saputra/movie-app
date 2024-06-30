import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math' as math;
import 'package:readmore/readmore.dart';

class Review extends StatefulWidget {
  final Map review;
  const Review({
    super.key,
    required this.review,
  });

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    final review = widget.review;
    return Container(
      decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.all(Radius.circular(12))),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              review['author_details']['avatar_path'] != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(1000)),
                      child: FadeInImage.assetNetwork(
                        width: 50,
                        height: 50,
                        image:
                            'https://media.themoviedb.org/t/p/w90_and_h90_face/${review['author_details']['avatar_path']}}',
                        placeholder: "assets/loading.png",
                        fit: BoxFit.cover,
                      ),
                    )
                  : SizedBox(
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                        child: Text(review['author'][0].toUpperCase(), style: TextStyle(color: Colors.black87),),
                      ),
                    ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review['author'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                 review['author_details']['rating'] != null ? Row(
                    children: [
                      RatingBarIndicator(
                        rating: review['author_details']['rating'] / 2,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                      Text(
                          "${(review['author_details']['rating']  / 2).toStringAsFixed(2)} / 5")
                    ],
                  ) : Text("Didn't give ratings")
                ],
              )
            ],
          ),
          SizedBox(height: 12,),
          ReadMoreText(
            review['content'],
            trimMode: TrimMode.Line,
            trimLines: 4,
            trimCollapsedText: 'Read more',
            trimExpandedText: 'Show less',
            moreStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            lessStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
