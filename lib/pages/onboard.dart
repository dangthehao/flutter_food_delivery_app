import 'package:flutter/material.dart';
import 'package:food_delivery_app_flutter/pages/login.dart';
import 'package:food_delivery_app_flutter/pages/signup.dart';
import 'package:food_delivery_app_flutter/widget/content_model.dart';
import 'package:food_delivery_app_flutter/widget/widget_support.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: contents.length,
                controller: _controller,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                    child: Column(
                      children: [
                        Image.asset(
                          contents[i].image,
                          height: 500,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          contents[i].title,
                          style: AppWidget.semiBooldTextFeildStyle(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          contents[i].decription,
                          style: AppWidget.LightTextFeildStyle(),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                  (index) => buildDot(index, context),
                )),
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex == contents.length - 1) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              }
              _controller.nextPage(
                  duration: Duration(microseconds: 100),
                  curve: Curves.bounceIn);
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),
              height: 60,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: Center(
                child: Text(
                  currentIndex == contents.length -1?"Start": "Next",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.0,
      width: currentIndex == index ? 18 : 7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.black38),
    );
  }
}
