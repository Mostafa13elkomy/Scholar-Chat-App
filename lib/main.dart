
import 'package:KomyChat/pages/chat_page.dart';
import 'package:KomyChat/pages/cubits/login_cubit/login_cubit.dart';
import 'package:KomyChat/pages/login_page.dart';
import 'package:KomyChat/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginPageState.id: (context) => LoginPageState(),
          RegisterPage.id: (context) => RegisterPage(),
        ChatPage.id :(context) => ChatPage()
        },
        initialRoute: 'Login_page',
      ),
    );
  }
}
