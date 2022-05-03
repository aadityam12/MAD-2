import 'package:flutter/material.dart';
import './home_view.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: mediaQuery.height * 0.33),
          Row(
            children: [
              SizedBox(
                width: mediaQuery.width * 0.36,
              ),
//............The background icon (video call)
              Icon(
                Icons.video_camera_front,
                size: mediaQuery.width * 0.32,
              ),
            ],
          ),
          SizedBox(
            height: mediaQuery.height * 0.22,
          ),
//.................The three buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//..................Mute
              Card(
                shape: const CircleBorder(),
                elevation: mediaQuery.width * 0.03,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.voice_over_off),
                ),
              ),
              SizedBox(
                width: mediaQuery.width * 0.03,
              ),
//..............End call
              Card(
                shape: const CircleBorder(),
                // RoundedRectangleBorder(
                //     borderRadius:
                //         BorderRadius.circular(mediaQuery.width * 0.3)),
                color: Colors.red,
                elevation: mediaQuery.width * 0.03,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => Homeview()));
                  },
                  icon: const Icon(Icons.call_end_outlined),
                ),
              ),
              SizedBox(
                width: mediaQuery.width * 0.03,
              ),
//......................Close the video
              Card(
                shape: const CircleBorder(),
                elevation: mediaQuery.width * 0.03,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.video_call_rounded),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
