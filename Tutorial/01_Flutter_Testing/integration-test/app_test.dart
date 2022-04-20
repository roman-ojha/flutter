// integration test either be test whole app or if you are build bigger app then you might will test part of the app
// but you might now do the integration test for single widget

import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:flutter_testing_tutorial/article.dart';
import 'package:flutter_testing_tutorial/article_page.dart';
import 'package:flutter_testing_tutorial/news_change_notifier.dart';
import 'package:flutter_testing_tutorial/news_page.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_testing_tutorial/news_service.dart';
import 'package:provider/provider.dart';

class MockNewsServices extends Mock implements NewsService {}

void main() {
  late MockNewsServices mockNewsServices;
  setUp(() {
    mockNewsServices = MockNewsServices();
  });

  final articlesFromServices = [
    Article(title: "Test 1", content: "Test 1 content"),
    Article(title: "Test 2", content: "Test 2 content"),
    Article(title: "Test 3", content: "Test 3 content")
  ];

  void arrangeNewsServicesReturns3Articles() {
    when(() => mockNewsServices.getArticles())
        .thenAnswer((_) async => articlesFromServices);
  }

  Widget createWidgetUnderTest() {
    return MaterialApp(
      title: 'News App',
      home: ChangeNotifierProvider(
        create: (_) => NewsChangeNotifier(mockNewsServices),
        child: const NewsPage(),
      ),
    );
  }

  testWidgets(
      """Tappint on the first article excerpt open the article page where the full article content is displayed""",
      (WidgetTester tester) async {
    // now we want to test the whole app so in this project the integration test could be when we will tap on one article we should navigate to the another page with detail information about that article
    // NOTE: we don't have to test again what we had test in widget test

    // this is same is the widget tester
    arrangeNewsServicesReturns3Articles();
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    // after when article will show up we will going to tap on first article by find text
    await tester.tap(find.text('Test 1 content'));
    // so after tap it will navigate to the next page which will be animated at that time we have to 'pumpAndSettle' until animation finished
    await tester.pumpAndSettle();

    // after we navigate to the 'ArticlePage', there should not be a 'NewsPage'
    expect(find.byType(NewsPage), findsNothing);
    // after we navigate to the "ArticlePage" we have to we will expect to see the article
    expect(find.byType(ArticlePage), findsOneWidget);

    expect(find.text('Test 1'), findsOneWidget);
    expect(find.text("Test 1 content"), findsOneWidget);
  });
}
