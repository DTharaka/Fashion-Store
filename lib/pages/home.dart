import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

// Own Imports
import 'package:fashion_store/components/horizontal_list.dart';
import 'package:fashion_store/components/products.dart';
import 'package:fashion_store/pages/shopping_cart.dart';

class HomePage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    Widget imageCarousel = new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/c1.jpg'),
          AssetImage('assets/c2.jpeg'),
          AssetImage('assets/c3.jpg'),
          AssetImage('assets/c4.jpg'),
          AssetImage('assets/c5.jpeg'),
          AssetImage('assets/c6.jpeg'),
          AssetImage('assets/c7.jpeg'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotBgColor: Colors.transparent,
        dotSize: 4.0,
        indicatorBgPadding: 3.0,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Fashion Store'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search), color: Colors.white, onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ShoppingCart()));
              }
            )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // Header
            UserAccountsDrawerHeader(
                accountName: Text('Tharak Dilruk'),
                accountEmail: Text('tharaka@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.red[400],
                ),
            ),
            // Body
            InkWell(
              onTap: (){},
              child: ListTile(
              title: Text('Home Page'),
              leading: Icon(Icons.home,color: Colors.red),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
              title: Text('My Account'),
              leading: Icon(Icons.person,color: Colors.red),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
              title: Text('My Orders'),
              leading: Icon(Icons.shopping_basket,color: Colors.red),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ShoppingCart()));
              },
              child: ListTile(
              title: Text('Shopping Cart'),
              leading: Icon(Icons.shopping_cart,color: Colors.red),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
              title: Text('Favourites'),
              leading: Icon(Icons.favorite,color: Colors.red),
              ),
            ),
            Divider(),
            InkWell(
              onTap: (){},
              child: ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
              title: Text('About'),
              leading: Icon(Icons.help),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          // Main Carousel
          imageCarousel,
          // Padding Widget
          Padding(padding: EdgeInsets.all(4.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text('Categories')
            )
          ),
          // Horizontal list view
          HorizontalList(),
          // Padding Widget
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('Recent Products')
            )
          ),
          // Grid View
          Flexible(child: Products()),
        ],
      ),
    );
  }
}
