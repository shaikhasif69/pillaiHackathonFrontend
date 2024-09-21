import 'package:flutter/material.dart';

class AlumniDashboard extends StatefulWidget {
  const AlumniDashboard({super.key});

  @override
  State<AlumniDashboard> createState() => _AlumniDashboardState();
}

class _AlumniDashboardState extends State<AlumniDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Icon(Icons.arrow_back),
              Row(
                children: [
                  Icon(Icons.add_box_rounded),
                  Icon(Icons.notification_add_rounded)
                ],
              )
            ],
          ),
          Row(
            children: [
              Text("Hello, "),
              Text("Mentor, "),
            ],
          ), 
          Text("It’s a great day to learn something new!"),
          Container(
        margin: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/ic_search.png'),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Search all events...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ), 
        ],
      ),
    );
  }
}
