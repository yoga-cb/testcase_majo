import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testcase_majo/model/User_model.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return _user = googleUser;
      }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      await auth.signInWithCredential(credential);

      User userGoogle = auth.currentUser!;
      print(userGoogle.displayName);

      UserModel user = UserModel(
          id: userGoogle.uid,
          name: userGoogle.displayName.toString(),
          email: googleUser.email);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future googleSignOut() async {
    try {
      googleSignIn.signOut();
    } catch (e) {}
  }
}
