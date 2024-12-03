import 'package:flutter/material.dart';
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
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Hello DOMIXI GAMING',
              style: AppWidget.boldTextFeildStyle(),
            ),
            Container(
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
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTapUp: (TapUpDetails details){
                  icecream=true;
                  pizza=false;
                  salad=false;
                  burger=false;
                  setState(() {

                  });
                },
                child: AnimatedContainer(
                  duration: Duration(microseconds: 300),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: icecream?[
                      BoxShadow(
                        color: Colors.yellow.withOpacity(0.6),
                        blurRadius: 15,
                        spreadRadius: 5,
                      )
                    ]
                      :[],
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
                onTapDown: (TapDownDetails){
                  icecream=false;
                  pizza=false;
                  salad=false;
                  burger=true;
                  setState(() {

                  });
                },
                child: AnimatedContainer(
                  duration: Duration(microseconds: 300),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: burger?[
                      BoxShadow(
                        color: Colors.yellow.withOpacity(0.6),
                        blurRadius: 15,
                        spreadRadius: 5,
                      )
                    ]
                        :[],
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
                onTap: (){
                  icecream=false;
                  pizza=true;
                  salad=false;
                  burger=false;
                  setState(() {

                  });
                },
                child: AnimatedContainer(
                  duration: Duration(microseconds: 300),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: pizza?[
                      BoxShadow(
                        color: Colors.yellow.withOpacity(0.6),
                        blurRadius: 15,
                        spreadRadius: 5,
                      )
                    ]
                        :[],
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
                onTap: (){
                  icecream=false;
                  pizza=false;
                  salad=true;
                  burger=false;
                  setState(() {

                  });
                },
                child: AnimatedContainer(
                  duration: Duration(microseconds: 300),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: salad?[
                      BoxShadow(
                        color: Colors.yellow.withOpacity(0.6),
                        blurRadius: 15,
                        spreadRadius: 5,
                      )
                    ]
                        :[],
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
          )
        ]),
      ),
    );
  }
}
