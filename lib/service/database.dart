import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);
  }

  UpdateUserwallet(String id, String amount) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .update({"Wallet": amount});
  }

  // Future addFoodItem(Map<String, dynamic> userInfoMap, String name) async {
  //   return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
  // }
  //
  // Future<Stream<QuerySnapshot>> getFoodItem(String name) async {
  //   return await FirebaseFirestore.instance.collection(name).snapshots();
  // }
  Future<void> addFoodItem(Map<String, dynamic> foodData, String collectionName) async {
    try {
      // Thêm tài liệu mới vào collection với tên chỉ định
      await FirebaseFirestore.instance.collection(collectionName).add(foodData);
      print("Food item added successfully to $collectionName");
    } catch (e) {
      print("Error adding food item: $e");
      throw e;
    }
  }
  Future<Stream<QuerySnapshot>> getFoodItem(String collectionName) async {
    try {
      return FirebaseFirestore.instance.collection(collectionName).snapshots();
    } catch (e) {
      print("Error retrieving food items: $e");
      throw e;
    }
  }


}
