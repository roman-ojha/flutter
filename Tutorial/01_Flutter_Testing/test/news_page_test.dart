// This is the Widget test:
import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:flutter_testing_tutorial/article.dart';
import 'package:flutter_testing_tutorial/news_change_notifier.dart';
import 'package:flutter_testing_tutorial/news_page.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_testing_tutorial/news_service.dart';
import 'package:provider/provider.dart';

class MockNewsServices extends Mock implements NewsService {
  // we will also going to need mock services to mock certain feature
}

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
    // rather then calling this 'when' function ever time we will create the new function
    when(() => mockNewsServices.getArticles())
        .thenAnswer((_) async => articlesFromServices);
  }

  Widget createWidgetUnderTest() {
    return MaterialApp(
      title: 'News App',
      home: ChangeNotifierProvider(
        create: (_) => NewsChangeNotifier(mockNewsServices),
        // so rather then providing 'NewsServices' we will provide the 'mockNewsServices'
        child: NewsPage(),
      ),
    );
  }

  testWidgets("should display correct title", (WidgetTester tester) async {
    // for widget test we have to use 'testWidgets'
    // and it will accept a 'WidgetTester' as a parameter

    // so widget test operate on the widget tree and we need to perform some action on the widget tree like: tap, drag, rebuild widget tree
    // NOTE in test widget will not rebuild it self like in normal use of application we have to tell to rebuild the widget by our self

    // So what could be the test that we can do for widget test
    // for this application we can test news title
    // So to test the widget we need to have widget instance so that we can access all the widget tree
    // for this example we are trying to test 'news_page' widget for that we have to create and build the 'news_page' widget
    // we can do this by 'WidgetTester' 'tester'

    // tester.pumpWidget(const NewsPage());
    // pumpWidget will create widget, and in this case we want to pump the "NewsPage"
    // but if we will just try to run the test just by this much then it will fail because inside 'NewsPage' we are using 'NewsChangeNotifier' provider to get the data from the parent widget but we know that Widget test is the isolation test so 'NewsPage' is not getting the instance of "NewsChangeNotifier"
    // for that reason we will going to mock the parent component at the top of the test
    // now we can pump the widget:

    arrangeNewsServicesReturns3Articles();
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text("News"), findsOneWidget);
    // here we would expect to see one text widget which will call as 'News'
  });
}
