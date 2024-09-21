import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pillai_hackcelestial/components/constant.dart';
import 'package:pillai_hackcelestial/model/community.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pillai_hackcelestial/screens/Staffs/staff_profile_page.dart';
import 'package:pillai_hackcelestial/screens/Students/search_page.dart';
import 'package:pillai_hackcelestial/services/community_services.dart';

class facultyHomePage extends StatefulWidget {
  const facultyHomePage({super.key});

  @override
  State<facultyHomePage> createState() => _facultyHomePageState();
}

class _facultyHomePageState extends State<facultyHomePage> {
  late Future<List<Communites>> futureCommunities;

  int page = 0;

  List<IconData> icons = [
    FontAwesomeIcons.home,
    FontAwesomeIcons.envelope,
    FontAwesomeIcons.user,
  ];

  @override
  void initState() {
    super.initState();
    futureCommunities =
        CommunityServices.fetchCommunities(); // Fetch communities on init
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    List<Widget> pages = [
      facultyDashboard(screenHeight),
      // MentorshipPage(),
      SearchPage(),
      // EventScreen(),
      StaffProfilePage()
    ];

    return Scaffold(
      backgroundColor: MyColors.ourBackground,
      body: pages[page],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: icons,
        iconSize: 25,
        activeIndex: page,
        height: 65,
        splashSpeedInMilliseconds: 300,
        gapLocation: GapLocation.none,
        activeColor: const Color.fromARGB(255, 0, 190, 165),
        inactiveColor: const Color.fromARGB(255, 223, 219, 219),
        onTap: (int tappedIndex) {
          setState(() {
            page = tappedIndex;
          });
        },
      ),
    );
  }

  Column facultyDashboard(double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.arrow_back,
              size: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.add_box,
                  size: 40,
                ),
                Icon(
                  Icons.notification_add_sharp,
                  size: 40,
                )
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            "Hello !!!",
            style: TextStyle(fontSize: 25),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            "It’s a great day to learn something new!",
            style: TextStyle(fontSize: 16, color: Colors.grey[500]),
          ),
        ),
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
                    hintText: 'Search ...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Community Request",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: (){},
                  child: Text("More", style: TextStyle(fontWeight: FontWeight.w600),)),
              )
            ],
          ),
        ),
        Container(
          height: screenHeight * 0.42,
          child: FutureBuilder<List<Communites>>(
            future: futureCommunities,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final community = snapshot.data![index];
                    return ListTile(
                        leading: Image.network(community.imageUrl.toString(),
                            width: 50, height: 50),
                        title: Text(community.name.toString()),
                        subtitle: Text(community.description.toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize
                              .min, 
                          children: [
                            IconButton(
                              icon: Icon(Icons.check,
                                  color: Colors.green), // Yes tick icon
                              onPressed: () {
                                CommunityServices.updateCommunityStatus(
                                  community.id.toString(),
                                  'approved',
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.cancel, color: Colors.red),
                              onPressed: () {
                                CommunityServices.updateCommunityStatus(
                                    community.id.toString(), 'rejected');
                              },
                            ),
                          ],
                        ));
                  },
                );
              } else if (snapshot.hasError) {
                // print(snapshot.)
                print("look down");
                print(snapshot.error);
                return Center(child: Text('Failed to load communities'));
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text("Your Community", style: TextStyle(
            fontSize: 16
          ),),
        )
      ],
    );
  }
}
