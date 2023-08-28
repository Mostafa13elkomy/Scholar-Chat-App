import 'package:KomyChat/helper/showSnackbar.dart';
import 'package:KomyChat/pages/chat_page.dart';
import 'package:KomyChat/pages/cubits/login_cubit/login_cubit.dart';
import 'package:KomyChat/pages/register_page.dart';
import 'package:KomyChat/widgets/custom_buttom.dart';
import 'package:KomyChat/widgets/custom_text_feild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/consts.dart';

class LoginPageState extends StatelessWidget {
  static String id = 'Login_page';
  String? password;
  String? email;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSucsess) {
          Navigator.pushNamed(context, ChatPage.id);
          isLoading = false;
        } else if (state is LoginFailur) {
          isLoading = false;
          return showSnackBar(context, state.erromessage);
        }
      },
      builder: (context, state) => ModalProgressHUD(
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
                      'LOGIN',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                CustomFormTextFeild(
                  hintText: 'Email',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                CustomFormTextFeild(
                  obscureText: true,
                  hintText: 'Password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
              CustomButtom (
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context)
                          .login(email: email!, Password: password!);
                    } else {}
                  },
                  text: 'LOGIN',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'don,t have an account ? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: const Text(
                        ' Sign Up',
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
      ),
    );
  }

  Future<void> login() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
