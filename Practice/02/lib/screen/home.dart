import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 0;

  void incrementNumber() {
    setState(() {
      number++;
    });
  }

  void decrementNumber() {
    setState(() {
      number--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        elevation: 50,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.red),
              child: Container(
                height: 10.0,
                alignment: Alignment.center,
                child: const Text("Drawer"),
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: "Increment",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
                children: [
                  TextSpan(
                    text: "Decrement",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // color: Colors.red,
                      foreground: Paint()..color = Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            Text(
              number.toString(),
              style:
                  const TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: incrementNumber,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 30.0,
                ),
                TextButton(
                  onPressed: decrementNumber,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
