import 'package:dev_dot_academy/components/course_chapter.dart';
import 'package:dev_dot_academy/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseView extends StatefulWidget {
  const CourseView({super.key});

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'EDAeorwE-jk',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
              Text(
                "Game Development Full Course",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 136, 136, 136)),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: PrimaryButton(text: "Buy this course", onTap: () {

                  _launchInBrowser(Uri.parse("https://wa.me/0783398454?text=Buy%20This%20Course"));
                }),
              ),
              CourseChapter(),
              CourseChapter(),
              CourseChapter()
            ],
          ),
        ),
      ),
    );
  }
}
