import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makemyhome/data/responsitories/authentication/authentication_responsitory.dart';
import 'package:makemyhome/features/personalization/model/user_model.dart';
import 'package:makemyhome/utils/exceptions/firease_auth_exceception.dart';

class UserResponsitory extends GetxController {
  static UserResponsitory get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;


  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch(e) {
      throw TFireaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<UserModel> fetchUserDetail() async {
    try {
      final documentSnapshot  = await _db.collection("Users").doc(AuthenticationRespository.instance.authUser?.uid).get();

    if (documentSnapshot.exists) {
      return UserModel.fromSnapshot(documentSnapshot);
    } else {
      return UserModel.empty();
    }
    } on FirebaseException catch (e) {
      throw TFireaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> updateUserDetails(UserModel updatedUser) async{
    try {
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw TFireaseAuthException(e.code);
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<void> updateSingleField(Map<String,dynamic> Json) async{
    try {
      await _db.collection("Users").doc(AuthenticationRespository.instance.authUser?.uid).update(Json);
    } on FirebaseException catch (e) {
      throw TFireaseAuthException(e.code);
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
}