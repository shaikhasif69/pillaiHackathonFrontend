import 'package:pillai_hackcelestial/model/community.dart';
import 'package:pillai_hackcelestial/router/NamedRoutes.dart';
import 'package:pillai_hackcelestial/screens/Communities/Commnuinty.dart';
import 'package:pillai_hackcelestial/screens/Communities/CommunityDetails.dart';
import 'package:pillai_hackcelestial/screens/Communities/MyCommunity.dart';
import 'package:pillai_hackcelestial/screens/Communities/createCommunity.dart';
import 'package:pillai_hackcelestial/screens/HomeScreen.dart';
import 'package:pillai_hackcelestial/screens/On_Board/on_boarding.dart';
import 'package:pillai_hackcelestial/screens/Students/multi_step_form.dart';
import 'package:pillai_hackcelestial/screens/ask_loginPage.dart';
import 'package:pillai_hackcelestial/screens/college_id_login.dart';
import 'package:pillai_hackcelestial/screens/committe/create/createCommitte.dart';
import 'package:pillai_hackcelestial/screens/committe/create/createCommitteform.dart';
import 'package:pillai_hackcelestial/screens/signup_page.dart';
import 'package:pillai_hackcelestial/screens/splash_screen.dart';

import 'package:pillai_hackcelestial/widgets/dummy_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class MyGoRouter {
  Future<void> _initRouter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Check if the user is logged in
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    String? userType =
        prefs.getString('userType'); // Could be "student" or "faculty"

    String initialRoute = CommonRoutes.splashScreen;

    if (isLoggedIn) {
      if (userType == 'student') {
        initialRoute = StudentsRoutes.studentHomePage;
      } else if (userType == 'faculty') {
        initialRoute = FacultyRoutes.facultyHomePage;
      }
    } else {
      initialRoute =
          CommonRoutes.onBoardScreen; // If not logged in, go to onboarding
    }
  }

  final GoRouter router =
      GoRouter(initialLocation: CommonRoutes.splashScreen, routes: [
    // GoRoute(
    //   path: CommonRoutes.splashScreen,
    //   name: CommonRoutes.splashScreen,
    //   builder: (context, state) => Homescreen(),
    // ),
    GoRoute(
      path: CommonRoutes.splashScreen,
      name: CommonRoutes.splashScreen,
      builder: (context, state) => const SplashScreen(),
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
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Fade transition
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
    // GoRoute(
    //     path: StudentsRoutes.createCommitte,
    //     name: StudentsRoutes.createCommitte,
    //     pageBuilder: (context, state) {
    //       return MaterialPage(child: createCommitte());
    //     }),
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
    ), // GoRoute(
    //   path: CommonRoutes.splashScreen,
    //   name: CommonRoutes.splashScreen,
    //   builder: (context, state) => Homescreen(),
    // ),

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
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Fade transition
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
    // GoRoute(
    //     path: StudentsRoutes.createCommitte,
    //     name: StudentsRoutes.createCommitte,
    //     pageBuilder: (context, state) {
    //       return MaterialPage(child: createCommitte());
    //     }),
    GoRoute(
        path: StudentsRoutes.createCommitteForm,
        name: StudentsRoutes.createCommitteForm,
        pageBuilder: (context, state) {
          return MaterialPage(child: createCommitteForm());
        }),

    // GoRoute(
    //   path: CommonRoutes.splashScreen,
    //   name: CommonRoutes.splashScreen,
    //   builder: (context, state) => const SplashScreen(),
    // ),
    GoRoute(
      path: CommonRoutes.onBoardScreen,
      name: CommonRoutes.onBoardScreen,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const on_boarding(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
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

// >>>>>>> da927776650a71c194649b51ffdeabc1dd3de602
    GoRoute(
      path: StudentsRoutes.studentSetup,
      name: StudentsRoutes.studentSetup,
      builder: (context, state) {
        return FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData) {
              bool? formFilled = snapshot.data?.getBool('formFilled');
              if (formFilled == true) {
                Future.microtask(() {
                  GoRouter.of(context)
                      .pushNamed(StudentsRoutes.studentHomePage);
                });
                return const SizedBox
                    .shrink(); // Empty widget while redirecting
              }
            }

            return StudentMultiStepForm();
          },
        );
      },
    ),

    GoRoute(
      path: StudentsRoutes.studentHomePage,
      name: StudentsRoutes.studentHomePage,
      builder: (context, state) => DummyHomePage(),
    )
  ]);
}

// faculty Routes :
// GoRoute(
//   path: FacultyRoutes.facultyHomePage,
//   name: FacultyRoutes.facultyHomePage,
//   // builder: (context, state) => StudentMultiStepForm(),
// ),

// GoRoute(
//   path: CommonRoutes.homeScreen,
//   name: CommonRoutes.homeScreen,
//   builder: (context, state) => const MyHomePage(title: "Home"),
// ),]);}

// <<<<<<< HEAD

// =======
//   late final GoRouter router;

//   MyGoRouter() {
//     _initRouter();
//   }

// router = GoRouter(
//   initialLocation: CommonRoutes.splashScreen,
//   // initialLocation: CommonRoutes.splashScreen,
//   routes: [
//               ],
// );
//   }
// }
