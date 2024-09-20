import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/model/Faculty.dart';

class MentorCards extends ConsumerWidget {
  Faculty data;
  MentorCards({required this.data});
  Widget build(contex, ref) {
    // final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 320,
        decoration: BoxDecoration(
          border: Border.all(width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  height: 100,
                  width: 100,
                  
                  decoration: BoxDecoration(
                    color: Colors.amber,
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
                      width: 168,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        data.department.toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color.fromARGB(157, 163, 68, 247)),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          "View Profile",
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w300),
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
