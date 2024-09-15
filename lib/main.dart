import 'package:flutter/material.dart';
import 'package:pillai_hackcelestial/provider/StudentForm.dart';
import 'package:pillai_hackcelestial/router/router.dart';
import 'package:pillai_hackcelestial/screens/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => StudentFormModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  final MyGoRouter myGoRouter = MyGoRouter();

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
