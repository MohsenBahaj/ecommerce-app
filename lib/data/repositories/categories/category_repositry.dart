import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomm/features/shop/models/category_model.dart';
import 'package:ecomm/utils/exceptions/firbase_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CategoryRepositry extends GetxController {
  static CategoryRepositry get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "something went Wrong ,plz try agian";
    }
  }
  // get sub categories

  //upload categories to the cloud firebase
}
