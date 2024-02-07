import 'package:flutter/material.dart';

class ImageDetailsPage extends StatelessWidget {
  final dynamic item;

  const ImageDetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Photo Details"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(alignment: Alignment.center, children:[ const CircularProgressIndicator(),Image.network(item["url"] ?? ""),]),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Title: ${item["title"] ?? "Data fetch error"}"),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("ID: ${item["id"].toString()}"),
                ],
              ),
            ),
          ),
        ));
  }
}
