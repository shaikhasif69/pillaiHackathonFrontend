import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/model/community.dart';

class EventsCard extends ConsumerWidget {
  Communites data;
  EventsCard({required this.data});
  Widget build(context, ref) {
    return Card(
      child: Container(
        // height: 300,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                height: 120,
                width: 130,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: data.imageUrl == null
                            ? AssetImage("assets/images/Rectangle 20.png")
                            : NetworkImage(data.imageUrl!))),
              ),
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name!,
                      style: GoogleFonts.lato(fontSize: 16),
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        data.description!,
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            color: Color.fromARGB(103, 58, 58, 60)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Join",
                      style: GoogleFonts.lato(fontSize: 13),
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
