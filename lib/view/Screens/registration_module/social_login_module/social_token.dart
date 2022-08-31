// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// class FirebaseMessagingService {

//   static FirebaseMessagingService? _messagingService;
//   static FirebaseMessaging? _firebaseMessaging;
//   FirebaseMessagingService._createInstance();
//   factory FirebaseMessagingService() {
//     // factory with constructor, return some value
//     if (_messagingService == null) {
//       _messagingService = FirebaseMessagingService
//           ._createInstance(); // This is executed only once, singleton object
//       _firebaseMessaging = _getMessagingService();
      
//     }
//     return _messagingService!;
//   }
//   static FirebaseMessaging _getMessagingService() {
//     return _firebaseMessaging ??= FirebaseMessaging.instance;
//   }
//   Future<String?> getToken() async {
//     if (await _connectivityManager!.isInternetConnected()) {
//       return _firebaseMessaging!.getToken();
//     } else {
//       //AppDialogs.showToast(message: NetworkStrings.NO_INTERNET_CONNECTION);
//       return null;
//     }
//   }
//   Future<void> signInWithGoogle(
//     {required BuildContext context, required String socialType}) async {
//   try {
//     GoogleSignIn _googleSignIn = GoogleSignIn(
//       scopes: ['email'],
//     );

//     GoogleSignInAccount? _googleSignInAccount = await _googleSignIn.signIn();

//     if (_googleSignInAccount != null) {
//       await _googleSignIn.signOut();

//       _socialLoginMethod(
//           context: context,
//           userFullName: _googleSignInAccount.displayName,
//           socialToken: _googleSignInAccount.id,
//           socialType: socialType
//       );
//     }
//   } catch (error) {
//     //log(error.toString());
//     AppDialogs.showToast(message: error.toString());
//   }
// }