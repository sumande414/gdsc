import 'package:flutter/material.dart';
import 'model.dart';
import 'conference_details_page.dart';

class Cards extends StatelessWidget {
  final List<Data> info;
  final int index;
  const Cards(this.info, this.index, {super.key});
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ConferencePage(
                    info[index].title,
                    info[index].description,
                    info[index].organiser,
                    info[index].organiserIcon,
                    info[index].dateTime,
                    info[index].venue,
                    info[index].city,
                    info[index].country)),
          );
        },
        child: Card(
            child: Column(
          children: [
            Image.network(info[index].banner),
            Text(
              info[index].title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        )),
      ),
    );
  }
}
