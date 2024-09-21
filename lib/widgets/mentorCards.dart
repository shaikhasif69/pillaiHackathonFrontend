import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/components/constant.dart';
import 'package:pillai_hackcelestial/model/Faculty.dart';
import 'package:pillai_hackcelestial/router/NamedRoutes.dart';

class MentorCards extends ConsumerWidget {
  Faculty data;
  MentorCards({required this.data});
  Widget build(c, ref) {
    final screenWidth = MediaQuery.of(c).size.width;
    final screenHeight = MediaQuery.of(c).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenWidth * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  height: screenHeight * 0.15,
                  width: screenWidth * 0.25,
                  
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(data.imageUrl!)),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 20, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Prof " + data.username!,
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Sr. Professor",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    Container(
                      // color: Colors.amber,
                      // height: 30,
                      width: screenWidth * 0.48,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        data.department.toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: MyColors.ourPrimary),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: GestureDetector(
                            onTap: () {
                              GoRouter.of(c).pushNamed(StudentsRoutes.mentorDesPage);
                            },
                            child: Text(
                              "View Profile",
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.w300, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
