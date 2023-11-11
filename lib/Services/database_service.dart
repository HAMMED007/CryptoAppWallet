import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptoapp/Model/currencies.dart';
import 'package:cryptoapp/Model/currency.dart';
import 'package:cryptoapp/Model/user_model.dart';
import 'package:cryptoapp/Model/vendors.dart';
import 'package:cryptoapp/controllers/currency_controller.dart';

import 'package:get/get.dart';

class DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  addUser(UserModel user) async {
    final docRef = firestore.collection("users").doc(user.userID);
    try {
      await docRef.set(user.toJson());
    } catch (e) {
      print("error is " + e.toString());
    }
  }

  Future<UserModel> getUser(String uid) async {
    UserModel userModel = UserModel.defaultValue();
    final docRef = firestore.collection("users").doc(uid);
    try {
      final val = await docRef.get();
      final data = val.data() as Map<String, dynamic>;
      userModel = UserModel.fromJSon(data);
      docRef.get().then((DocumentSnapshot doc) {
       
      });
    } catch (e) {}
    return userModel;
  }

  getEUR() async {
    String style = '';

    final docRef = firestore.collection("html_styling").doc("css");
    await docRef.get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      style = data['style'] ?? "";
    });
  }

  addCurrency() async {
    Currency cc = getDummyCurrencyEUR();
    await firestore.collection('currencies').doc("eur").set(cc.toJson());
    cc = getDummyCurrencyUSD();
    await firestore.collection('currencies').doc("usd").set(cc.toJson());

    cc = getDummyCurrencyGBP();
    await firestore.collection('currencies').doc("gbp").set(cc.toJson());
  }

  getVendors() async {
    DocumentSnapshot<Map<String, dynamic>> docRefgbp =
        await firestore.collection('vendors').doc('vendors').get();
    //print(docRefgbp.data);
  }

  Future<Vendors> getCombineVendors() async {
    DocumentSnapshot<Map<String, dynamic>> topDoc =
        await firestore.collection('vendors').doc('vendors').get();
    Vendors vendors = Vendors.fromJson(topDoc.data()!);
    return vendors;
  }

  addVendors() async {
    try {
      Vendors vendors = getDummyVendors();
      await firestore
          .collection('vendors')
          .doc("vendors")
          .set(vendors.toJson());
    } catch (e) {
      print(e);
    }
  }
Future<void> updateUserName(
      String docId, String newFirstName, String newLastName) async {
    try {
      await FirebaseFirestore.instance.collection('user').doc(docId).update({
        'firstName': newFirstName,
        'lastName': newLastName,
      });
      print('User information updated successfully');
    } catch (e) {
      print('Error updating user information: $e');
    }
  }

}
