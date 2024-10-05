import 'package:dev_dot_academy/components/course_chapter.dart';
import 'package:dev_dot_academy/components/primary_button.dart';
import 'package:dev_dot_academy/providers/course_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_parser/youtube_parser.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseView extends StatefulWidget {
  const CourseView({super.key, required this.couresID});
  final int couresID;
  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CourseProvider>(context, listen: false)
          .getCourseByID(widget.couresID);
    });
  }

  late YoutubePlayerController _controller;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void setIntroVideo(String url) {
    _controller = YoutubePlayerController(
      initialVideoId: getIdFromUrl(url)!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> courses = Provider.of<CourseProvider>(context).course;
    bool isLoading = Provider.of<CourseProvider>(context).isLoading;

    setIntroVideo(courses['course'][0]['c_intro']);

    print(widget.couresID);
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
                courses['course'][0]['c_title'],
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  courses['course'][0]['c_description'],
                  style: TextStyle(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 136, 136, 136)),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: PrimaryButton(
                    text: "Buy this course",
                    onTap: () {
                      _launchInBrowser(Uri.parse(
                          "https://wa.me/0783398454?text=Buy%20This%20Course"));
                    }),
              ),
              SizedBox(
                height:500,
                child: ListView.builder(
                  itemCount:courses['chapters'].length,
                  
                  itemBuilder: (context, index) {
                    return CourseChapter(title: courses['chapters'][index]['chap_title'],description: courses['chapters'][index]['chap_description'],video: courses['chapters'][index]['chap_video'],);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
