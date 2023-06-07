import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _SearchBar(),
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SearchBar"),
        actions: <Widget>[
          // here in action we have an icon button which is search
          // after pressing it we want to implement the search functionality
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // in here when we will click the search icon we have to show the search page so,
              // after click you can make you own search input field and decorate it by your self but flutter gives the good Option
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      body: null,
      drawer: Drawer(),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  // in here we havenot user 'useState' because this 'SearchDelegate' will do every thing for use

  // these are the cities avilabile in the database
  final cities = [
    "Bhandup",
    "Mumbai",
    "Visakapatnam",
    "Coimbatore",
    "Delhi",
    "Bangalore",
    "Pune",
    "Nagpur",
    "Lucknow",
    "Vadodara",
    "Indore",
    "Jalalpur",
    "Bhopal",
    "Kalkata",
    "Kanpur",
    "New Delhi",
    "Faridabad",
    "Rajkot",
    "Ghaziabad",
    "Chennai",
    "Kathmandu",
    "Pokhara",
    "Birathnagar",
    "Dharan",
    "Itahari",
    "Damak",
    "Bhaktapur",
    "Lalitpur",
    "Gorkha",
    "Dolpa",
    "Chitwan",
    "Palpa",
    "Butwal",
  ];

  //here we will put all the recent Cities that the user had searched
  final recentCities = [
    "Ghaziabad",
    "Chennai",
    "Kathmandu",
    "Pokhara",
    "Birathnagar",
    "Dharan",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // the purpose of this 'buildActions' is when i will click the search bar what kind of action we want to perform
    // it takes of widget
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          // when we press the cross icon the query should be clear
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // here we will write what you want in the leading part of the appbar
    // Leading icon on the left of the app bar
    return IconButton(
      // so when ever we will have the search bar then we would like to have some back arrow with animation
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // so on press we just want to close the search bar for that we have the 'close' property as well
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // here we will write code which will execute when user will select the search result or suggestions
    return Center(
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // here we will write what we want to show when user search for that paticular data
    // so when user will try to search something in the searchbar then we will return:
    // in here we have a property which is 'query' which is the text that is written by the user
    // so we want the another suggestion list where:
    // -> when the user hadn't type any query then we will show the recentCities
    // -> if the user had type something in the query then we will show the search result or the final 'cities';
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();
    // and here we are only putting those result in the List which matches the query string
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        // now after search we will build the listTile of the result
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            // here we are making bold text only those the user had query in the search bar

            // and for rest of the string we want to show it normal
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        onTap: () {
          // when the user will tap on the result that he or she had just query then we have to show the result of that query
          // and for that we have to another method called that is 'showResults'
          showResults(context);
          // and in the 'buildResult' section we will design or write what we want to show when user will tap on the result
          // and also we can pass the data from here which we want to show in the result section
        },
      ),
      itemCount: suggestionList.length,
    );
  }
}
