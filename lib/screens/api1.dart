import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/PostsModel.dart';
import 'package:http/http.dart' as http;

class Api1 extends StatefulWidget {
  const Api1({Key? key}) : super(key: key);

  @override
  State<Api1> createState() => _Api1State();
}

class _Api1State extends State<Api1> {
  List<PostsModel> postList = [];

  Future<List<PostsModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();
      for (Map i in data) {
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPostApi(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text("Loding........."));
          } else {
            return ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          postList[index].id.toString()
                          +"-"+
                          postList[index].title.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(postList[index].body.toString()),
                      ],
                    ),
                  );
                });
          }
        });
  }
}
