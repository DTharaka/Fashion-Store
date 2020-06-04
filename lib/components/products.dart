import 'package:fashion_store/pages/product_details.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Blazers",
      "picture": "assets/products/blazer1.jpeg",
      "old_price": 120,
      "price": 100
    },
    {
      "name": "Frocks",
      "picture": "assets/products/dress2.jpeg",
      "old_price": 200,
      "price": 150
    },
    {
      "name": "Shoes",
      "picture": "assets/products/shoe1.jpg",
      "old_price": 200,
      "price": 150
    },
    {
      "name": "Throusers",
      "picture": "assets/products/pants2.jpeg",
      "old_price": 200,
      "price": 150
    },
    {
      "name": "Skerts",
      "picture": "assets/products/skt2.jpeg",
      "old_price": 70,
      "price": 30
    },
    {
      "name": "High-Hills",
      "picture": "assets/products/hills1.jpeg",
      "old_price": 50,
      "price": 20
    },
    {
      "name": "Dress",
      "picture": "assets/products/dress1.jpeg",
      "old_price": 70,
      "price": 30
    },
    {
      "name": "Pants",
      "picture": "assets/products/pants1.jpg",
      "old_price": 50,
      "price": 20
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemBuilder: (BuildContext context, int index){
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: SingleProduct(
            prodName: productList[index]['name'],
            prodPicture: productList[index]['picture'],
            prodOldPrice: productList[index]['old_price'],
            prodPrice: productList[index]['price'],
          ),
        );
      }
    );
  }
}

class SingleProduct extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodOldPrice;
  final prodPrice;

  SingleProduct({this.prodName, this.prodPicture, this.prodOldPrice, this.prodPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prodName,
        child: Material(
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                // Passing the values of the product to product_details page
                builder: (context)=> ProductDetails(
                    productDetailName: prodName,
                    productDetailPicture: prodPicture,
                    productDetailOldPrice: prodOldPrice,
                    productDetailPrice: prodPrice,
                  )
                )
              );
            },
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        prodName,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                      )
                    ),
                    Text(
                      "\$$prodPrice",
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    )
                  ]
                ),
              ),
              child: Image.asset(
                prodPicture,
                fit: BoxFit.cover,
              )
            ),
          )
        )
      ),
    );
  }
}