import 'package:ecomm/app.dart';
import 'package:ecomm/data/repositories/authentication/authentication_repo.dart';
import 'package:ecomm/features/services/services.dart';
import 'package:ecomm/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // Widget binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  //Init local storage
  await GetStorage.init();
  //Todo: Init Payment methods
  //Todo: Await Native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //Initialize Firebasej
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  //ToDo:Initialize Auth
  runApp(const MyApp());
}
