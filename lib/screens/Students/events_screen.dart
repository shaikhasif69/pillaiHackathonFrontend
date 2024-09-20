import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/components/constant.dart';
import 'package:pillai_hackcelestial/model/Event.dart';
import 'package:pillai_hackcelestial/models/popular_model.dart';
import 'package:pillai_hackcelestial/services/event_services.dart';
import 'package:pillai_hackcelestial/widgets/event_card.dart';
import 'package:pillai_hackcelestial/widgets/popular_card.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  int _selectedTabIndex = 0; // 0 for Explore, 1 for My Events
  List<Event> events = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    try {
      List<Event> fetchedEvents = await EventServices.fetchOngoingEvents();
      setState(() {
        events = fetchedEvents;
        isLoading = false;
      });
      print(" asdfasdfasdf    " +  fetchedEvents.toString());
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
          top: 4,
          left: 24,
          right: 24,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  Row(
                  //   children: [
                  //     GestureDetector(
                  //       onTap: (){
                  //         print("notification page");
                  //       },
                  //       child: Icon(
                  //         Icons.notifications_active,
                  //         size: 50,
                  //       ),
                  //     ),
                  //     SizedBox(width: 20),
                  //     Icon(
                  //       Icons.add,
                  //       size: 40,
                  //     ),
                  //   ],
                  // ),
                  Text(
                    'Events',
                    style: GoogleFonts.agdasima(
                      fontSize: 38,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 48,
              width: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/img_profile.png'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget theTab() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Row(
          children: [
            // Explore Button
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTabIndex = 0;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _selectedTabIndex == 0
                        ? MyColors.ourPrimary
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Explore',
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          _selectedTabIndex == 0 ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // My Events Button
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTabIndex = 1;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _selectedTabIndex == 1
                        ? MyColors.ourPrimary
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'My Events',
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          _selectedTabIndex == 1 ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget search() {
      return Container(
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
      );
    }

    Widget upcomingEvents() {
      return Container(
        margin: const EdgeInsets.only(
          top: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Text(
                'Upcoming Events',
                style: GoogleFonts.agdasima(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: events.map((item) => EventCard(item)).toList(),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget popularNow() {
      return Container(
        margin: const EdgeInsets.only(
          top: 24,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Now',
                    style: GoogleFonts.agdasima(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'See All',
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children:
                        populars.map((item) => PopularCard(item)).toList()),
              ),
            )
          ],
        ),
      );
    }

    Widget EnroledEvents() {
      return Container(
        margin: const EdgeInsets.only(
          top: 24,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enrolled Events',
                    style: GoogleFonts.agdasima(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'See All',
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children:
                        populars.map((item) => PopularCard(item)).toList()),
              ),
            )
          ],
        ),
      );
    }

    Widget CompletedEvents() {
      return Container(
        margin: const EdgeInsets.only(
          top: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Text(
                'Complted Events',
                style: GoogleFonts.agdasima(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
                      isLoading
              ? Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: CircularProgressIndicator(), 
                )
              : events.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text('No events available', style: TextStyle(fontSize: 16)),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: events.map((item) => EventCard(item)).toList(),
                        ),
                      ),
                    )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: MyColors.ourBackground,
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            search(),
            theTab(),
            // Conditionally render based on selected tab
            _selectedTabIndex == 0
                ? Column(
                    children: [
                      upcomingEvents(),
                      popularNow(),
                    ],
                  )
                : Column(
                    children: [EnroledEvents(), CompletedEvents()],
                  ),
          ],
        ),
      ),
    );
  }
}
