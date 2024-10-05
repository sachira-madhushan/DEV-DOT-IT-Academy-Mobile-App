import 'package:dev_dot_academy/components/course_chapter.dart';
import 'package:dev_dot_academy/components/primary_button.dart';
import 'package:dev_dot_academy/providers/auth_provider.dart';
import 'package:dev_dot_academy/providers/course_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  late int userID;
  @override
  void initState() {
    getUserID();
  }

  void getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userID = prefs.getInt("u_id")!;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CourseProvider>(context, listen: false)
          .getCourseByID(widget.couresID);
      Provider.of<CourseProvider>(context, listen: false)
          .checkEnrollment(userID, widget.couresID);
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
    bool hasAccess = Provider.of<CourseProvider>(context).hasAccess;

    isLoading ? print("") : setIntroVideo(courses['course'][0]['c_intro']);

    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                    ),
                    Text(
                      courses.isEmpty ? "" : courses['course'][0]['c_title'],
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        courses.isEmpty
                            ? ""
                            : courses['course'][0]['c_description'],
                        style: TextStyle(
                            fontSize: 12,
                            color: const Color.fromARGB(255, 136, 136, 136)),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    hasAccess
                        ? Text("")
                        : Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: PrimaryButton(
                                text: "Buy this course",
                                onTap: () {

                                  courses.isEmpty
                              ? Text("")
                              :
                                  _launchInBrowser(Uri.parse(
                                      "https://wa.me/+94783398454?text=I want to buy this courses \n\n" +
                                          "Course ID:" +
                                          widget.couresID.toString() +
                                          "\nCourse Title:" +
                                          courses['course'][0]['c_title'] +
                                          "\n\n" +
                                          "My User ID:" +
                                          userID.toString()));
                                }),
                          ),
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemCount: courses.isEmpty
                              ? 0
                              :courses['chapters'].length,
                        itemBuilder: (context, index) {
                          return courses.isEmpty
                              ? Text("")
                              : CourseChapter(
                                  hasAccess: hasAccess,
                                  title: courses['chapters'][index]
                                      ['chap_title'],
                                  description: courses['chapters'][index]
                                      ['chap_description'],
                                  video: courses['chapters'][index]
                                      ['chap_video'],
                                );
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
