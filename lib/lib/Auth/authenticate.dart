import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:note/lib/Auth/user.dart';

class AuthService {
  AuthService() {
    Firebase.initializeApp();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // SharedPreferences prefs;
  User_d currentUser;
//User_d get loggedIn => d_user;
  // create user obj based on firbaseUser
  User_d _userFromFirebaseUser(User user) {
    return user != null
        ? User_d(uid: user.uid, name: user.displayName, email: user.email)
        : null;
  }

// Stream change user stream
  Stream<User_d> get user {
    // ignore: deprecated_member_use
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

// for vehicle class

//get Uid
  Future<String> getCurrentUID() async {
    return (await _auth.currentUser).uid;
  }

  Future signInAnonymously() async {
    // AuthResult
    UserCredential result = await _auth.signInAnonymously();
    User user = result.user;
    await FirebaseAuth.instance.currentUser
        .updateProfile(displayName: user.displayName);

    // user.updateProfile(info);

    return _userFromFirebaseUser(user);
  }

// sign in with email & passwod
  Future signInUser(String email, String password) async {
    try {
      // AuthResult
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //FirebaseUser
      User user = result.user;
      // UserUpdateInfo info = UserUpdateInfo();
      await FirebaseAuth.instance.currentUser
          .updateProfile(displayName: user.displayName);

      //  user.updateProfile(info);
      User_d(uid: result.user.uid, name: result.user.displayName);
    } catch (error) {
      print(error.toString());
    }
  }

//register with email & password
  Future registerUser(String name, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      return _userFromFirebaseUser(user);
      // create a new document for the user the uid

      //return _userFromFirebaseUser(user);

    } catch (error) {
      print(error.toString());
      return error;
    }
  }

  //Google sing with new Mathod

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
      currentUser = null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<User_d> getUser() async {
    var FUser = await _auth.currentUser;
    return User_d(uid: FUser.uid, name: FUser.displayName);
  }

  Future<void> updateDisplayName(String displayName) async {
    var user = await _auth.currentUser;
    //user.updateProfile(UserUpdateInfo().displayName = displayName);
    user.updateProfile(displayName: displayName);
  }
//Sign in

}
