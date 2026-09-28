import 'package:flutter/material.dart';

class PosterImage extends StatelessWidget {
  const PosterImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.radius = 12,
  });

  final String path;
  final double? width;
  final double? height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.asset(
        path,
        width: width,
        height: height,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        errorBuilder: (context, error, stackTrace) => Container(
          width: width,
          height: height,
          color: Colors.white10,
          child: const Icon(
            Icons.movie_outlined,
            color: Colors.white38,
            size: 36,
          ),
        ),
      ),
    );
  }
}