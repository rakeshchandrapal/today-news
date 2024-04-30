
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp({required String email, required String password}) async {
  await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
   Future.wait([
      _firebaseAuth.signOut(),
    ]);
  }


  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<bool?> getUserId() async{
    return(_firebaseAuth.currentUser == null);
  }

  Future<String> getUser() async {
    return (_firebaseAuth.currentUser!).email!;
  }

  Future<String> getPlaceHolder() async{
    return (_firebaseAuth.currentUser!.photoURL).toString();
  }
}
