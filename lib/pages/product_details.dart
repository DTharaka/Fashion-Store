import 'package:fashion_store/pages/home.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  
  final productDetailName;
  final productDetailPicture;
  final productDetailOldPrice;
  final productDetailPrice;

  ProductDetails({this.productDetailName, this.productDetailPicture, this.productDetailOldPrice, this.productDetailPrice});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
          },
          child: Text('Fashion Store'),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search), 
              color: Colors.white, 
              onPressed: () {

              }),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.productDetailPicture)
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.productDetailName, 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                    ),
                  ),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "\$${widget.productDetailOldPrice}",
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough
                          ),
                        )
                      ),
                      Expanded(
                        child: Text(
                          "\$${widget.productDetailPrice}",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      )
                    ]
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              // First button(Size with Dropdown)
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text('Size'),
                        content: Text('Select the Size'),
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                            child: Text('Close'),
                          )
                        ]
                      );
                    });
                  },
                  elevation: 0.2,
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text("Size")),
                      Expanded(child: Icon(Icons.arrow_drop_down))
                    ],
                  ),
                )
              ),
              // First button(Color with Dropdown)
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text('Color'),
                        content: Text('Select the color'),
                        actions: <Widget>[
                          MaterialButton(
                            child: Text('Close'),
                            onPressed: (){
                              Navigator.of(context).pop(context);
                            }
                          )
                        ],
                      );
                    });
                  },
                  elevation: 0.2,
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text("Color")),
                      Expanded(child: Icon(Icons.arrow_drop_down))
                    ],
                  ),
                )
              ),
              // First button(Qty. with Dropdown)
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text('Quantity'),
                        content: Text('Select the Qty.'),
                        actions: <Widget>[
                          MaterialButton(
                            child: Text('Close'),
                            onPressed: (){
                              Navigator.of(context).pop(context);
                            }
                          )
                        ],
                      );
                    });
                  },
                  elevation: 0.2,
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text("Qty.")),
                      Expanded(child: Icon(Icons.arrow_drop_down))
                    ],
                  ),
                )
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  elevation: 0.2,
                  onPressed: (){},
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text("Buy Now"),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                color: Colors.red, 
                onPressed: (){}
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red, 
                onPressed: (){}
              )
            ]
          ),
          Divider(color: Colors.red),
          ListTile(
            title: Text('Product Details'),
            subtitle: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
          ),
          Divider(color: Colors.red),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Name',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.productDetailName),
              )
            ]
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Brand',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text('Brand X'),
              )
            ]
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Condition',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text('New'),
              ),
            ]
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Similar Products'),
          ),
          // Similar Products
          Container(
            height: 340.0,
            child: SimilarProducts(),
          )
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  SimilarProducts({Key key}) : super(key: key);

  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {

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
      "name": "Throusers",
      "picture": "assets/products/pants2.jpeg",
      "old_price": 200,
      "price": 150
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
        return SimilarSingleProduct(
          prodName: productList[index]['name'],
          prodPicture: productList[index]['picture'],
          prodOldPrice: productList[index]['old_price'],
          prodPrice: productList[index]['price'],
        );
      }
    );
  }
}

class SimilarSingleProduct extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodOldPrice;
  final prodPrice;

  SimilarSingleProduct({this.prodName, this.prodPicture, this.prodOldPrice, this.prodPrice});

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