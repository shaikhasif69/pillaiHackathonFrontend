import 'package:pillai_hackcelestial/router/NamedRoutes.dart';
import 'package:pillai_hackcelestial/screens/HomeScreen.dart';
import 'package:pillai_hackcelestial/screens/On_Board/on_boarding.dart';
import 'package:pillai_hackcelestial/screens/Students/EventDescriptionPages/event_desciption_page2.dart';
import 'package:pillai_hackcelestial/screens/Students/EventDescriptionPages/event_description_page1.dart';
import 'package:pillai_hackcelestial/screens/Students/EventDescriptionPages/event_description_page3.dart';
import 'package:pillai_hackcelestial/screens/Students/EventDescriptionPages/event_description_page4.dart';
import 'package:pillai_hackcelestial/screens/Students/events_screen.dart';
import 'package:pillai_hackcelestial/screens/Students/multi_step_form.dart';
import 'package:pillai_hackcelestial/screens/Students/student_profile.dart';
import 'package:pillai_hackcelestial/screens/ask_loginPage.dart';
import 'package:pillai_hackcelestial/screens/college_id_login.dart';
import 'package:pillai_hackcelestial/screens/signup_page.dart';
import 'package:pillai_hackcelestial/screens/splash_screen.dart';
import 'package:pillai_hackcelestial/screens/userOtpForm.dart';
import 'package:pillai_hackcelestial/widgets/dummy_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class MyGoRouter {
  late final GoRouter router;

  MyGoRouter() {
    _initRouter();
  }

  Future<void> _initRouter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Check if the user is logged in
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    String? userType =
        prefs.getString('userType'); // Could be "student" or "faculty"

    String initialRoute = CommonRoutes.splashScreen;

    // if (isLoggedIn) {
    //   if (userType == 'student') {
    //     initialRoute = StudentsRoutes.studentHomePage;
    //   } else if (userType == 'faculty') {
    //     initialRoute = FacultyRoutes.facultyHomePage;
    //   }
    // } else {
    //   initialRoute =
    //       CommonRoutes.onBoardScreen; // If not logged in, go to onboarding
    // }

    router = GoRouter(
      initialLocation: CommonRoutes.splashScreen,
      // initialLocation: CommonRoutes.splashScreen,
      routes: [
        GoRoute(
          path: CommonRoutes.splashScreen,
          name: CommonRoutes.splashScreen,
          builder: (context, state) => const SplashScreen(),
        ),
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
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
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

        // GoRoute(
        //   path: StudentsRoutes.studentHomePage,
        //   name: StudentsRoutes.studentHomePage,
        //   builder: (context, state) => EventScreen(),
        // ),
        // GoRoute(
        //   path: StudentsRoutes.studentHomePage,
        //   name: StudentsRoutes.studentHomePage,
        //   builder: (context, state) => Homescreen(),
        // ),
        // GoRoute(
        //   path: StudentsRoutes.studentProfilePage,
        //   name: StudentsRoutes.studentProfilePage,
        //   builder: (context, state) => ProfileScreen(),
        // ),

        GoRoute(
          path: StudentsRoutes.studentHomePage,
          name: StudentsRoutes.studentHomePage,
          builder: (context, state) => ProfileScreen(),
        ),
        GoRoute(
          path: StudentsRoutes.eventPage3,
          name: StudentsRoutes.eventPage3,
          builder: (context, state) => EventDescPage3(),
        ),
        // GoRoute(
        //   path: StudentsRoutes.eventPage4,
        //   name: StudentsRoutes.eventPage4,
        //   builder: (context, state) => EventDescPage4(),
        // ),

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
        // ),
      ],
    );
  }
}
