import 'dart:convert'; // This line brings in a built-in Dart library that helps us work with JSON data (which is a way to store and send information as text).

// This program shows how to turn a JSON string into a Dart object (a model) that we can use in our code.
void main() {
  // Here we have a string that looks like JSON data. It describes an image by giving it a URL and an ID number.
  var rawJson = '{"url":"http://blah.jpg","id":1}';

  // This line takes the JSON string and changes it into a Map (which is like a dictionary with keys and values) so Dart can understand and use it.
  var parsedJson = json.decode(rawJson);

  // Now we use the values from the Map to create an ImageModel object.
  // We give it the 'id' and 'url' from the parsedJson Map so our object has real data.
  var imageModel = new ImageModel(parsedJson['id'], parsedJson['url']);

  // This prints out the URL of the image that we stored in the object, so we can see it on the screen.
  print(imageModel.url);
 
  // This prints out the ID of the image that we stored in the object, so we can see it on the screen.
  print(imageModel.id);
}

// This class is like a recipe or blueprint for making image objects.
// Each image object will have an ID number and a URL (which is just a web address as text).
class ImageModel {
  int id;    // This variable will hold the image's ID number (like a unique tag for the image).
  String url; // This variable will hold the image's URL (the web address where the image is stored).

  // This is the constructor. It lets us make a new ImageModel by giving it an ID and a URL right away.
  ImageModel(this.id, this.url);
}