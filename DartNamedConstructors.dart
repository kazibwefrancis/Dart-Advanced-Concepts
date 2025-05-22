import 'dart:convert'; // This line brings in a library that lets us work with JSON data (turning text into objects and vice versa).

// This is the main function where the program starts running.
void main() {
  var rawJson = '{"url":"http://blah.jpg","id":1}'; // Here we have a string that looks like JSON data. It represents an image with a URL and an ID.

  var parsedJson = json.decode(rawJson); // This line takes the JSON string and turns it into a Map (like a dictionary) that Dart can understand.

  // We create an ImageModel object using the named constructor 'fromJson', which knows how to take the Map and turn it into an ImageModel.
  var imageModel = new ImageModel.fromJson(parsedJson);

  print(imageModel.url); // This prints out the URL of the image stored in the object.
  print(imageModel.id);  // This prints out the ID of the image stored in the object.
}

// This class is a blueprint for creating image objects with an ID and a URL.
class ImageModel {
  int id;    // This variable will hold the image's ID number.
  String url; // This variable will hold the image's URL as text.

  // This is the regular constructor. It lets you make an ImageModel by giving it an ID and a URL directly.
  ImageModel(this.id, this.url);

  // This is a special constructor called a "named constructor".
  // It lets you make an ImageModel from a JSON Map (the kind you get after decoding a JSON string).
  // The colon (:) means we're setting the values of id and url right away, before anything else happens.
  ImageModel.fromJson(parsedJson)
      : id = parsedJson['id'],      // Here we grab the 'id' value from the Map and assign it to our id variable.
        url = parsedJson['url'];    // Here we grab the 'url' value from the Map and assign it to our url variable.
}