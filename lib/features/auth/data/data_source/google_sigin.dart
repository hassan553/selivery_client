import 'dart:convert';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/contants/api.dart';
import '../../../../core/services/cache_storage_services.dart';

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

// Future<UserCredential> signInWithGoogleH() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth =
//       await googleUser?.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );
//   print('cccc$credential');
//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }
