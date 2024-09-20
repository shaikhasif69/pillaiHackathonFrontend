import 'package:pillai_hackcelestial/model/community.dart';
import 'package:pillai_hackcelestial/models/UserChatList.dart';
import 'package:pillai_hackcelestial/router/NamedRoutes.dart';
import 'package:pillai_hackcelestial/screens/Chatin/ChatBot.dart';
import 'package:pillai_hackcelestial/screens/Chatin/ChattingPage.dart';
import 'package:pillai_hackcelestial/screens/Chatin/chatList.dart';
import 'package:pillai_hackcelestial/screens/Communities/AddPost.dart';
import 'package:pillai_hackcelestial/screens/Communities/Commnuinty.dart';
import 'package:pillai_hackcelestial/screens/Communities/CommunityDetails.dart';
import 'package:pillai_hackcelestial/screens/Communities/MyCommunity.dart';
import 'package:pillai_hackcelestial/screens/Communities/createCommunity.dart';
import 'package:pillai_hackcelestial/screens/Communities/MycreatedCommunity.dart';
import 'package:pillai_hackcelestial/screens/Event/createEvent.dart';
import 'package:pillai_hackcelestial/screens/HomeScreen.dart';
import 'package:pillai_hackcelestial/screens/On_Board/on_boarding.dart';
import 'package:pillai_hackcelestial/screens/StudentFourm/studentFourm.dart';
import 'package:pillai_hackcelestial/screens/Students/EventDescriptionPages/event_description_page3.dart';
import 'package:pillai_hackcelestial/screens/Students/EventDescriptionPages/event_description_page4.dart';
import 'package:pillai_hackcelestial/screens/Students/events_screen.dart';
import 'package:pillai_hackcelestial/screens/Students/multi_step_form.dart';
import 'package:pillai_hackcelestial/screens/Students/student_profile.dart';
import 'package:pillai_hackcelestial/screens/ask_loginPage.dart';
import 'package:pillai_hackcelestial/screens/college_id_login.dart';
import 'package:pillai_hackcelestial/screens/signup_page.dart';
import 'package:pillai_hackcelestial/screens/splash_screen.dart';
import 'package:pillai_hackcelestial/widgets/dummy_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class MyGoRouter {
  final GoRouter router =
      GoRouter(initialLocation: CommonRoutes.splashScreen, routes: [
    GoRoute(
      path: CommonRoutes.splashScreen,
      name: CommonRoutes.splashScreen,
      builder: (context, state) => SplashScreen(),
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
      path: StudentsRoutes.addCommunityPost,
      name: StudentsRoutes.addCommunityPost,
      builder: (context, state) {
        Communites data = state.extra as Communites;
        return AddPost(data: data);
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
    // GoRoute(
    //     path: StudentsRoutes.createCommitteForm,
    //     name: StudentsRoutes.createCommitteForm,
    //     pageBuilder: (context, state) {
    //       return MaterialPage(child: createCommitteForm());
    //     }),
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

    // GoRoute(
    //   path: CommonRoutes.onBoardScreen,
    //   name: CommonRoutes.onBoardScreen,
    //   pageBuilder: (context, state) {
    //     return CustomTransitionPage(
    //       child: const on_boarding(),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return FadeTransition(
    //           opacity: animation,
    //           child: child,
    //         );
    //       },
    //     );
    //   },
    // ),
    ,

    GoRoute(
      path: CommonRoutes.signUpScreen,
      name: CommonRoutes.signUpScreen,
      builder: (context, state) => SignUpPage(),
    ),
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
        path: StudentsRoutes.myCreatedCommunity,
        name: StudentsRoutes.myCreatedCommunity,
        builder: (context, state) {
          Communites data = state.extra as Communites;

          return MyCreatedCommunityPage(data: data);
        }),

    GoRoute(
      path: StudentsRoutes.studentHomePage,
      name: StudentsRoutes.studentHomePage,
      builder: (context, state) => Homescreen(),
    ),
    GoRoute(
      path: StudentsRoutes.studentProfilePage,
      name: StudentsRoutes.studentProfilePage,
      builder: (context, state) => ProfileScreen(),
    ),
           GoRoute(
          path: StudentsRoutes.eventPage1,
          name: StudentsRoutes.eventPage1,
          builder: (context, state) => EventScreen(),
        ),
    GoRoute(
      path: StudentsRoutes.eventPage3,
      name: StudentsRoutes.eventPage3,
      builder: (context, state) => EventDescPage3(),
    ),
    GoRoute(
      path: StudentsRoutes.eventPage4,
      name: StudentsRoutes.eventPage4,
      builder: (context, state) => EventDescPage4(),
    ),
    GoRoute(
      path: StudentsRoutes.chattingList,
      name: StudentsRoutes.chattingList,
      builder: (context, state) => ChatList(),
    ),
    GoRoute(
      path: StudentsRoutes.chattingPage,
      name: StudentsRoutes.chattingPage,
      builder: (context, state) {
        UserChatList data = state.extra as UserChatList;
        return ChattingPage(
          user: data,
        );
      },
    ),
    GoRoute(
      path: StudentsRoutes.StudentFourm,
      name: StudentsRoutes.StudentFourm,
      builder: (context, state) {
        return StudentForum();
      },
    ),
    GoRoute(
      path: StudentsRoutes.chatBot,
      name: StudentsRoutes.chatBot,
      builder: (context, state) {
        return ChatBot();
      },
    ),
    GoRoute(
      path: StudentsRoutes.createEvent,
      name: StudentsRoutes.createEvent,
      builder: (context, state) {
        Communites data = state.extra as Communites;
        return CreateEvent(
          data: data,
        );
      },
    ),

        //    GoRoute(
        //   path: FacultyRoutes.facultyHomePage,
        //   name: FacultyRoutes.facultyHomePage,
        //   // builder: (context, state) => facultyHomePage(),
        // ),
  ]);
}
