import 'package:flutter/material.dart';
import "package:web_socket_channel/web_socket_channel.dart";
import 'package:web_socket_channel/io.dart';

/*
  -> flutter pub add web_socket_channel
  -> for right now we don't have any websocket server because of that we will use online websocket server:
      -> https://www.piesocket.com/websocket-tester
      -> wss://demo.piesocket.com/v3/channel_1?api_key=oCdCMcMPQpbvNjUIzqtvF1d2X2okWpDQj4AwARJuAgtjhzKxVEjQU6IdCjwm&notify_self 
*/

class WebSocketChannelPackage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        channel: new IOWebSocketChannel.connect(
          "wss://demo.piesocket.com/v3/channel_1?api_key=oCdCMcMPQpbvNjUIzqtvF1d2X2okWpDQj4AwARJuAgtjhzKxVEjQU6IdCjwm&notify_self",
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final WebSocketChannel channel;
  const MyHomePage({Key? key, required this.channel}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebSocketChannelPackage'),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Form(
              child: new TextFormField(
                decoration: new InputDecoration(labelText: "Send any message"),
                controller: editingController,
              ),
            ),
            new StreamBuilder(
              // stream builder will interact will stream and it will take the snapshot out of it
              // that snapshot consist of some data
              stream: widget.channel.stream,
              // this create a new stream builder that build itself on the base of the snapshot
              builder: (context, snapshot) {
                return new Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text(snapshot.hasData ? '${snapshot.data}' : ""),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _sendMyMessage,
        child: new Icon(
          Icons.send,
        ),
      ),
    );
  }

  void _sendMyMessage() {
    if (editingController.text.isNotEmpty) {
      print(editingController.text);
      widget.channel.sink.add(editingController.text);
      // sending data to the server
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    // closing the connection
    // here it will release the resources when dispose happen
    super.dispose();
  }
}
