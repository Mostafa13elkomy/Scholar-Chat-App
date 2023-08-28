import 'dart:core';
import 'package:KomyChat/pages/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helper/showSnackbar.dart';
import '../widgets/consts.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_text_feild.dart';

class RegisterPage extends StatefulWidget {
    const RegisterPage({super.key});
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String id = 'RegisterPage';

  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: KPrimaryColor,
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                'assets/images/scholar.png',
                height: 100,
              ),
            const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'School Chat',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontFamily: 'Pacifico'),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
                  const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Sing Up',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              CustomFormTextFeild(
              
                onChanged: (data) {
                  email = data;
                },
                hintText: 'Email',
              ),
              CustomFormTextFeild(
                obscureText: true,
                onChanged: (data) {
                  password = data;
                },
                hintText: 'Password',
              ),
              CustomButtom(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                      try  {
                      await register();
                      Navigator.pushNamed(context, ChatPage.id,arguments: email);
                    
                      } on FirebaseAuthException catch (ex) {
                      if (ex.code == 'user-not-found') {
                        showSnackBar(context, 'user not found');
                      } else if (ex.code == 'wrong-password') {
                        showSnackBar(context, 'wrong password');
                      }
                      } catch (ex) {
                      showSnackBar(context, 'there was an error');
                    }
                    isLoading = false;
                    setState(() {});
                  } else {}
                },
                text: 'Sing up',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'already have an account ? ',
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      ' Log in',
                      style: TextStyle(
                        color: Color.fromARGB(255, 33, 243, 169),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
    UserCredential User = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
