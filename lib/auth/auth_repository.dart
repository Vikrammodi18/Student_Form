// import 'package:firebase_auth/firebase_auth.dart';

// class AuthRepository {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> verifyPhoneNumber({
//     required String phoneNumber,
//     required Function (PhoneAuthCredential) onVerificationCompleted,
//     required Function (FirebaseAuthException) onVerificationFailed,
//     required Function (String verificationId, int? resendToken) onCodeSent,
//     required Function (String) onAutoRetrievalTimeout,
//   }) async{
//     await _auth.verifyPhoneNumber(
//       verificationCompleted: onVerificationCompleted,
//       verificationFailed: onVerificationFailed,
//       codeSent: (String verificationId, int? resendToken){
//         onCodeSent(verificationId);
//       }  ,
//       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
//   }
// }
