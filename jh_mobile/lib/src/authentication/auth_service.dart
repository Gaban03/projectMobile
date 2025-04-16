import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jh_mobile/views/_views_lib.dart';

class AuthService {

  // Função para pegar o atual usuario logado
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Metodo de login
  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {

      try {
        await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
        );

        await Future.delayed(const Duration(milliseconds: 500));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const HomeView()
          )
        );
      } on FirebaseAuthException catch(e){
        String message = '';
        if (e.code == 'invalid-email'){
          message = 'Nenhum usuario encontrado com esse email.';
        } else if(e.code == 'wrong-password'){
          message = 'Senha incorreta';
        }
        else {
          message = 'Erro ao fazer login. Tente novamente.';
        }
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 14.0,
        );
      }
  }

  /*
  Login com microsoft:
  */

  // Future<void> signInWithMicrosoft({
  //   required BuildContext context,
  // }) async {
  //   try {
  //     final provider = OAuthProvider("microsoft.com");
  //     provider.setCustomParameters({
  //       "tenant": "25427393-5ef7-4137-b86b-b7a572e91aa1"
  //     });

  //     final credential = await _firebaseAuth.signInWithProvider(provider);
  //     if (credential.user != null) {
  //       await Future.delayed(const Duration(milliseconds: 500));
  //       Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //               builder: (BuildContext context) => const HomeView()
  //           )
  //       );
  //     }
  //   } catch (e) {
  //     debugPrint("Erro ao fazer login com provedor: $e");
  //     Fluttertoast.showToast(
  //       msg: "Erro ao tentar fazer login. Tente novamente.",
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.BOTTOM,
  //       backgroundColor: Colors.black54,
  //       textColor: Colors.white,
  //       fontSize: 14.0,
  //     );
  //   }
  // }

  Future<void> loginWithGoogle({
    required BuildContext context,
}) async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      debugPrint("Erro ao fazer login com provedor: $e");
      Fluttertoast.showToast(
        msg: "Erro ao tentar fazer login. Tente novamente.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  // Metodo de deslogar
  Future<void> signout({required BuildContext context}) async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();

      // Espera só pra garantir limpeza
      await Future.delayed(Duration(milliseconds: 300));

      MaterialPageRoute(
            builder: (BuildContext context) => Login()
        );
    } catch (e) {
      debugPrint("Erro ao deslogar: $e");
    }
  }
}