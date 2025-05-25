import 'dart:async'; // Lets us use Streams and StreamTransformer for handling sequences of events/data.
import 'dart:html';  // Lets us interact with HTML elements on the web page.

void main() {
  // Get the first <input> element from the HTML page.
  // This is where the user will type their email.
  final Element? input = querySelector('input');

  // Get the first <div> element from the HTML page.
  // This is where we will show messages to the user (like errors or valid email).
  final Element? div = querySelector('div');

  // Create a StreamTransformer that will check if the user's input looks like an email.
  // A StreamTransformer lets us process or change data as it flows through a stream.
  // In this case, we want to check if the input contains an '@' character.
  final validator = StreamTransformer<String, String>.fromHandlers(
    handleData: (inputValue, sink) {
      // This function runs every time the user types something.
      // inputValue is what the user typed.
      // sink is how we send results (valid or error) to the next step.

      // Check if the input contains '@' (a very basic email check).
      if (inputValue.contains('@')) {
        // If it does, send the inputValue forward as a valid email.
        sink.add(inputValue);
      } else {
        // If it doesn't, send an error message instead.
        sink.addError('Enter a valid email');
      }
    },
  );

  // Set the initial message in the <div> to prompt the user.
  div!.innerHtml = 'Enter a valid email';

  // Listen for any changes in the <input> field (every time the user types).
  input!.onInput
    // For every input event, get the current value of the input box.
    // If the input is empty, use an empty string ('') instead of null.
    .map((event) => (event.target as InputElement).value ?? '')
    // Pass the value through our validator transformer.
    // This will check if the value contains '@' and send either the value or an error.
    .transform(validator)
    // Listen for the results from the validator.
    .listen(
      // If the validator says it's valid, show the valid email in the <div>.
      (value) => div!.innerHtml = 'Valid email: $value',
      // If the validator sends an error, show the error message in the <div>.
      onError: (err) => div!.innerHtml = err,
    );
}