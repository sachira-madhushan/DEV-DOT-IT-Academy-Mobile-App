class CourseChapterModel {
  final int c_id;
  final int chap_id;
  final String chap_title;
  final double chap_description;
  final String chap_video;


  CourseChapterModel({required this.chap_id, required this.c_id, required this.chap_title,required this.chap_video,required this.chap_description});

  factory CourseChapterModel.fromJson(Map<String, dynamic> json) {
    return CourseChapterModel(
      c_id: json['c_id'],
      chap_id: json['c_title'],
      chap_title: json['c_description'],
      chap_description:json['c_price'],
      chap_video: json['c_instructor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'c_id': c_id,
      'chap_id': chap_id,
      'chap_title':chap_title,
      'chap_description':chap_description,
      'chap_video': chap_video,
    };
  }
}