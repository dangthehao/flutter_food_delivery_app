import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_flutter/pages/details.dart';
import 'package:food_delivery_app_flutter/service/database.dart';
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


  Stream? fooditemStream;

  ontheload() async {
    fooditemStream = await DatabaseMethods().getFoodItem("Pizza");
    setState(() {

    });
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Widget allItems() {
    return StreamBuilder(
        stream: fooditemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData ? ListView.builder(
            padding: EdgeInsets.zero,
              itemCount: snapshot.data.docs.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
          DocumentSnapshot ds = snapshot.data.docs[index];
          return GestureDetector(
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
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                         ds["Image"],
                          height: 145,
                          width: 350,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        ds["Name"],
                        style: AppWidget.semiBooldTextFeildStyle(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        ds["Detail"],
                        style: AppWidget.LightTextFeildStyle(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$${ds["Price"]}",
                        style: AppWidget.semiBooldTextFeildStyle(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
              }):CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Hello DOMIXI ',
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
         Container(
            height: 270,
             child: allItems()),
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
        Material(
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
      ],
    );
  }
}
