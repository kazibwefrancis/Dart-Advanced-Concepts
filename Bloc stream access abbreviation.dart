// Import the 'dart:async' library, which provides support for asynchronous programming, including Streams and StreamControllers.
import'dart:async';

// The main entry point of the Dart program.
void main(){
  // Create an instance of the Bloc class and assign it to the 'bloc' variable.
  // 'final' means the 'bloc' variable cannot be reassigned to a different Bloc instance.
  final bloc= new Bloc();

  
  // Listen to the 'email' stream from the 'bloc' instance.
  // When the stream emits a new value, the provided callback function is executed.
  bloc.email.listen((value){
    // Print the value received from the stream to the console.
    print(value);
  }
  );

  // Directly add a new email string to the sink of the 'emailController'.
  // This will cause the 'email' stream to emit this new value.
  bloc.emailController.sink.add('My New Email');
  // Call the 'changeEmail' getter, which is a shorthand for accessing the 'emailController.sink.add' method.
  // This also adds a new email string to the sink, causing the 'email' stream to emit this value.
  bloc.changeEmail('My New Email');



}

// Define a class named 'Bloc'.
class  Bloc {
  // Declare a final variable 'emailController' and initialize it with a new StreamController that handles String data.
  // StreamControllers are used to create and manage streams.
  final emailController=StreamController<String>();

  // Define a getter named 'changeEmail'.
  // This getter returns the 'add' method of the 'emailController's sink.
  // It provides a convenient way to add data to the stream.
  get  changeEmail => emailController.sink.add;
  // Define a getter named 'email'.
  // This getter returns the stream from the 'emailController'.
  // It allows other parts of the code to listen to data changes.
  get  email => emailController.stream;
}