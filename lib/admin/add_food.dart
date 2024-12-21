import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_flutter/service/database.dart';
import 'package:food_delivery_app_flutter/widget/widget_support.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  String? value;
  final List<String> items = ['Ice-cream', 'Burger', 'Salad', 'Pizza'];

  TextEditingController namecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController detailcontroller = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? selecttedImage;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selecttedImage = File(image!.path);
    setState(() {});
  }
  Future<String?> uploadToCloudinary(File imageFile) async {
    const String cloudinaryUrl = "https://api.cloudinary.com/v1_1/dyqhidopc/image/upload";
    const String uploadPreset = "upload-food-delivery";

    try {
      if (!["jpg", "jpeg", "png"].contains(imageFile.path.split('.').last.toLowerCase())) {
        print("Định dạng tệp không được hỗ trợ.");
        return null;
      }

      if (await imageFile.length() > 10 * 1024 * 1024) {
        print("Tệp quá lớn (giới hạn 10MB).");
        return null;
      }

      final request = http.MultipartRequest("POST", Uri.parse(cloudinaryUrl))
        ..fields['upload_preset'] = uploadPreset
        ..files.add(await http.MultipartFile.fromPath("file", imageFile.path));

      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseData);
        return jsonResponse["secure_url"];
      } else {
        final errorResponse = await response.stream.bytesToString();
        print("Cloudinary upload failed: $errorResponse");
        return null;
      }
    } catch (e) {
      print("Error uploading to Cloudinary: $e");
      return null;
    }
  }


  uploadItem() async {
    if (selecttedImage != null &&
        namecontroller.text.isNotEmpty &&
        pricecontroller.text.isNotEmpty &&
        detailcontroller.text.isNotEmpty) {
      String addId = randomAlphaNumeric(10);

      // Upload hình ảnh lên Cloudinary
      String? downloadUrl = await uploadToCloudinary(selecttedImage!);

      if (downloadUrl != null) {
        Map<String, dynamic> addItem = {
          "Image": downloadUrl,
          "Name": namecontroller.text,
          "Price": pricecontroller.text,
          "Detail": detailcontroller.text
        };

        await DatabaseMethods().addFoodItem(addItem, value!).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Food Item has been added successfully",
                style: TextStyle(fontSize: 18),
              )));
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Image upload failed",
              style: TextStyle(fontSize: 18),
            )));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "All fields must be filled",
            style: TextStyle(fontSize: 18),
          )));
    }
  }
    //firebase Storage
  // Future getImage() async {
  //   var image = await _picker.pickImage(source: ImageSource.gallery);
  //   selecttedImage = File(image!.path);
  //   setState(() {});
  // }
  //
  // uploadItem() async {
  //   if (selecttedImage != null &&
  //       namecontroller.text != "" &&
  //       pricecontroller.text != "" &&
  //       detailcontroller != "") {
  //     String addId = randomAlphaNumeric(10);
  //
  //     Reference firebaseStorageRef =
  //     FirebaseStorage.instance.ref().child("blogImages").child(addId);
  //     final UploadTask task = firebaseStorageRef.putFile(selecttedImage!);
  //
  //     var downloadUrl = await (await task).ref.getDownloadURL();
  //
  //     Map<String, dynamic> addItem = {
  //       "Image": downloadUrl,
  //       "Name": namecontroller.text,
  //       "Price": pricecontroller.text,
  //       "Detail": detailcontroller.text
  //     };
  //     await DatabaseMethods().addFoodItem(addItem, value!).then((value) {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           backgroundColor: Colors.orangeAccent,
  //           content: Text(
  //             "Food Item has been added Successfuly",
  //             style: TextStyle(fontSize: 18),
  //           )));
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color(0xFF373866),
            )),
        centerTitle: true,
        title: Text(
          "Add Item",
          style: AppWidget.HeadlineTextFeildStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload the Item Picture",
                style: AppWidget.semiBooldTextFeildStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              selecttedImage == null
                  ? GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Center(
                        child: Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              selecttedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Item Name",
                style: AppWidget.semiBooldTextFeildStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Item Name",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Item Price",
                style: AppWidget.semiBooldTextFeildStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: pricecontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Item Price",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Item Detail",
                style: AppWidget.semiBooldTextFeildStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  maxLines: 6,
                  controller: detailcontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Item Detail",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Item Price",
                style: AppWidget.semiBooldTextFeildStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          )))
                      .toList(),
                  onChanged: ((value) => setState(() {
                        this.value = value;
                      })),
                  dropdownColor: Colors.white,
                  hint: Text(
                    "Select Category",
                    style: AppWidget.LightTextFeildStyle(),
                  ),
                  iconSize: 36,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  value: value,
                )),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (){
                  uploadItem();
                },
                child: Center(
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Add',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
