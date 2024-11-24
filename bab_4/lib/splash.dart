// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'dart:async';
// import 'home.dart';

// class Splash extends StatefulWidget {
//   @override
//   _SplashState createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset("videos/splash.mp4")
//       ..initialize().then((_) {
//         setState(() {
//           _controller.play();
//         });
//       });

//     // Redirect to home screen after the video ends
//     _controller.addListener(() {
//       if (_controller.value.position == _controller.value.duration) {
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (_) => HomeScreen()),
//         );
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoPlayer(_controller),
//               )
//             : CircularProgressIndicator(), // Show a loader until video is ready
//       ),
//     );
//   }
// }
