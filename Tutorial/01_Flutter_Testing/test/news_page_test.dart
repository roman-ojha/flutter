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

  void arrangeNewsServicesReturns3ArticlesAfter2SecondWait() {
    // rather then calling this 'when' function ever time we will create the new function
    when(() => mockNewsServices.getArticles()).thenAnswer((_) async {
      await Future.delayed(const Duration(seconds: 2));
      return articlesFromServices;
    });
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

  testWidgets("loading indicator is displayed while waiting for articles",
      (WidgetTester tester) async {
    // now what we can test is: if while article are being loaded from the server that the loading or the circular progress indicator is being shown
    // so here we are waiting for the article to come from let's say server
    arrangeNewsServicesReturns3ArticlesAfter2SecondWait();
    await tester.pumpWidget(createWidgetUnderTest());

    // expect(find.byType(CircularProgressIndicator), findsOneWidget);
    // nowhere we are finding The widget and expect to get it
    // but This is not enough because this is not static ui like the test will happen so quickly and those widget that where build after that test example "Consumer<NewsChangeNotifier>" tester will not found any widget that we have specify

    await tester.pump(const Duration(milliseconds: 500));
    // now here pump forces to rebuild widget for a given time and we want to get the 'CircularProgressIndicator' which will come much before the article data so we will going to rebuild widget for '400ms'
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    // and other way to find widget is by 'find.ByKey()'
    expect(find.byKey(const Key('progress-indicator')), findsOneWidget);

    await tester.pumpAndSettle();
    // https://youtu.be/Ghqry5dtgH4?t=1724
    // 'pump' and 'settle' wait until there no more rebuild happening
  });

  testWidgets("articles should displayed", (WidgetTester tester) async {
    arrangeNewsServicesReturns3Articles();

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();
    for (final article in articlesFromServices) {
      // now here we will check every article that we will get
      expect(find.text(article.title), findsOneWidget);
      expect(find.text(article.content), findsOneWidget);
    }
  });
}
