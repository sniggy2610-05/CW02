import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../widgets/poster_image.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: 'poster-${movie.title}',
                child: PosterImage(
                  path: movie.posterPath,
                  width: 240,
                  height: 360,
                  radius: 16,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              movie.title,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _InfoChip(
                  icon: Icons.calendar_today_rounded,
                  label: '${movie.year}',
                ),
                _InfoChip(icon: Icons.theaters_rounded, label: movie.genre),
                _InfoChip(
                  icon: Icons.star_rounded,
                  label: movie.rating.toStringAsFixed(1),
                  iconColor: Colors.amber,
                ),
              ],
            ),
            const SizedBox(height: 28),
            _SectionTitle(title: 'Synopsis'),
            const SizedBox(height: 8),
            Text(
              movie.synopsis,
              style: textTheme.bodyLarge?.copyWith(
                height: 1.5,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 28),
            _SectionTitle(title: 'Cast'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: movie.cast
                  .map(
                    (name) => Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      name[0],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  label: Text(name),
                  backgroundColor: const Color(0xFF1A1A22),
                  side: BorderSide.none,
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.icon,
    required this.label,
    this.iconColor = Colors.white70,
  });

  final IconData icon;
  final String label;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A22),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: iconColor),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}