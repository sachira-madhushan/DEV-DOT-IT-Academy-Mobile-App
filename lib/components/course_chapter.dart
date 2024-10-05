import 'package:dev_dot_academy/components/video_lock.dart';
import 'package:flutter/material.dart';
import 'package:youtube_parser/youtube_parser.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseChapter extends StatefulWidget {
  const CourseChapter({super.key,required this.title,required this.description,required this.video});
  final String title;
  final String description;
  final String video;

  @override
  State<CourseChapter> createState() => _CourseChapterState();
}

class _CourseChapterState extends State<CourseChapter> {
  late YoutubePlayerController _controller;
  
  void setIntroVideo(String url) {
    _controller = YoutubePlayerController(
      initialVideoId: getIdFromUrl(url)!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    setIntroVideo(widget.video);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              child: Center(child: Text(widget.title)),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(color: Color.fromARGB(18, 0, 0, 0), blurRadius: 1),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.description,style: TextStyle(color: Colors.black45,),textAlign:TextAlign.justify,),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              //child: VideoLock(),
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
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
