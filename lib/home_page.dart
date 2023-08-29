import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'search_bar.dart';
import 'model.dart';
import 'dart:convert';
import 'cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Conference> apicall() async {
    http.Response response =
        await http.get(Uri.parse("https://gdscdev.vercel.app/api"));
    if (response.statusCode == 200) {
      return Conference.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not load data.");
    }
  }

  late Future<Conference> conference;
  @override
  void initState() {
    conference = apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Conferences"),
          actions: [
            FutureBuilder<Conference>(
                future: conference,
                builder: (context, snapshot) {
                  return IconButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: CustomSearchDelegate(snapshot.data!.data),
                        );
                      },
                      icon: const Icon(Icons.search));
                })
          ],
        ),
        body: FutureBuilder<Conference>(
          future: conference,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var info = snapshot.data!.data;
              return ListView.builder(
                  itemCount: info.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Cards(info, index);
                  });
            } else if (snapshot.hasError) {
              return const Center(
                  child: Text(
                "There seems to be a problem with network. Check your network connection.",
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ));
            }

            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
