import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:makemyhome/features/shop/models/product_model.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();

      return snapshot.docs
          .map((document) => ProductModel.fromSnapshot(document))
          .toList();
    } catch (e) {
      throw 'Something went wrong. $e';
    }
  }

  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId, int limit =10}) async {
    try {
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('CategoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('CategoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();

      List<String> productsId = productCategoryQuery.docs
          .map((doc) => doc['ProductId'] as String)
          .toList();

      final productsQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productsId)
          .get();

      List<ProductModel> products = productsQuery.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

      return products;
    } catch (e) {
      throw 'Something went wrong when fetching categories ${e.toString()}';
    }
  }
}
