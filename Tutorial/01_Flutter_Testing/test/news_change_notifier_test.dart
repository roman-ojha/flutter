import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_tutorial/article.dart';
import 'package:flutter_testing_tutorial/news_change_notifier.dart';
import 'package:flutter_testing_tutorial/news_service.dart';
import 'package:mocktail/mocktail.dart';

class BadMockNewsServices implements NewsService {
  // now here we will implement 'MockNewsServices' which will work like real NewsServices but we are just return data for testing purposes

  // but this is not the best way to implement mocking because we are creating classes here and defining function take a lot of time

  // rather we will use 'mocktail' package and this 'mocktail' package will help us to write mock classes much efficiently

  bool getArticleCalled = false;
  @override
  Future<List<Article>> getArticles() async {
    getArticleCalled = true;
    return [
      Article(title: "Test 1", content: "Test 1 content"),
      Article(title: "Test 2", content: "Test 2 content"),
      Article(title: "Test 3", content: "Test 3 content")
    ];
  }
}

class MockNewsServices extends Mock implements NewsService {
  // now here to use 'Mocktail' package we will extends with 'Mock' and implements it as 'NewsServices'

  // so the advantage of using Mocktail is that we don need to provide the implementation up front like 'BadMockNewsServices'
}

void main() {
  // whenever we run the test this void main method will run

  // so we are trying to test 'NewsChangeNotifier' so we need to have and instance of that
  late NewsChangeNotifier sut;
  // sut (system under test)
  late MockNewsServices mockNewsServices;

  setUp(() {
    // inside this method we should initialize and setup everything pertaining to your individual test
    //  and this setup method runs before every test
    // sut = NewsChangeNotifier();
    // inside this method we need to initialize the instance
    // sut = NewsChangeNotifier(NewsService());
    // here we will not use 'NewsServices' that not the best way to implement test because the NewsServices data could change or server could break
    // so the solution to this is to create a completely test specific implementation of 'NewsServices' in our case

    // Mocktail implementation
    mockNewsServices = MockNewsServices();
    sut = NewsChangeNotifier(mockNewsServices);
    // now we are initializing the 'NewsChangeNotifier' using 'Mocktail' package
  });

  test("initial value are correct", () {
    // now here we will check if the initial value are correct or not like '_isLoading=false'
    expect(sut.articles, []);
    // here initial value for 'articles' should be []
    expect(sut.isLoading, false);
  });

  group("getArticle", () {
    // test Group group bunch of test together so that you can run then together as a group
    // if you are using some function in test then try to group those test

    test("gets articles using the NesServices", () async {
      // so we have not provided the 'getArticles' implementation in 'MockNewsServices' so we are using mocktain we can do it right here
      // so we are using mocktail we can provide the implementation particular to this exact method right here

      when(() => mockNewsServices.getArticles()).thenAnswer((_) async => []);
      // show here whenever the 'MockNewsServices' 'getArticles' function get called we would answer
      await sut.getArticles();
      // NOTE: here is two different 'getArticles' function implementation in this project
      verify(() => {mockNewsServices.getArticles()}).called(1);
      // we just want to verify that does 'getArticle' function called for 1 time
    });
    test('', () {});
  });
}
