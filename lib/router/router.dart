import 'package:pillai_hackcelestial/model/community.dart';
import 'package:pillai_hackcelestial/router/NamedRoutes.dart';
import 'package:pillai_hackcelestial/screens/Communities/Commnuinty.dart';
import 'package:pillai_hackcelestial/screens/Communities/CommunityDetails.dart';
import 'package:pillai_hackcelestial/screens/Communities/MyCommunity.dart';
import 'package:pillai_hackcelestial/screens/Communities/createCommunity.dart';
import 'package:pillai_hackcelestial/screens/HomeScreen.dart';
import 'package:pillai_hackcelestial/screens/On_Board/on_boarding.dart';
import 'package:pillai_hackcelestial/screens/ask_loginPage.dart';
import 'package:pillai_hackcelestial/screens/college_id_login.dart';
import 'package:pillai_hackcelestial/screens/committe/create/createCommitte.dart';
import 'package:pillai_hackcelestial/screens/committe/create/createCommitteform.dart';
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
        builder: (context, state) => Homescreen(),
      ),
      GoRoute(
        path: StudentsRoutes.communityDetails,
        name: StudentsRoutes.communityDetails,
        builder: (context, state) {
          Communites data = state.extra as Communites;
          return CommnunityDetails(data: data);
        },
      ),
      GoRoute(
        path: StudentsRoutes.createCommunity,
        name: StudentsRoutes.createCommunity,
        builder: (context, state) {
          return CreateCommunity();
        },
      ),
      GoRoute(
        path: StudentsRoutes.MyCommunity,
        name: StudentsRoutes.MyCommunity,
        builder: (context, state) {
          Communites d = state.extra as Communites;
          return Mycommunity(
            data: d,
          );
        },
      ),
      GoRoute(
        path: StudentsRoutes.community,
        name: StudentsRoutes.community,
        builder: (context, state) => CommnuintyPage(),
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
          path: StudentsRoutes.createCommitte,
          name: StudentsRoutes.createCommitte,
          pageBuilder: (context, state) {
            return MaterialPage(child: createCommitte());
          }),
      GoRoute(
          path: StudentsRoutes.createCommitteForm,
          name: StudentsRoutes.createCommitteForm,
          pageBuilder: (context, state) {
            return MaterialPage(child: createCommitteForm());
          }),
      GoRoute(
        path: CommonRoutes.askLoginScreen,
        name: CommonRoutes.askLoginScreen,
        builder: (context, state) => AskLoginpage(),
      ),

      GoRoute(
        path: CommonRoutes.collegeIdLogin,
        name: CommonRoutes.collegeIdLogin,
        builder: (context, state) => CollegeIdLoginPage(),
      )
      // GoRoute(
      //   path: CommonRoutes.homeScreen,
      //   name: CommonRoutes.homeScreen,
      //   builder: (context, state) => const MyHomePage(title: "Home"),
      // ),
    ],
  );
}
