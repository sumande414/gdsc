import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ConferencePage extends StatelessWidget {
  final String title;
  final String description;
  final String organiser;
  final String organiserIcon;
  final DateTime dateTime;
  final String venue;
  final String city;
  final String country;

  const ConferencePage(this.title, this.description, this.organiser,
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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                
                    child: Column(children: [
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
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 16),
                        ),
                        Text(organiser, style: const TextStyle(fontSize: 14)),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            height: 50,
                            width: 50,
                            child: displayImage(organiserIcon))
                      ],
                    )),
              ),
            ]))),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Date : ${DateFormat("dd-MM-yyyy").format(dateTime.toLocal())}",
                              style: const TextStyle(fontSize: 14,),),
                          Text(
                              "Time : ${DateFormat("HH:mm").format(dateTime.toLocal())} Local Time",
                              style: const TextStyle(fontSize: 14)),
                              
                              
                        ],
                      ),
                      const Spacer(),
                      FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.calendar_month_rounded), label: Text("Add to Calender"))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(height:70,width:210,child: Text("Venue : $venue, $city, $country",textAlign: TextAlign.center,)),
                    Spacer(),
                    FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.location_on_outlined), label: Text("Go to Maps"))

                  ],
                ),
              )),
            ),
          ],
        )
      ]),
    );
  }
}
