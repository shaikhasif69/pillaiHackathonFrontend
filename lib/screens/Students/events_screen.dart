import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/components/constant.dart';
import 'package:pillai_hackcelestial/model/enroledEventModel.dart';
import 'package:pillai_hackcelestial/model/event_model.dart';
import 'package:pillai_hackcelestial/model/onGoingEventMode.dart';
import 'package:pillai_hackcelestial/model/upComingEventModel.dart';
import 'package:pillai_hackcelestial/models/popular_model.dart';
import 'package:pillai_hackcelestial/services/event_services.dart';
import 'package:pillai_hackcelestial/widgets/enroled_event_card.dart';
import 'package:pillai_hackcelestial/widgets/event_card.dart';
import 'package:pillai_hackcelestial/widgets/past_event_card.dart';
import 'package:pillai_hackcelestial/widgets/upcoming_event_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  int _selectedTabIndex = 0;
  List<OnGoingEventModel> events2 = [];
  List<UpcomingEvent> events3 = [];
  List<EnrolledEventModel> enroledEvent = [];
  bool isLoading = true;
  bool isLoading2 = true;
  bool isLoading1 = true;
  bool isLoadingPast = true;

  @override
  void initState() {
    super.initState();
    fetchUpEvents();
    fetchUpcomingEvents();
    fetchEnrolledEvents();
  }

  Future<void> fetchUpEvents() async {
    print("Starting upcomings fetchEvents...");
    setState(() {
      isLoading2 = true;
    });

    try {
      List<OnGoingEventModel> fetchedEvents =
          await EventServices.fetchOngoingEvents();

      print(
          "Fetched Ongoing Events: ${fetchedEvents.map((event) => event.title).toList()}");

      setState(() {
        events2 = fetchedEvents;
        isLoading2 = false;
      });
    } catch (e) {
      print("Error fetching events: $e");

      setState(() {
        isLoading2 = false;
      });
    }
  }

  Future<void> fetchUpcomingEvents() async {
    print("Starting upcoming events fetch...");
    setState(() {
      isLoading = true;
    });

    try {
      List<UpcomingEvent> fetchedEvents =
          await EventServices.fetchUpcomingEvents();

      print(
          "Fetched Upcoming Events: ${fetchedEvents.map((event) => event.title).toList()}");

      setState(() {
        events3 = fetchedEvents;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching events: $e");
      setState(() {
        isLoading = false;
      });
    }
  }
   Future<void> fetchEnrolledEvents() async {
    print("Starting enrolled events fetch...");

    setState(() {
      isLoading1 = true;
    });

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String authToken = pref.getString("authToken")!;
      print("token : " + authToken);

      List<EnrolledEventModel>? fetchedEvents =
          await EventServices.fetchEnrolledEvents(authToken);

      print(
          "Fetched Enrolled Events: ${fetchedEvents!.map((event) => event.title).toList()}");

      setState(() {
        enroledEvent = fetchedEvents!;
        isLoading1 = false;
      });
    } catch (e) {
      print("Error fetching enrolled events: $e");
      setState(() {
        isLoading1 = false;
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

    // Widget upcomingEvents() {
    //   return Container(
    //     margin: const EdgeInsets.only(
    //       top: 24,
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.symmetric(
    //             horizontal: 24,
    //           ),
    //           child: Text(
    //             'OnGoing Events',
    //             style: GoogleFonts.agdasima(
    //               fontSize: 28,
    //               fontWeight: FontWeight.w600,
    //               color: Colors.black,
    //             ),
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 13,
    //         ),
    //         isLoading
    //             ? Padding(
    //                 padding: const EdgeInsets.only(
    //                   left: 24,
    //                 ),
    //                 child: SingleChildScrollView(
    //                   scrollDirection: Axis.horizontal,
    //                   child: Row(
    //                     children:
    //                         events2.map((item) => EventCard(item)).toList(),
    //                   ),
    //                 ),
    //               )
    //             : Text("No Event Available")
    //       ],
    //     ),
    //   );
    // }

    Widget UpcomingEventClass() {
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
                    'Upcoming Events',
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
                    children: events3
                        .map((item) => UpcomingEventWidget(item))
                        .toList()),
              ),
            )
          ],
        ),
      );
    }

    Widget pastEvents() {
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
                    'Past Events',
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
           isLoadingPast ?  Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: events3
                        .map((item) => PastEventCard(item))
                        .toList()),
              ),
            ) : Text("No Past Events")
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
          isLoading1 ?   Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children:
                        enroledEvent == null ? [ Text("No Enrolled Events")] : enroledEvent.map((item) => EnroledEventCard(item)).toList()),
              ),
            ) : Text("No Enrolled Events")
          ],
        ),
      );
    }

    Widget OnGoingEvents() {
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
                'OnGoing Events',
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
            isLoading2
                ? Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: CircularProgressIndicator(),
                  )
                : events2.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text('No events available',
                            style: TextStyle(fontSize: 16)),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children:
                                events2.map((item) => EventCard(item)).toList(),
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
                      OnGoingEvents(),
                      UpcomingEventClass(),
                    ],
                  )
                : Column(
                    children: [EnroledEvents(), pastEvents()],
                  ),
          ],
        ),
      ),
    );
  }
}
