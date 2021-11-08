import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppify/carousel.dart';
import 'package:shoppify/home2.dart';
import 'package:shoppify/items.dart';
import 'package:shoppify/top_page_layout.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  //Carousel Controller Mandatory Thing
  final CarouselController _controller = CarouselController();
  bool searchState = false;

  @override
  Widget build(BuildContext context) {
    //Sizing
    Size size = MediaQuery.of(context).size;

    //putting top_page_layout items in a list

    final List<Widget> imgSliders =
        getItems().map((item) => TopPage(item: item, size: size)).toList();

    return Scaffold(
      backgroundColor: Color(0xffe9ebf7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                MyCarouselSlider(
                    imgSliders: imgSliders,
                    context: context,
                    controller: _controller)
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Show All',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            //Horizontal Scroll List
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Show All',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            //category list
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: categoriesList(),
            ),
          ],
        ),
      ),
    );
  }

//Horizontal Cards Row Method

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

// Category list method
  Column categoriesList() {
    return Column(
      children: [
        for (int i = 0; i < getCategories().length; i++)
          Card(
            elevation: 0,
            child: ListTile(
              leading: getCategories()[i].icon,
              title: Row(
                children: [
                  Text(
                    getCategories()[i].gender,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '(${getCategories()[i].number})',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
              trailing: Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
                size: 28,
              ),
            ),
          )
      ],
    );
  }
}
