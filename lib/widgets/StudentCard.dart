import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentCard extends ConsumerWidget {
  const StudentCard();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      child: Container(
        // height: 300,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/Ellipse 9.png"))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Jhon Smart",
                    style: GoogleFonts.montserrat(fontSize: 14),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 170,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/Rectangle 90.png"))),
              ),
              Container(
                // width: double.infinity,
                // color: Colors.amber,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "120k",
                      style: GoogleFonts.montserrat(fontSize: 16),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(size: 30, Icons.favorite_border))
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
