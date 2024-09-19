import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Socket/init.dart';
import 'package:pillai_hackcelestial/router/router.dart';
import 'package:pillai_hackcelestial/screens/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  // connectSocket();
  // MySocketConnetion.connect();
  mySocketConnect.connect();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  final MyGoRouter myGoRouter = MyGoRouter(); // Initialize GoRouter

  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: myGoRouter.router,
        );
      },
    );
  }
}
