import 'package:flutter/material.dart';
import 'package:miniproject/models/response.dart';

class DetailScreen extends StatefulWidget {
  Article responseArt;
  DetailScreen({required this.responseArt, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(widget.responseArt.image ?? ""),
          Text(widget.responseArt.id ?? ""),
          Text(widget.responseArt.desc ?? ""),
          Text(widget.responseArt.type ?? ""),
        ],
      ),
    );
  }
}
