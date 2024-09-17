import 'package:pillai_hackcelestial/router/NamedRoutes.dart';
import 'package:pillai_hackcelestial/screens/On_Board/on_boarding.dart';
import 'package:pillai_hackcelestial/screens/Students/multi_step_form.dart';
import 'package:pillai_hackcelestial/screens/ask_loginPage.dart';
import 'package:pillai_hackcelestial/screens/college_id_login.dart';
import 'package:pillai_hackcelestial/screens/signup_page.dart';
import 'package:pillai_hackcelestial/screens/splash_screen.dart';
import 'package:pillai_hackcelestial/screens/userOtpForm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class MyGoRouter {
  final GoRouter router = GoRouter(
    initialLocation: CommonRoutes.splashScreen,
    routes: [
      GoRoute(
        path: CommonRoutes.splashScreen,
        name: CommonRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: CommonRoutes.onBoardScreen,
        name: CommonRoutes.onBoardScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const on_boarding(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Fade transition
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),

      GoRoute(
        path: CommonRoutes.askLoginScreen,
        name: CommonRoutes.askLoginScreen,
        builder: (context, state) => AskLoginpage(),
      ),

      GoRoute(
        path: CommonRoutes.collegeIdLogin,
        name: CommonRoutes.collegeIdLogin,
        builder: (context, state) => CollegeIdLoginPage(),
      ),

      GoRoute(
        path: CommonRoutes.signUpScreen,
        name: CommonRoutes.signUpScreen,
        builder: (context, state) => SignUpPage(),
      ),

      // GoRoute(
      //   path: CommonRoutes.signUpScreen,
      //   name: CommonRoutes.signUpScreen,
      //   builder: (context, state) => SignUpPage(),
      // ),

      // Students Routes :

      GoRoute(
        path: StudentsRoutes.studentSetup,
        name: StudentsRoutes.studentSetup,
        builder: (context, state) => StudentMultiStepForm(),
      ),

      GoRoute(
        path: StudentsRoutes.studentHomePage,
        name: StudentsRoutes.studentHomePage,
        // builder: (context, state) => StudentMultiStepForm(),
      ),

      // faculty Routes :
      GoRoute(
        path: FacultyRoutes.facultyHomePage,
        name: FacultyRoutes.facultyHomePage,
        // builder: (context, state) => StudentMultiStepForm(),
      ),

      // GoRoute(
      //   path: CommonRoutes.homeScreen,
      //   name: CommonRoutes.homeScreen,
      //   builder: (context, state) => const MyHomePage(title: "Home"),
      // ),
    ],
  );
}
