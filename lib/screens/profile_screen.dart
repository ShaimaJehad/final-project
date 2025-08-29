import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_flutter/screens/auth/login_widgets/app_text_field.dart';
import 'package:project_flutter/screens/firestore_controller.dart';
import 'package:project_flutter/screens/sph.dart';
import 'package:cached_network_image/cached_network_image.dart';


import 'my_user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 
  late TextEditingController _nameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  
  get user => null;

  @override
  void initState() {
    super.initState();
    // Initialize the text controllers here
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _fetchUserData(); // Fetch user data and populate the text controllers
  }

  // Method to fetch user data from Firestore
  void _fetchUserData() async {
    MyUser user = await FireStoreController().readUser();
    setState(() {
      _nameTextController.text = user.name;
      _emailTextController.text = user.email;
      _passwordTextController.text = user.password;
    });
  }

  // Method to update user information
  void _updateUserInfo() async {
    String newName = _nameTextController.text.trim();
    String newEmail = _emailTextController.text.trim();
    String newPassword = _passwordTextController.text.trim();

    // Validate the data if needed
    if (newName.isEmpty || newEmail.isEmpty || newPassword.isEmpty) {
      // Show a snackbar or dialog to indicate that all fields are required
      return;
    }

    MyUser updatedUser = MyUser.user(
      id: SharedPrefHelper().getData(),
      name: newName,
      email: newEmail,
      password: newPassword,
    );

    await FireStoreController().updateUser(user: updatedUser);

    // Show a dialog to indicate that the user information has been updated
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Success"),
          content: Text("User information updated successfully!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );

    // Update the text controllers to reflect the updated data
    setState(() {
      _nameTextController.text = updatedUser.name;
      _emailTextController.text = updatedUser.email;
      _passwordTextController.text = updatedUser.password;
    });
  }


 File? _imageFile; // Update the type to XFile?

  // Method to pick an image from the gallery
  Future<void> _pickImage() async {
    PickedFile? pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile as File?;
      });
    }
  }

  void _updateUserProfilePicture() async {
  PickedFile? pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            fontFamily: "poppins",
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),

      
      body: FutureBuilder<MyUser>(
        future: FireStoreController().readUser() ,
        builder: (context, snapshot) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView(
        children: [


          CircleAvatar(
                    radius: 50,
                    // backgroundImage: _imageFile != null
                    //     ? FileImage(File(_imageFile!.path))
                    //     : user?.profilePicture != null // Check if the profile picture URL is not null
                    //         ? CachedNetworkImageProvider(user!.profilePicture!) // Use the cached network image provider
                    //         : AssetImage("path/to/placeholder.png"), // Provide a placeholder image path if no profile picture URL is available
                  ),
                  // ... Other existing code ...
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: Text("Pick Profile Picture"),
                  ),
                  ElevatedButton(
                    onPressed: _updateUserProfilePicture,
                    child: Text("Update Profile Picture"),
                  ),

                  
          SizedBox(height: 10,),


          PaddingTextField(
            
              left_padding: 20,
              right_padding: 20,
              bottom_padding: 25,
              prefix_image: "images/user.png",
              hint_text: "username",
              textController: _nameTextController = TextEditingController(text : snapshot.data!.name,),
              type_input: TextInputType.name,
              scure: false),


          PaddingTextField(
              left_padding: 20,
              right_padding: 20,
              bottom_padding: 25,
              prefix_image: "images/email.png",
              hint_text: "email",
              textController: _emailTextController = TextEditingController(text : snapshot.data!.email,),
              type_input: TextInputType.name,
              scure: false),
          PaddingTextField(
              left_padding: 20,
              right_padding: 20,
              bottom_padding: 20,
              prefix_image: "images/password.png",
              hint_text: "password",
              textController: _passwordTextController = TextEditingController(text : snapshot.data!.password,),
              type_input: TextInputType.name,
              scure: true),


              SizedBox(height: 30,)
,


              Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(280, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  shadowColor: Color(0xff000000),
                  backgroundColor: Color(0xff1599CE),
                ),
                onPressed: _updateUserInfo,

                child: Text(
                  "Updata",
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "manrope"),
                ),
              ),
            ),

            
        ],
      ),

          );
      }
      ),
    );
  }
}
