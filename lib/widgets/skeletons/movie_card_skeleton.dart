import 'package:flutter/cupertino.dart';

class MovieCardSkeleton extends StatefulWidget {
  const MovieCardSkeleton({super.key});

  @override
  State<MovieCardSkeleton> createState() => _MovieCardSkeletonState();
}

class _MovieCardSkeletonState extends State<MovieCardSkeleton> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}