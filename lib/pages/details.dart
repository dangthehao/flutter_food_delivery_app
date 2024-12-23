import 'package:flutter/material.dart';
import 'package:food_delivery_app_flutter/service/database.dart';
import 'package:food_delivery_app_flutter/service/shared_pref.dart';
import 'package:food_delivery_app_flutter/widget/widget_support.dart';

class Details extends StatefulWidget {
  String image, name, detail, price;

  Details(
      {required this.image,
      required this.name,
      required this.detail,
      required this.price});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1, total=0;
  String? id;

  getthesharedpref()async{
    id=await SharedPreferencesHelper().getUserId();
    setState(() {

    });
  }
  ontheload()async{
    await getthesharedpref();
    setState(() {

    });
  }

  @override
  void initState() {

    super.initState();
    ontheload();
    total=int.parse(widget.price);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 35, left: 15, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(180),
              child: Image.network(
                widget.image,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.7,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: AppWidget.semiBooldTextFeildStyle(),
                    ),

                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (a > 1) {
                          a--;
                          total=total-int.parse(widget.price);
                          setState(() {});
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.remove, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      a.toString(),
                      style: AppWidget.semiBooldTextFeildStyle(),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        a++;
                        total=total+int.parse(widget.price);

                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              widget.detail,
              style: AppWidget.LightTextFeildStyle(),
              maxLines: 4,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  'Delivery Time',
                  style: AppWidget.semiBooldTextFeildStyle(),
                ),
                SizedBox(width: 30),
                Icon(Icons.alarm, color: Colors.black54),
                SizedBox(width: 5),
                Text(
                  "30 min",
                  style: AppWidget.semiBooldTextFeildStyle(),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price",
                        style: AppWidget.semiBooldTextFeildStyle(),
                      ),
                      Text(
                        "\$"+total.toString(),
                        style: AppWidget.HeadlineTextFeildStyle(),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      Map<String,dynamic> addFoodtoCart={
                        "Name":widget.name,
                        "Quantity": a.toString(),
                        "Total":total.toString(),
                        "Image":widget.image
                      };
                      await DatabaseMethods().addFoodToCart(addFoodtoCart, id!);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.orangeAccent,
                          content: Text(
                            "Food Added to Cart",
                            style: TextStyle(fontSize: 18),
                          )));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Add to cart ",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 25),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
