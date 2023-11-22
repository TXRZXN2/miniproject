import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:miniproject/models/response.dart';
import 'package:miniproject/screens/detail.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  ResponseApi? responseApi;
  bool haveResponse = false;

  @override
  void initState() {
    super.initState();
    getValue();
  }

  void getValue() async {
    try {
      var request = http.Request(
        'GET',
        Uri.parse(
          'http://qas-wsappwf.homepro.local/ws_FitTile/ws_FitTileService.asmx/getFitTile_Default2?company=hp&from=0&size=8',
        ),
      );
      print("before");
      http.StreamedResponse response = await request.send();
      print("After");
      if (response.statusCode == 200) {
        var jsonString = await response.stream.bytesToString();
        Map<String, dynamic> jsonMap = json.decode(jsonString);
        responseApi = ResponseApi.fromJson(jsonMap);
        haveResponse = true;
        setState(() {});
        print(responseApi?.list?[0].desc);
        // responseValue = Response.fromJson(jsonMap);
        // setState(() {});
        // haveResponse = true;
        // print(responseValue!.artDetail![0].desc);
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              "Alert",
              style: TextStyle(color: Colors.red),
            ),
            content: Text(
              "${response.statusCode}  ${response.reasonPhrase}",
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("ปิด"),
              ),
            ],
          ),
        );
      }
    } on Exception catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "Alert",
            style: TextStyle(color: Colors.red),
          ),
          content: Text(
            e.toString(),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("ปิด"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: haveResponse
            ? gridview(context)
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  GridView gridview(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(
        responseApi?.list?.length ?? 0,
        (index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) =>
                    DetailScreen(responseArt: responseApi!.list![index]),
              ),
            );
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.1,
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.amber,
                    ),
                    child: Image.network(responseApi?.list?[index].image ?? ""),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(responseApi?.list?[index].id ?? "Empty"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
