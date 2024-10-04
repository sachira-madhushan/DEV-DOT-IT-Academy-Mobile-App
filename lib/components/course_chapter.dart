import 'package:dev_dot_academy/components/video_lock.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseChapter extends StatefulWidget {
  const CourseChapter({super.key});

  @override
  State<CourseChapter> createState() => _CourseChapterState();
}

class _CourseChapterState extends State<CourseChapter> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'EDAeorwE-jk',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              child: Center(child: Text("Chapter 01")),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(color: Color.fromARGB(18, 0, 0, 0), blurRadius: 1),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and",style: TextStyle(color: Colors.black45,),textAlign:TextAlign.justify,),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VideoLock(),
              // child: YoutubePlayer(
              //   controller: _controller,
              //   showVideoProgressIndicator: true,
              // ),
            ),
          ],
        ),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Color.fromARGB(12, 0, 0, 0), blurRadius: 5),
        ]),
      ),
    );
  }
}
