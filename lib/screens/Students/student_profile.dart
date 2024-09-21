import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillai_hackcelestial/components/constant.dart';
import 'package:pillai_hackcelestial/widgets/seperatorLine.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Text controllers for the editable fields
  final TextEditingController _nameController =
      TextEditingController(text: 'John Doe');
  final TextEditingController _usernameController =
      TextEditingController(text: '@johndoe');
  final TextEditingController _websiteController =
      TextEditingController(text: 'johndoe.com');
  final TextEditingController _bioController = TextEditingController(
      text: 'Passionate mobile developer and tech enthusiast.');
  final TextEditingController _emailController =
      TextEditingController(text: 'john.doe@example.com');
  final TextEditingController _phoneController =
      TextEditingController(text: '+1 234 567 890');
  String _gender = 'Male'; // Gender field placeholder

  bool isReadOnly = true;

  final String title = "edit";
  String _imageUrl = '';

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _nameController.text = prefs.getString('Profile_username') ?? 'John Doe';
      _usernameController.text =
          '@${prefs.getString('Profile_username') ?? 'johndoe'}';
      _emailController.text =
          prefs.getString('Profile_email') ?? 'john.doe@example.com';
      _bioController.text =
          'Passionate mobile developer and tech enthusiast.'; // You may customize this
      _imageUrl = prefs.getString('Profile_imageUrl') ??
          'assets/img_event_1.png'; // Load a default image if empty
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColors.ourBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.notifications_active,
                    size: 30,
                    color: MyColors.ourPrimary,
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Profile",
                    style: GoogleFonts.agdasima(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Let's walkthrough by your profile",
                    style: GoogleFonts.abyssinicaSil(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile photo with an option to change
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Profile photo change logic
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(70),
                            child: Image.asset('assets/img_event_1.png',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "Change Profile Phote",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blue),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    const MySeparator(color: Colors.black),
                    SizedBox(height: screenHeight * 0.02),
                    // User stats (posts, followers, following)
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStatItem('Posts', '30'),
                          _buildStatItem('Connections', '250'),
                          _buildStatItem('Communities', '180'),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isReadOnly = !isReadOnly;
                              });
                              print("hit save api here!");
                            },
                            child: Text(
                              isReadOnly ? title : "save",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    ),

                    // Editable fields for name, username, website, and bio
                    _buildEditableField('Name', _nameController),
                    _buildEditableField('Username', _usernameController),
                    _buildEditableField('Website', _websiteController),
                    _buildEditableField('Bio', _bioController, maxLines: 3),

                    SizedBox(height: 16),
                    Divider(), // Separator for sections
                    SizedBox(height: 16),

                    // Private Information & Contact Information
                    Text('Private Information',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    _buildEditableField('Email', _emailController),
                    _buildEditableField('Phone', _phoneController),

                    // Gender field dropdown
                    _buildGenderDropdown(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build editable text fields
  Widget _buildEditableField(String label, TextEditingController controller,
      {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87)),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: TextField(
            readOnly: isReadOnly,
            controller: controller,
            maxLines: maxLines,
            decoration: const InputDecoration(
              //  suffixIcon:
              //       IconButton(
              //           icon: Icon(
              //                Icons.edit
              //               ),
              //           onPressed: () {
              //             setState(() {
              //               isReadOnly = !isReadOnly;
              //               // isPasswordVisible = !isPasswordVisible;
              //             });
              //           },
              //         ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  // Helper function to build the gender dropdown
  Widget _buildGenderDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gender',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87)),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: DropdownButton<String>(
            value: _gender,
            isExpanded: true,
            underline: SizedBox(),
            onChanged: (String? newValue) {
              setState(() {
                _gender = newValue!;
              });
            },
            items: <String>['Male', 'Female', 'Other']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  // Helper function to build stat items for posts, followers, and following
  Widget _buildStatItem(String label, String count) {
    return Column(
      children: [
        Text(count,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87)),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 16, color: Colors.black54)),
      ],
    );
  }
}
