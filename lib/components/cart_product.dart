import 'package:flutter/material.dart';

class CartProduct extends StatefulWidget {
  CartProduct({Key key}) : super(key: key);

  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {

  var productOnCart =[
    {
      "name": "Blazers",
      "picture": "assets/products/blazer1.jpeg",
      "price": 100,
      "size": "M",
      "color": "Red",
      "quantity": 1
    },
    {
      "name": "Frocks",
      "picture": "assets/products/dress2.jpeg",
      "price": 150,
      "size": "M",
      "color": "Red",
      "quantity": 1
    },
    // {
    //   "name": "Shoes",
    //   "picture": "assets/products/shoe1.jpg",
    //   "price": 150,
    //   "size": "M",
    //   "color": "Red",
    //   "quantity": 1
    // },
    // {
    //   "name": "Throusers",
    //   "picture": "assets/products/pants2.jpeg",
    //   "price": 150,
    //   "size": "M",
    //   "color": "Red",
    //   "quantity": 1
    // },
    // {
    //   "name": "High-Hills",
    //   "picture": "assets/products/hills1.jpeg",
    //   "price": 20,
    //   "size": "M",
    //   "color": "Red",
    //   "quantity": 1
    // }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productOnCart.length,
      itemBuilder: (context, index){
        return SingleCartProduct(
          cartProdName: productOnCart[index]['name'],
          cartProdPicture: productOnCart[index]['picture'],
          cartProdPrice: productOnCart[index]['price'],
          cartProdSize: productOnCart[index]['size'],
          cartProdColor: productOnCart[index]['color'],
          cartProdQuantity: productOnCart[index]['quantity']
        );
      }
    );
  }
}

class SingleCartProduct extends StatelessWidget {
 
  final cartProdName;
  final cartProdPicture;
  final cartProdPrice;
  final cartProdSize;
  final cartProdColor;
  final cartProdQuantity;

  SingleCartProduct({this.cartProdName, this.cartProdPicture, this.cartProdPrice , this.cartProdSize, this.cartProdColor, this.cartProdQuantity});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(cartProdPicture, width: 80.0, height: 80.0),
        title: Text(cartProdName),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text('Size:'),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(cartProdSize, style: TextStyle(color:Colors.red)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text('Color:'),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(cartProdColor, style: TextStyle(color:Colors.red)),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                '\$$cartProdPrice',
                style: TextStyle(
                  fontSize: 17.0, 
                  fontWeight: FontWeight.bold, 
                  color:Colors.red
                )
              )
            )
          ]
        ),
        trailing: Column(
          children: <Widget>[
            IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: null),
            Text('$cartProdQuantity'),
            IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: null)
          ],
        ),
      ),
    );
  }
}