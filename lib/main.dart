import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/Socket/init.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'package:pillai_hackcelestial/models/faculty.dart';
import 'package:pillai_hackcelestial/models/student.dart';
import 'package:pillai_hackcelestial/router/router.dart';
import 'package:pillai_hackcelestial/screens/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  mySocketConnect.connect();
  // Register the adapters
  Hive.registerAdapter(StudentAdapter());
  Hive.registerAdapter(FacultyAdapter());
  // Open boxes (for example, on app start)
  await Hive.openBox<Student>('studentsBox');
  await Hive.openBox<Faculty>('facultyBox');
  runApp(ProviderScope(child: MyApp())); // Wrap MyApp with ProviderScope
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  final MyGoRouter myGoRouter = MyGoRouter();

  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
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
