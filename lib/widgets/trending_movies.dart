

import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  
  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text('data')
        ],
      ),
    );
  }
}
