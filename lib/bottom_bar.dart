import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ShowBottomBar extends StatelessWidget {
  final String title;
  final String description;
  final String organiser;
  final String organiserIcon;
  final DateTime dateTime;
  final String venue;
  final String city;
  final String country;

  const ShowBottomBar(this.title, this.description, this.organiser,
      this.organiserIcon, this.dateTime, this.venue, this.city, this.country,
      {super.key});

  Widget displayImage(String location) {
    if (location.split(".").last == "svg") {
      return SvgPicture.network(location);
    } else {
      return Image.network(location);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Center(
            child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
        )),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            description,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Organiser: ",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                  Text(organiser, style: const TextStyle(fontSize: 14)),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 50, width: 50, child: displayImage(organiserIcon))
                ],
              )),
        ),
        Text("Date : ${DateFormat("dd-MM-yyyy").format(dateTime.toLocal())}",
            style: const TextStyle(fontSize: 14)),
        Text(
            "Time : ${DateFormat("HH:mm").format(dateTime.toLocal())} Local Time",
            style: const TextStyle(fontSize: 14)),
        Text("Venue : $venue, $city, $country")
      ]),
    );
  }
}
