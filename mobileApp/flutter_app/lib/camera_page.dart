import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/info_display.dart';

import 'package:gallery_saver/gallery_saver.dart';


//
// class CameraPage extends StatefulWidget {
//   final List<CameraDescription>? cameras;
//   const CameraPage({this.cameras, Key? key}) : super(key: key);
//
//   @override
//   _CameraPageState createState() => _CameraPageState();
// }
//
// class _CameraPageState extends State<CameraPage> {
//   late CameraController controller;
//   XFile? pictureFile;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = CameraController(
//       widget.cameras![0],
//       ResolutionPreset.max,
//     );
//     controller.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//     });
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (!controller.value.isInitialized) {
//       return const SizedBox(
//         child: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Center(
//             child: SizedBox(
//               height: 400,
//               width: 400,
//               child: CameraPreview(controller),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ElevatedButton(
//             onPressed: () async {
//               pictureFile = await controller.takePicture();
//               setState(() {});
//             },
//             child: const Text('Capture Image'),
//           ),
//         ),
//         if (pictureFile != null)
//           Image.network(
//             pictureFile!.path,
//             height: 200,
//           )
//         //Android/iOS
//         // Image.file(File(pictureFile!.path)))
//       ],
//     );
//   }
// }

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////


// A screen that allows users to take a picture using a given camera.


// class TakePictureScreen extends StatefulWidget {
//   const TakePictureScreen({
//   super.key,
//   required this.camera,
//   });
//
//   final CameraDescription camera;
//
//   @override
//   TakePictureScreenState createState() => TakePictureScreenState();
// }
//
// class TakePictureScreenState extends State<TakePictureScreen> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     // To display the current output from the Camera,
//     // create a CameraController.
//     _controller = CameraController(
//       // Get a specific camera from the list of available cameras.
//       widget.camera,
//       // Define the resolution to use.
//       ResolutionPreset.medium,
//     );
//
//     // Next, initialize the controller. This returns a Future.
//     _initializeControllerFuture = _controller.initialize();
//
//     // You must wait until the controller is initialized before displaying the
// // camera preview. Use a FutureBuilder to display a loading spinner until the
// // controller has finished initializing.
//     FutureBuilder<void>(
//       future: _initializeControllerFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           // If the Future is complete, display the preview.
//           return CameraPreview(_controller);
//         } else {
//           // Otherwise, display a loading indicator.
//           return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//
//   }
//
//   @override
//   void dispose() {
//     // Dispose of the controller when the widget is disposed.
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     FloatingActionButton(
//       // Provide an onPressed callback.
//       onPressed: () async {
//         // Take the Picture in a try / catch block. If anything goes wrong,
//         // catch the error.
//         try {
//           // Ensure that the camera is initialized.
//           await _initializeControllerFuture;
//
//           // Attempt to take a picture and then get the location
//           // where the image file is saved.
//           final image = await _controller.takePicture();
//         } catch (e) {
//           // If an error occurs, log the error to the console.
//           print(e);
//         }
//       },
//       child: const Icon(Icons.camera_alt),
//     );
//
//     Image.file(File('path/to/my/picture.png'));
//     // Fill this out in the next steps.
//     return Container();
//   }
//
//
// }




///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////




// Future<void> CameraPage() async {
//   // Ensure that plugin services are initialized so that `availableCameras()`
//   // can be called before `runApp()`
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();
//
//   // Get a specific camera from the list of available cameras.
//   final firstCamera = cameras.first;
//
//   runApp(
//     MaterialApp(
//       theme: ThemeData.dark(),
//       home: TakePictureScreen(
//         // Pass the appropriate camera to the TakePictureScreen widget.
//         camera: firstCamera,
//       ),
//     ),
//   );
// }

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
  super.key,
  required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            if (!mounted) return;

            // Saves image once taken (not possible to put in next screen when reviewing the image because of 'const'.
            GallerySaver.saveImage(image.path, albumName: 'medication barcodes');

            // Exit once photo is taken and saved to gallery.
            Navigator.pop(context);


                    // // If the picture was taken, display it on a new screen.
            // await Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => DisplayPictureScreen(
            //       // Pass the automatically generated path to
            //       // the DisplayPictureScreen widget.
            //       imagePath: image.path,
            //     ),
            //   ),
            // );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// // A widget that displays the picture taken by the user.
// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;
//
//   const DisplayPictureScreen({super.key, required this.imagePath});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Display the Picture')),
//       // The image is stored as a file on the device. Use the `Image.file`
//       // constructor with the given path to display the image.
//       body: Image.file(File(imagePath)),
//     );
//   }
// }
