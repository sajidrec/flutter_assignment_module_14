import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assignment_module_14/image_details_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List _itemLists = [];

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Gallery App"),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return getDataFromApi();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          child: ListView.separated(
            itemCount: _itemLists.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ImageDetailsPage(item: _itemLists[index]),
                  ),
                );
              },
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SizedBox(
                  child: Image.network(
                    _itemLists[index]["thumbnailUrl"] ?? '',
                    // fit: BoxFit.fill,
                  ),
                ),
                title: Text(
                    _itemLists[index]["title"] ?? "error in data fetching"),
              ),
            ),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 8,
                width: double.infinity,
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> getDataFromApi() async {
    http.Response response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

    if (response.statusCode == 200) {
      _itemLists = jsonDecode(response.body);
      setState(() {});
    }
  }
}
