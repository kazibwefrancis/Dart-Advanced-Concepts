import'dart:async';

class Cake{}

class Order{
  String type;

  Order(this.type);

}




void main(){
  final controller= new StreamController();

  final order = new Order('chocolate'); //order by customer

  final baker= new StreamTransformer.fromHandlers(
    handleData: (cakeType, sink) {
      if(cakeType=='chocolate'){
        sink.add(new Cake());
      }else{
        sink.addError('I cant make that type');
      }
      
    },

  );

  controller.sink.add(order); //order taker

  controller.stream
  .map((order) => order.type)//order inspector takes in order and extracts type property
  .transform(baker)//send caketype to baker
  .listen( //pickup office
    (cake) => print('Heres your cake $cake'),
    onError: (err) => print(err)
    
    );


}