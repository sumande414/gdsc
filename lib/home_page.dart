import 'package:flutter/material.dart';
import 'package:gdsc/bottom_bar.dart';
import 'package:http/http.dart' as http;
import 'model.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Conference> apicall() async {
    http.Response response =
        await http.get(Uri.parse("https://gdscdev.vercel.app/api"));
    return Conference.fromJson(jsonDecode(response.body));
  }

  late Future<Conference> conference;
  @override
  void initState() {
    conference = apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Conference>(
      future: conference,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var info= snapshot.data!.data;
          return ListView.builder(
              itemCount: info.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (ctx) {
                            return ShowBottomBar(
                                info[index].title,
                                info[index].description,
                                info[index].organiser,
                                info[index].organiserIcon,
                                info[index].dateTime,
                                info[index].venue,
                                info[index].city,
                                info[index].country
                                );
                          });
                    },
                    child: Card(
                        child: Column(
                      children: [
                        Image.network(info[index].banner),
                        Text(
                          info[index].title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
