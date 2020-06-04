import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(imageLocation: 'assets/cats/tshirt.png', caption: 'T-Shirts'),
          Category(imageLocation: 'assets/cats/jeans.png', caption: 'Jeans'),
          Category(imageLocation: 'assets/cats/shoe.png', caption: 'Shoes'),
          Category(imageLocation: 'assets/cats/formal.png', caption: 'Formal'),
          Category(imageLocation: 'assets/cats/informal.png', caption: 'Inormal'),
          Category(imageLocation: 'assets/cats/dress.png', caption: 'Dress'),
          Category(imageLocation: 'assets/cats/accessories.png', caption: 'Accessories')
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String caption;

  Category({this.imageLocation, this.caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () => {
          
        },
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              imageLocation,
              height: 100.0,
              width: 100.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(caption, style: TextStyle(fontSize: 12.0))  
            )
          ),
        ),
      ),
    );
  }
}
