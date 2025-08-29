import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_flutter/screens/ad.dart';
import 'package:project_flutter/screens/admin_bottom_nav.dart';
import 'package:project_flutter/screens/admin_home.dart';
import 'package:project_flutter/screens/auth/register_screen.dart';
import 'package:project_flutter/screens/categories.dart';
import 'package:project_flutter/screens/intro/sub_onboarding/onboarding1.dart';
import 'package:project_flutter/screens/job_details.dart';
import 'package:project_flutter/screens/profile_screen.dart';
import 'package:project_flutter/screens/user_home_screen.dart';
import 'package:project_flutter/screens/test3.dart';
import 'package:project_flutter/screens/user_buttom_nav.dart';
import 'package:project_flutter/screens/home_screen.dart';
import 'package:project_flutter/screens/intro/onbording_screens.dart';
import 'package:project_flutter/screens/intro/splash_screen.dart';
import 'package:project_flutter/screens/auth/add_email.dart';
import 'package:project_flutter/screens/auth/admin_user.dart';
import 'package:project_flutter/screens/auth/login_screen.dart';
import 'package:project_flutter/screens/auth/verify_email.dart';
import 'package:project_flutter/screens/auth/reset_password.dart';
import 'package:project_flutter/screens/job_category.dart';
import 'package:project_flutter/screens/sph.dart';
import 'package:project_flutter/screens/test.dart';

import 'firebase_options.dart';



Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await SharedPrefHelper().initPref();
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        
      ),
      home: ButtomNav(),
      debugShowCheckedModeBanner: false,
      

    );
  }
}

