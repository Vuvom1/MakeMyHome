import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:makemyhome/features/shop/models/category_model.dart';
import 'package:makemyhome/utils/exceptions/firease_auth_exceception.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

   final _db = FirebaseFirestore.instance;

   Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFireaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
   } 
}