class Conference {
  List<Data> data;
  Conference({required this.data});

  factory Conference.fromJson(Map<String, dynamic> json) {
    var list = json['content']['data'] as List;
    List<Data> dataList = list.map((data) => Data.fromJson(data)).toList();
    return Conference(data: dataList);
  }
}

class Data {
  final int id;
  final String title;
  final String description;
  final String banner;
  final DateTime dateTime;
  final String organiser;
  final String organiserIcon;
  final String venue;
  final String city;
  final String country;

  Data({
    required this.id,
    required this.title,
    required this.description,
    required this.banner,
    required this.dateTime,
    required this.organiser,
    required this.organiserIcon,
    required this.venue,
    required this.city,
    required this.country,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    DateTime date = DateTime.parse(json['date_time']);
    return Data(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      banner: json['banner_image'],
      dateTime: date,
      organiser: json['organiser_name'],
      organiserIcon: json['organiser_icon'],
      venue: json['venue_name'],
      city: json['venue_city'],
      country: json['venue_country'],
    );
  }
}
