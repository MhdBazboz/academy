import 'package:flutter/material.dart';
import 'components/video player/video_player.dart';

class TestVideo extends StatelessWidget {
  const TestVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Stack(
          children: [
            // cover Image
            Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              child: MyVideoPlayer(
                videoUrl:
                    "https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4",
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              margin: EdgeInsets.only(top: size.height * 0.29),
              decoration: const BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(32),
                //   topRight: Radius.circular(32),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
