// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart'; // Import the image_picker package
// import 'dart:io'; // To handle the file for the image

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({super.key});

//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   File? _image; // To store the captured image
//   final ImagePicker _picker = ImagePicker(); // Initialize the ImagePicker

//   // Method to open the camera and capture an image
//   Future<void> _openCamera() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path); // Store the image file
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Container(
//         height: screenHeight,
//         width: screenWidth,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xff000000),
//               Color(0xff004780),
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.topRight,
//             stops: [0.0, 1], // Control how colors spread
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Display the captured image
//             _image != null
//                 ? Container(
//                     height: screenHeight * 0.4,
//                     width: screenWidth * 0.8,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       image: DecorationImage(
//                         image: FileImage(_image!),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   )
//                 : SizedBox(height: screenHeight * 0.4, child: Center(child: Text('No image captured', style: TextStyle(color: Colors.white),))),
            
//             SizedBox(height: screenHeight * 0.1),

//             // Button to open the camera
//             GestureDetector(
//               onTap: _openCamera, // Open camera when the button is pressed
//               child: Container(
//                 height: screenHeight * 0.15,
//                 width: screenWidth * 0.3,
//                 decoration: BoxDecoration(
//                   color: const Color(0xff001C3D),
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Start',
//                     style: TextStyle(
//                       color: Color(0xff0076FF),
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:path_provider/path_provider.dart';

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({super.key});

//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   CameraController? _cameraController;
//   List<CameraDescription>? cameras;
//   bool isRecording = false;
//   late Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }

//   Future<void> _initializeCamera() async {
//     // Request camera and microphone permissions
//     await Permission.camera.request();
//     await Permission.microphone.request();

//     if (await Permission.camera.isGranted && await Permission.microphone.isGranted) {
//       try {
//         // Get list of available cameras
//         cameras = await availableCameras();

//         // Check if any cameras are available
//         if (cameras!.isEmpty) {
//           print('No cameras found');
//           return; // No cameras available
//         }

//         // Select the first available camera
//         _cameraController = CameraController(
//           cameras![0], // Select the back camera
//           ResolutionPreset.high,
//         );

//         // Initialize the camera controller
//         _initializeControllerFuture = _cameraController!.initialize();

//         // Ensure the initialization is completed
//         await _initializeControllerFuture;

//         // Automatically start video recording after the camera initializes
//         await _startRecording();

//         // Refresh the UI
//         setState(() {});
//       } catch (e) {
//         print('Error initializing camera: $e');
//       }
//     } else {
//       // Handle the case when permission is denied
//       print('Camera or microphone permission denied');
//     }
//   }

//   Future<void> _startRecording() async {
//     if (_cameraController != null && !_cameraController!.value.isRecordingVideo) {
//       try {
//         // Get a directory to store the video
//         final directory = await getTemporaryDirectory();
//         final videoPath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';

//         // Start video recording
//         await _cameraController!.startVideoRecording();
//         setState(() {
//           isRecording = true;
//         });

//         // Print the video path (optional)
//         print('Recording video to: $videoPath');
//       } catch (e) {
//         print('Error starting video recording: $e');
//       }
//     }
//   }

//   Future<void> _stopRecording() async {
//     if (_cameraController != null && _cameraController!.value.isRecordingVideo) {
//       try {
//         XFile videoFile = await _cameraController!.stopVideoRecording();
//         setState(() {
//           isRecording = false;
//         });

//         // Print the path where the video is saved
//         print('Video saved to: ${videoFile.path}'); // Added this line to print video path
//       } catch (e) {
//         print('Error stopping video recording: $e');
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _cameraController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If the Future is complete, display the camera preview.
//             return Stack(
//               children: [
//                 CameraPreview(_cameraController!), // Show camera preview
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: GestureDetector(
//                       onTap: isRecording ? _stopRecording : _startRecording, // Start/Stop recording
//                       child: Container(
//                         height: 60, // Adjust height as needed
//                         width: 120, // Adjust width as needed
//                         decoration: BoxDecoration(
//                           color: isRecording ? Colors.red : const Color(0xff001C3D), // Red while recording
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                         child: Center(
//                           child: Text(
//                             isRecording ? 'Stop' : 'Start',
//                             style: const TextStyle(
//                               color: Color(0xff0076FF),
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           } else if (snapshot.hasError) {
//             // Handle error state
//             return Center(child: Text('Error initializing camera: ${snapshot.error}'));
//           } else {
//             // Otherwise, display a loading indicator.
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
  bool isRecording = false;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    // Request camera and microphone permissions
    await Permission.camera.request();
    await Permission.microphone.request();

    if (await Permission.camera.isGranted && await Permission.microphone.isGranted) {
      try {
        // Get list of available cameras
        cameras = await availableCameras();

        // Check if any cameras are available
        if (cameras!.isEmpty) {
          print('No cameras found');
          return; // No cameras available
        }

        // Select the first available camera
        _cameraController = CameraController(
          cameras![0], // Select the back camera
          ResolutionPreset.high,
        );

        // Initialize the camera controller
        _initializeControllerFuture = _cameraController!.initialize();

        // Ensure the initialization is completed
        await _initializeControllerFuture;

        // Refresh the UI
        setState(() {});
      } catch (e) {
        print('Error initializing camera: $e');
      }
    } else {
      // Handle the case when permission is denied
      print('Camera or microphone permission denied');
    }
  }

  Future<void> _startRecording() async {
    if (_cameraController != null && !_cameraController!.value.isRecordingVideo) {
      try {
        // Get a directory to store the video
        final directory = await getTemporaryDirectory();
        final videoPath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';

        // Start video recording
        await _cameraController!.startVideoRecording();
        setState(() {
          isRecording = true;
        });

        // Print the video path (optional)
        print('Recording video to: $videoPath');
      } catch (e) {
        print('Error starting video recording: $e');
      }
    }
  }

  Future<void> _stopRecording() async {
    if (_cameraController != null && _cameraController!.value.isRecordingVideo) {
      try {
        XFile videoFile = await _cameraController!.stopVideoRecording();
        setState(() {
          isRecording = false;
        });

        // Print the path where the video is saved
        print('Video saved to: ${videoFile.path}');
      } catch (e) {
        print('Error stopping video recording: $e');
      }
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the camera preview.
            return Stack(
              children: [
                CameraPreview(_cameraController!), // Show camera preview
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: isRecording ? _stopRecording : _startRecording, // Start/Stop recording
                      child: Container(
                        height: 120, // Adjust height as needed
                        width: 120, // Adjust width as needed
                        decoration: BoxDecoration(
                          color: isRecording ? Colors.red : const Color(0xff001C3D), // Red while recording
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            isRecording ? 'Stop' : 'Start',
                            style: const TextStyle(
                              color: Color(0xff0076FF),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            // Handle error state
            return Center(child: Text('Error initializing camera: ${snapshot.error}'));
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
