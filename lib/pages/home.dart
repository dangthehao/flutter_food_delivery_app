import 'package:flutter/material.dart';
import 'package:food_delivery_app_flutter/pages/details.dart';
import 'package:food_delivery_app_flutter/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false,
      pizza = false,
      salad = false,
      burger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Hello DOMIXI GAMING',
              style: AppWidget.boldTextFeildStyle(),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(8)),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            )
          ]),
          SizedBox(
            height: 20,
          ),
          Text(
            'Delicious Food',
            style: AppWidget.HeadlineTextFeildStyle(),
          ),
          Text(
            'Discover and Get Great Food',
            style: AppWidget.LightTextFeildStyle(),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
          ),
          SizedBox(
            height: 20,
          ),
          showItem(),
          SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Details())
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.asset(
                                "images/salad12.png",
                                height: 150,
                                width: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Veggie TaCo Hash",
                              style: AppWidget.semiBooldTextFeildStyle(),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Fresh and Healthy",
                              style: AppWidget.LightTextFeildStyle(),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "\$25",
                              style: AppWidget.semiBooldTextFeildStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  margin: EdgeInsets.all(4),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "images/salad12.png",
                              height: 150,
                              width: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "Mix Veg Saled",
                            style: AppWidget.semiBooldTextFeildStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Spicy with Onion",
                            style: AppWidget.LightTextFeildStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "\$28",
                            style: AppWidget.semiBooldTextFeildStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(89),
                        child: Image.asset(
                          "images/salad11.png",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        )),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 2,
                          child: Text(
                            "Mediterranean Chickpea Salad",
                            style: AppWidget.semiBooldTextFeildStyle(),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 2,
                          child: Text(
                            "Honey good cheese",
                            style: AppWidget.LightTextFeildStyle(),
                          ),

                        ),
                        SizedBox(height: 5,),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 2,
                          child: Text(
                            "\$28",
                            style: AppWidget.semiBooldTextFeildStyle(),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTapUp: (TapUpDetails details) {
            icecream = true;
            pizza = false;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: AnimatedContainer(
            duration: Duration(microseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: icecream
                  ? [
                BoxShadow(
                  color: Colors.yellow.withOpacity(0.6),
                  blurRadius: 15,
                  spreadRadius: 5,
                )
              ]
                  : [],
            ),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                child: Image.asset(
                  "images/icecream.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTapDown: (TapDownDetails) {
            icecream = false;
            pizza = false;
            salad = false;
            burger = true;
            setState(() {});
          },
          child: AnimatedContainer(
            duration: Duration(microseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: burger
                  ? [
                BoxShadow(
                  color: Colors.yellow.withOpacity(0.6),
                  blurRadius: 15,
                  spreadRadius: 5,
                )
              ]
                  : [],
            ),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                child: Image.asset(
                  "images/buggerfood.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = true;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: AnimatedContainer(
            duration: Duration(microseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: pizza
                  ? [
                BoxShadow(
                  color: Colors.yellow.withOpacity(0.6),
                  blurRadius: 15,
                  spreadRadius: 5,
                )
              ]
                  : [],
            ),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                child: Image.asset(
                  "images/pizza1.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = false;
            salad = true;
            burger = false;
            setState(() {});
          },
          child: AnimatedContainer(
            duration: Duration(microseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: salad
                  ? [
                BoxShadow(
                  color: Colors.yellow.withOpacity(0.6),
                  blurRadius: 15,
                  spreadRadius: 5,
                )
              ]
                  : [],
            ),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                child: Image.asset(
                  "images/salad3.jpg",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
