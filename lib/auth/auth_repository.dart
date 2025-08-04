import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_entry_app/core/providers/auth_provider.dart';
import 'package:student_entry_app/screen/otp_screen.dart';
import 'package:student_entry_app/useMethod.dart/essentialMethod.dart';

class AuthRepository {
  static phoneNumberVerification({
    required String phoneNumber,
    required BuildContext context,
  }) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91 " + phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          showSnackBar(message: "Enter valid Mobile Number", context: context);
        } else if (e.code == "too-many-request") {
          showSnackBar(
            message: 'too many attempts. Try again later',
            context: context,
          );
        } else {
          showSnackBar(
            message: "Phone verification failed: ${e.message}",
            context: context,
          );
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        showSnackBar(message: "Otp Send Successfully", context: context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(verificationId: verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  static Future verifyOtp({
    required String sms,
    required String verificationId,
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: sms,
      );
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      if (userCredential.user != null) {
        showSnackBar(message: "logged in sucessfully", context: context);
        String? token = await userCredential.user?.getIdToken();
        if (token!.isNotEmpty) {
          LocalStorage.saveToken(name: "token", data: token);
          ref.read(authProvider.notifier).login();
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-verification-code") {
        showSnackBar(message: "OTP is incorrect", context: context);
      } else {
        showSnackBar(message: "otp verification failed", context: context);
      }
    }
  }
}
