import 'dart:html';

void main(){
  final Element? button = querySelector('button');

  button?.onClick
  .timeout(
    new Duration(seconds: 1),
    onTimeout: (sink) => sink.addError('you lost nigga')
  )
  .listen(
    (event){},
    onError: (err)=> print(err)
  );
}

// dart compile js DartStreamPracticalExample.dart -o DartStreamPracticalExample.dart.js

