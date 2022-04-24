import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Second page"),
              // inside the function where we are navigation to the screen
              onPressed: () {
                // Navigator.pushNamed(context, '/second');

                // pushNamed will push the another page at the top of the previous route mean's This 'FirstRoutePage' will be at the buttom of the stack of the 'SecondRoutePage'
                // here 'FirstRoutePage' is underneatch of the 'SecondRoutePage'
                // as we know that all the page will be placed on the stack and when we are naviating to the another screen it will push the new screen into the stack and when we will go back it will pop from the stack
                // it means when you are working in the complex app which have a lot of route and have to navigate in a lot of page we might have to go the the previous page which is alread in the stack but we are push again same page into the stack which is not the efficent way to use the App
                // So rather then using the 'pushNamed' we can use 'pushReplacementNamed'
                Navigator.pushReplacementNamed(context, '/second');
                // now previous page will no longer sotred in the stack and will not store under neeth of the new page
              },
            )
          ],
        ),
      ),
    );
  }
}
