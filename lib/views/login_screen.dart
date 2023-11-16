import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:suited/controller/auth_controller.dart';
import 'components/components.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Account Login"),
        ),
        body: Center(
          child: _form(context),
        ));
  }

  Widget _anomLogin() {
    return Container(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(width: 1, color: Colors.grey)),
        child: const Text('Sign-in Anon'),
        onPressed: () async {
          await _authController.signInAnon();
        },
      ),
    );
  }

  Widget _form(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _anomLogin(),
        const SizedBox(
          height: 30,
        ),
        const TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              isDense: true,
              border: OutlineInputBorder(),
              hintText: 'E-mail',
              suffixIcon: Icon(FontAwesomeIcons.user)),
        ),
        const SizedBox(
          height: 10,
        ),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              isDense: true,
              border: OutlineInputBorder(),
              hintText: 'Password',
              suffixIcon: Icon(FontAwesomeIcons.lock)),
        ),
        const SizedBox(
          height: 10,
        ),
        _btn(),
      ]),
    );
  }

  //TODO: TRANSFORMAR EM COMPONENTE
  Widget _btn() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.only(
                    top: 6.0, bottom: 6, right: 16, left: 16),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                dev.log('message');
              },
              child: const Text('Button')),
        ]));
  }
}
