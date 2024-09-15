import 'package:pillai_hackcelestial/router/NamedRoutes.dart';
import 'package:pillai_hackcelestial/screens/On_Board/on_boarding.dart';
import 'package:pillai_hackcelestial/screens/Students/student_form.dart';
import 'package:pillai_hackcelestial/screens/ask_loginPage.dart';
import 'package:pillai_hackcelestial/screens/college_id_login.dart';
import 'package:pillai_hackcelestial/screens/splash_screen.dart';
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



      // Students Routes : 

    GoRoute(
        path: StudentsRoutes.studentSetup,
        name: StudentsRoutes.studentSetup,
        builder: (context, state) => StudentForm(),
      )



      // GoRoute(
      //   path: CommonRoutes.homeScreen,
      //   name: CommonRoutes.homeScreen,
      //   builder: (context, state) => const MyHomePage(title: "Home"),
      // ),
    ],
  );
}
