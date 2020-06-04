import 'package:flutter/material.dart';

//my imports
import 'package:fashion_store/components/cart_product.dart';

class ShoppingCart extends StatefulWidget {

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Shopping Cart'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search), color: Colors.white, onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: () {
              }
            )
        ],
      ),
      body: CartProduct(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text('Total Amount'),
                subtitle: Text('\$230'),
              )
            ),
            Expanded(
              child: MaterialButton(
                child: Text('Checkout', style: TextStyle(color: Colors.white)),
                color: Colors.red,
                onPressed: (){}
              ),
            )
          ],
        ),
      )
    );
  }
}