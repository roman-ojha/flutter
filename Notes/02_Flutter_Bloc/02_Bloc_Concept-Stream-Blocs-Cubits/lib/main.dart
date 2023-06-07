/*
  -> Explanation:
    -> so there is a 'boatStream' function that will return 'Stream' of type 'int' number and which is sending all the boat down the river, so here we are sending the 10 boat one by one
    -> in the main function is to initialized the stream then we will listen to the stream by analyzing whether the bot is approaching or not
*/

Stream<int> boatStream() async* {
  // show this function generate asynchronous data so we have to put 'async*'
  for (int i = 0; i <= 10; i++) {
    print("SENT boat no. " + i.toString());
    await Future.delayed(Duration(seconds: 2));
    // 'await' keyword helps waiting for the process to finish
    yield i;
    // Yield "Pushes the boat" through the stream river
    // every time we are 'yield' something with the 'async*' function we are sending that peace of data to the stream
  }
}

void main(List<String> args) async {
  Stream<int> stream = boatStream();

  stream.listen((receivedData) {
    // We use listen method to wait for incoming stream data
    print("Received boat no." + receivedData.toString());
  });
}
