import 'package:ecomm/common/widgets/loaders/app_loaders.dart';
import 'package:ecomm/data/repositories/authentication/authentication_repo.dart';
import 'package:ecomm/data/repositories/user/user_repositry.dart';
import 'package:ecomm/data/services/network_manager.dart';
import 'package:ecomm/features/authentication/models/user_model.dart';
import 'package:ecomm/features/authentication/screens/login/login.dart';
import 'package:ecomm/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepositry = Get.put(UserRepositry());
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final loading = false.obs;
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  @override
  onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //fetch user record
  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepositry.fetchUserRecord();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }
  }
  //save record from any redistration provider

  Future<void> saveUserRecord(UserCredential? usercredential) async {
    try {
      //Refresh User record
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (usercredential != null) {
          final namePart =
              UserModel.nameParts(usercredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              usercredential.user!.displayName ?? '');

          //map data
          final user = UserModel(
              id: usercredential.user!.uid,
              firstName: namePart[0],
              lastName:
                  namePart.length > 1 ? namePart.sublist(1).join(" ") : '',
              username: username,
              email: usercredential.user!.email ?? '',
              phoneNumber: usercredential.user!.phoneNumber ?? '',
              profilePicture: usercredential.user!.photoURL ?? '');

          await userRepositry.saveUserRecord(user);
        }
      }
    } catch (e) {
      AppLoaders.warringSnackbar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can resave your data in your profile.');
    }
  }

  //delete account warring
  void deleteAccountWarringPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(AppSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want ot delete your account permanently? This action is not reveri=sible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.lg,
            ),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: Text('Cancel')));
  }

  void deleteUserAccount() async {
    try {
      loading.value = true;

      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          loading.value = false;
          Get.offAll(() => LoginScreen());
        } else if (provider == 'password') {
          loading.value = false;
          Get.to(() => ReAuthLoginForm());
        }
      }
    } catch (e) {
      loading.value = false;
      AppLoaders.warringSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      loading.value = true;

      final isConnected = await NetworkManager.instance
          .isConnectedFunction(); // Form validation
      if (!isConnected) {
        loading.value = false;
        return;
      }
      //validation
      if (!reAuthFormKey.currentState!.validate()) {
        loading.value = false;
        return;
      }
      await AuthenticationRepository.instance
          .reAuth(verifyEmail.text.trim(), verifyPassword.text.trim());
      Get.offAll(() => LoginScreen());
      await AuthenticationRepository.instance.deleteAccount();
      loading.value = false;
    } catch (e) {
      loading.value = false;
      AppLoaders.warringSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }

// upload profile image
  Future<void> uploadImageProfilePicture() async {
    try {
      final oldImageUrl = user.value.profilePicture;

      final image = await ImagePicker().pickImage(
          source: ImageSource.camera,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        final imageUrl =
            await userRepositry.uploadImage('Users/Images/Profile/', image);

        //update user image
        Map<String, dynamic> json = {"profilePicture": imageUrl};
        await userRepositry.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        print(imageUrl);
        profileLoading.value = true;
        user.refresh();
        await _deleteOldProfileImage(oldImageUrl);
        AppLoaders.successSnackBar(
            title: 'Your Profile image has been updated');
      }
    } catch (e) {
      AppLoaders.errorSnackbar(
          title: "Ohsnap!", message: 'Spmething went wrong $e');
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> _deleteOldProfileImage(String? oldImageUrl) async {
    try {
      if (oldImageUrl != null && oldImageUrl.isNotEmpty) {
        final ref = FirebaseStorage.instance.refFromURL(oldImageUrl);
        await ref.delete();
      }
    } catch (e) {
      AppLoaders.errorSnackbar(
          title: "Ohsnap!", message: 'Spmething went wrong $e');
    }
  }
}
