import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/model/user.dart';
import 'package:pillai_hackcelestial/providers/userData.dart';

class UserProfileHomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _UserProfilePage();
    throw UnimplementedError();
  }
}

class _UserProfilePage extends ConsumerState<UserProfileHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(userDataprovider.notifier).getUserData();
    });
  }

  Widget build(context) {
    var data = ref.watch(userDataprovider);
    return data == null
        ? Center(child: CircularProgressIndicator())
        : Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: data.imageUrl == null || data.imageUrl == ""
                              ? AssetImage("assets/images/ACADEMICVERSE.png")
                              : NetworkImage(data.imageUrl))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "WELCOME ",
                      style: GoogleFonts.abyssinicaSil(fontSize: 24),
                    ),
                    Text(
                      data.username,
                      style: GoogleFonts.abyssinicaSil(fontSize: 24),
                    )
                  ],
                ),
              )
            ],
          );
  }
}
