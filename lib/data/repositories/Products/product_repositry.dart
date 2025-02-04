import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomm/features/shop/models/produc_model.dart';
import 'package:ecomm/utils/exceptions/firbase_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProductRepositry extends GetxController {
  static ProductRepositry get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //Get all categories
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      print("callled product function ----------========");
      final snapshot = await _db
          .collection('Products')
          .where("IsFeatured", isEqualTo: true)
          .get();
      for (var doc in snapshot.docs) {
        print(doc.data()); // Prints each document as a Map<String, dynamic>
      }
      print("-----------after");
      final list =
          snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
      return list;
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }
  // get sub categories

  //upload categories to the cloud firebase
}
