import 'package:firebase_auth/firebase_auth.dart';
import 'package:suited/models/LoggedUser.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  //create user obj based on firebase user
  LoggedUser? _loggedUserFromFirebaseUser(User? user){
    return user != null ? LoggedUser(uid: user.uid) : null;
  }

  //Auth change user stream
  Stream<LoggedUser?> get user {
    return _auth.userChanges()
    .map(_loggedUserFromFirebaseUser);
  }


  //sign in Anom.
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      LoggedUser? user = _loggedUserFromFirebaseUser(result.user);
      return user; 
    }catch (e) {
      print(e.toString());
      return null;
    }
    
  }

  //sign E-Mail password.


  //register E-mail password.


  //sign-out


}