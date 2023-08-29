import 'package:flutter/material.dart';
import 'package:gdsc/cards.dart';
import 'model.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<Data> data = [];
  CustomSearchDelegate(this.data);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<int> resultIndices = [];
    for (int i = 0; i < data.length; i++) {
      if (data[i].description.toLowerCase().contains(query.toLowerCase()) ||
          data[i].title.toLowerCase().contains(query.toLowerCase())) {
        resultIndices.add(i);
      }
    }
    return ListView.builder(itemCount:resultIndices.length,itemBuilder: (ctx, index) {
      return Cards(data, resultIndices[index]);
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(itemCount: data.length,itemBuilder: (ctx, index) {
      final suggestion = data[index];
      return ListTile(
          title: Text(suggestion.title),
          onTap: () {
            query = suggestion.title;
          });
    });
  }
}
