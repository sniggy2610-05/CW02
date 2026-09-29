import 'package:flutter_test/flutter_test.dart';
import 'package:movie_watchlist_app/main.dart';

void main() {
  testWidgets('Home screen lists movies', (tester) async {
    await tester.pumpWidget(const MovieWatchlistApp());
    expect(find.text('Movie Watchlist'), findsOneWidget);
    expect(find.text('Inception'), findsOneWidget);
  });
}