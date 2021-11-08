import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppify/top_page_layout.dart';

import 'items.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    //Sizing
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffe9ebf7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < getHorizontalItems().length; ++i)
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home2()));
                        },
                        child: Container(
                          height: size.width * 0.5,
                          width: size.width * 0.35,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1),
                            child: cardRow(size, i),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Card cardRow(Size size, int i) {
  return Card(
    shadowColor: Colors.grey[50],
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            child: Container(
              child: Image.network(
                getHorizontalItems()[i].img,
                fit: BoxFit.cover,
                width: size.width * 0.35,
                height: size.width * 0.3,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Container(
              width: size.width * 0.35,
              child: Text(
                getHorizontalItems()[i].name,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: Container(
              width: size.width * 0.35,
              child: Row(
                children: [
                  Text(
                    '\$${getHorizontalItems()[i].newPrice}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '\$${getHorizontalItems()[i].oldPrice}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
