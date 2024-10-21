
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class AddNewContact extends StatefulWidget {
  const AddNewContact({super.key});

  @override
  State<AddNewContact> createState() => _AddNewContactState();
}

class _AddNewContactState extends State<AddNewContact> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  
  var nameController = TextEditingController();
  var phoneNumController = TextEditingController();
  var emailController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneNumController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff000000),
                Color(0xff004780),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: [0.0, 1],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.08, left: screenWidth * 0.06),
                    child: const Text(
                      'Emergency',
                      style: TextStyle(color: Color(0xff0076FF), fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.08, right: screenWidth * 0.06),
                    child: const Icon(Icons.notifications, color: Colors.white),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: screenHeight * 0.03),
                child: const Text(
                  'Contacts',
                  style: TextStyle(color: Color(0xff0076FF), fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                height: screenHeight * 0.08,
                width: screenWidth,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  color: Color(0xff0076FF),
                ),
                child: Row(
                  children: [
                    Container(height: 1, width: screenWidth * 0.06, color: Colors.white),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                      child: const Text(
                        'New Contact',
                        style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(height: 1, width: screenWidth * 0.65, color: Colors.white),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: InkWell(
                  onTap: _pickImage,
                  child: Container(
                    width: screenHeight * 0.14,
                    height: screenHeight * 0.14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white),
                      image: _image != null
                          ? DecorationImage(image: FileImage(_image!), fit: BoxFit.cover)
                          : null,
                    ),
                    child: _image == null
                        ? Icon(Icons.person, size: screenHeight * 0.08, color: Colors.blueGrey)
                        : null,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Choose photo',
                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                height: screenHeight * 0.08,
                width: screenWidth,
                decoration: const BoxDecoration(
                  color: Color(0xff0076FF),
                ),
                child: Row(
                  children: [
                    Container(height: 1, width: screenWidth * 0.06, color: Colors.white),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                      child: const Text(
                        'Contact Information',
                        style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(height: 1, width: screenWidth * 0.5, color: Colors.white),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: TextField(
                  controller: nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Enter full name',
                    hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: TextField(
                  controller: phoneNumController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Enter number',
                    hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: TextField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Enter email',
                    hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    var prefs = await SharedPreferences.getInstance();
                    List<String> savedNames = prefs.getStringList('contactNames') ?? [];
                    List<String> savedPhoneNumbers = prefs.getStringList('contactPhoneNumbers') ?? [];
                    List<String> savedEmails = prefs.getStringList('contactEmails') ?? [];
                    List<String> savedImages = prefs.getStringList('contactImages') ?? []; // List for image paths

                    // Add new contact data
                    savedNames.add(nameController.text);
                    savedPhoneNumbers.add(phoneNumController.text);
                    savedEmails.add(emailController.text);
                    savedImages.add(_image?.path ?? ''); // Save the image path

                    // Save updated lists back to SharedPreferences
                    await prefs.setStringList('contactNames', savedNames);
                    await prefs.setStringList('contactPhoneNumbers', savedPhoneNumbers);
                    await prefs.setStringList('contactEmails', savedEmails);
                    await prefs.setStringList('contactImages', savedImages); // Save the image paths

                    // Navigate back to the ContactScreen
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.03),
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.2),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Save Contact',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
