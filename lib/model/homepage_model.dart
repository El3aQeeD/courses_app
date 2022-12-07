class HomePageModel {
  String? id;
  String? courseName;
  String? courseType;
  String? photo;
  String? description;
  String? price;
  String? promocode;
  String? courseVideos;
  String? userId;

  HomePageModel(
      {this.id,
        this.courseName,
        this.courseType,
        this.photo,
        this.description,
        this.price,
        this.promocode,
        this.courseVideos,
        this.userId});

  HomePageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['course_name'];
    courseType = json['course_type'];
    photo = json['photo'];
    description = json['description'];
    price = json['price'];
    promocode = json['promocode'];
    courseVideos = json['course_videos'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_name'] = this.courseName;
    data['course_type'] = this.courseType;
    data['photo'] = this.photo;
    data['description'] = this.description;
    data['price'] = this.price;
    data['promocode'] = this.promocode;
    data['course_videos'] = this.courseVideos;
    data['user_id'] = this.userId;
    return data;
  }
}
