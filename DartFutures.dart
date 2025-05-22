import 'dart:async'; // This brings in Dart's async library, which lets us work with things that take time, like waiting for data from the internet.

// The main function is where the program starts running.
main() { //main async(){}
  print('About to get data!!!!!!!!!!!!'); // This prints a message so we know the program started and is about to try to get some data.

  // Here we call the 'get' function, which pretends to fetch data from the internet.
  // The '.then' part tells Dart what to do when the data is finally ready (after waiting).
  // It's like saying: "When you get the data, run this code."
  get('http:/dhufudhfduhf')
    .then((result) { // 'result' will be whatever the 'get' function gives us after waiting.
      print(result); // This prints out the data we got (or pretended to get).
    });

  // Note: Another way to do this is with 'async' and 'await', which can make the code look simpler.
  // For example: var result = await get('http:/dhufudhfduhf');
}

// This function pretends to fetch data from the internet, like making an HTTP request.
// It returns a Future, which is Dart's way of saying "I'll give you the answer later."
Future<String> get(String url) {
  // 'Future.delayed' waits for a certain amount of time (here, 3 seconds) before running the code inside.
  return new Future.delayed(
    new Duration(seconds: 3), // Wait for 3 seconds to pretend we're fetching data.
    () {
      // After 3 seconds, this code runs and gives back a string as the "data" we got.
      return 'Data obtained!!!!!!!!!!!!!!';
    }
  );
}