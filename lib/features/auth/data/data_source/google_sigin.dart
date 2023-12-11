import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
Future<GoogleSignInAccount?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? account = await _googleSignIn.signIn();
    print(account);
    return account;
  } catch (error) {
    print(error);
    return null;
  }
}

Future<void> logout() async {
  try {
    await _googleSignIn.disconnect();
    print('delete');
  } catch (error) {
    print(error.toString());
  }
}
