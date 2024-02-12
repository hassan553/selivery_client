import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/contants/api.dart';
import '../../../../core/helper/notifictions_helper.dart';
import '../../../../core/services/cache_storage_services.dart';


final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

Future<Either<String, Unit>> handleSignInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      await _loginWithGoogle(googleAuth.accessToken ?? '');
    }
    return right(unit);
  } catch (error) {
    return left(error.toString());
  }
}

Future _loginWithGoogle(String idToken) async {
  String message = 'لقد حدث خطأ ما';
  try {
    var request = await http.post(clientGoogleSignIn,
        headers: authHeaders,
        body: json.encode({
          "idToken": idToken,
          'deviceToken': await FirebaseMessagingService.getDeviceToken()
        }));
    final result = json.decode(request.body);
    message = result['message'];
    if (request.statusCode == 200) {
      await CacheStorageServices().setToken(result['token']);
    } else {
      throw (result['message'].toString());
    }
  } catch (error) {
    throw (message);
  }
}

googleLogOut() async {
  await _googleSignIn.signOut();
}
