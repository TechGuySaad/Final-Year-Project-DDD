
import 'package:flutter/material.dart';
import 'package:fyp/ui/add_new_contact.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Map<String, String>> contacts = [];

  @override
  void initState() {
    super.initState();
    _loadContactData(); // Load saved contact data
  }

  // Function to load contact details from SharedPreferences
  Future<void> _loadContactData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? savedNames = prefs.getStringList('contactNames') ?? [];
    List<String>? savedPhoneNumbers = prefs.getStringList('contactPhoneNumbers') ?? [];
    List<String>? savedImages = prefs.getStringList('contactImages') ?? []; // List for image paths

    setState(() {
      contacts.clear(); // Clear the list before adding loaded contacts
      for (int i = 0; i < savedNames.length; i++) {
        contacts.add({
          'name': savedNames[i],
          'phone': savedPhoneNumbers.length > i ? savedPhoneNumbers[i] : '', // Ensure valid index
          'image': savedImages.length > i ? savedImages[i] : '', // Ensure valid index for images
        });
      }
    });
  }

  // Function to delete a contact
  Future<void> _deleteContact(int index) async {
    final prefs = await SharedPreferences.getInstance();
    contacts.removeAt(index); // Remove the contact from the list

    // Update SharedPreferences
    List<String> savedNames = contacts.map((contact) => contact['name']!).toList();
    List<String> savedPhoneNumbers = contacts.map((contact) => contact['phone']!).toList();
    List<String> savedImages = contacts.map((contact) => contact['image']!).toList();

    await prefs.setStringList('contactNames', savedNames);
    await prefs.setStringList('contactPhoneNumbers', savedPhoneNumbers);
    await prefs.setStringList('contactImages', savedImages);

    setState(() {}); 
  }

  void _addNewContact() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddNewContact()),
    ).then((_) => _loadContactData()); // Reload contacts after returning
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
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
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: Colors.blueGrey),
                        fillColor: Colors.transparent,
                        filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: screenHeight * 0.02),
                  InkWell(
                    onTap: _addNewContact, // Open AddNewContact when tapped
                    child: Container(
                      height: screenHeight * 0.08,
                      width: screenWidth * 0.15,
                      child: const Icon(Icons.phone, color: Colors.white),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xff39464C),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            // List of contacts
            Expanded(
              child: contacts.isEmpty
                  ? const Center(
                      child: Text(
                        'No contacts available',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                          child: Container(
                            height: screenHeight * 0.15,
                            width: screenHeight,
                            color: const Color(0xff39464C),
                            child: Padding(
                              padding: EdgeInsets.only(left: screenWidth * 0.04),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: contacts[index]['image']!.isNotEmpty
                                        ? FileImage(File(contacts[index]['image']!))
                                        : const AssetImage('assets/person.jpg') as ImageProvider, // Default image
                                    radius: screenHeight * 0.04,
                                  ),
                                  SizedBox(width: screenWidth * 0.06),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        contacts[index]['name'] ?? 'Unknown',
                                        style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        contacts[index]['phone'] ?? 'No phone',
                                        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                 const Spacer(),
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Color(0xff0076FF)),
                                    onPressed: () => _deleteContact(index), // Call delete function
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
