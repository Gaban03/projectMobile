import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jh_mobile/views/_views_lib.dart';

class AuthService {

  // Metodo de login
  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
        );

        await Future.delayed(const Duration(seconds: 1));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const HomeView()
          )
        );
      } on FirebaseAuthException catch(e){
        String message = '';
        if (e.code == 'user-not-found'){
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

  // Metodo de deslogar
  Future<void> signout({
    required BuildContext context
  }) async {

    await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Login()
      )
    );
  }

}