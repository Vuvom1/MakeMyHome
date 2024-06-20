import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CloudHelperFunctions {
  static Widget? checkMUltiRecordState<T>(
      {required AsyncSnapshot<List<T>> snapshot,
      Widget? loader,
      Widget? error,
      Widget? nothingFound}) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      if (loader != null) return loader;
      return const Center(child: CircularProgressIndicator());
    }

    if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      if (nothingFound != null) return nothingFound;
      return const Center(child: Text('No Data Found!'));
    }

    if (snapshot.hasError) {
      if (error != null) return error;
      return const Center(child: Text('Something went wrong. '),);
    }
  }

  static Future<String> getUrlFromFilePathAndName(String path) async{
    try {
      if (path.isEmpty) return '';

      final ref = FirebaseStorage.instance.ref().child(path);

      final url = await ref.getDownloadURL();

      return url;
    } catch (e) {
      throw 'Something went wrong.';
    }
  }
  
}
