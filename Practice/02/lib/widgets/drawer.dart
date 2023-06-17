import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final String? routeName = ModalRoute.of(context)?.settings.name;
    return Drawer(
      elevation: 50,
      child: ListView(
        children: [
          SizedBox(
            height: 45.0,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              padding: const EdgeInsets.all(0),
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Drawer",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text("Home"),
            onTap: () {
              if (routeName != "/") Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            title: const Text("Second Page"),
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const SecondPage(),
              //   ),
              // );
              if (routeName != "/second") {
                Navigator.of(context).pushNamed('/second');
              }
            },
          ),
          ListTile(
            title: const Text("Third"),
            onTap: () {
              if (routeName != '/third') {
                Navigator.of(context).pushNamed('/third');
              }
            },
          )
        ],
      ),
    );
  }
}
