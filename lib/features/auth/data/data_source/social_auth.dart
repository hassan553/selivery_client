// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:selivery_client/core/contants/api.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// final GoogleSignIn _googleSignIn = GoogleSignIn();

// Future<void> handleSignInWithGoogle() async {
//   try {
//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

//     if (googleUser != null) {
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;
//       print('token ${googleAuth.accessToken}');
//       v(googleAuth.accessToken ?? '');
//     }
//   } catch (error) {
//     print(error.toString());
//   }
// }

// v(String idToken) async {
//   var request = await http.post(clientLoginWithGoogle,
//       headers: authHeaders,
//       body: json.encode({"idToken": idToken, 'deviceToken': '1212'}));

//   if (request.statusCode == 200) {
//     print('result done');
//   } else {
//     print('error ${request.body}');
//   }
// }

// vv(String idToken) async {
//   var request = await http.post(clientLoginWithFacebook,
//       headers: authHeaders,
//       body: json.encode({"accessToken": idToken, 'deviceToken': '1212'}));

//   if (request.statusCode == 200) {
//     print('result done');
//   } else {
//     print('error ${request.body}');
//   }
// }

// googleLogOut() async {
//   await _googleSignIn.signOut();
//   print('done');
// }

// facebookSignOut() async {
//   await FacebookAuth.instance.logOut();
// }

// Future<void> handleSignInWithFacebook() async {
//   try {
//     final LoginResult result = await FacebookAuth.instance.login();

//     if (result.status == LoginStatus.success) {
//       String t = result.accessToken.toString();
//       vv(t);
//     } else {
//       print('errpr');
//     }
//   } catch (error) {
//     print(error.toString());
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dartz/dartz.dart';
import 'package:selivery_client/core/services/cache_storage_services.dart';
import '../../../../core/contants/api.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<Either<String, Unit>> handleSignInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      print('token ${googleAuth.accessToken}');
      final result = await v(googleAuth.accessToken ?? '');
      result.fold((l) {
        return left(l);
      }, (r) {
        return right(unit);
      });
    }
    return right(unit);
  } catch (error) {
    return left(error.toString());
  }
}

Future<Either<String, String>> v(String idToken) async {
  try {
    print('ooo$idToken');
    var request = await http.post(clientGoogleSignIn,
        headers: authHeaders,
        body: json.encode({"idToken": idToken, 'deviceToken': '1212'}));
    final result = json.decode(request.body);
    if (request.statusCode == 200) {
      await CacheStorageServices().setToken(result['token']);
      print('google token ${request.body.toString()}');
      print('myToken${CacheStorageServices().token}');
      return right('result done');
    } else {
      return left(request.body.toString());
    }
  } catch (error) {
    return left(error.toString());
  }
}

googleLogOut() async {
  await _googleSignIn.signOut();
  print('done');
}
