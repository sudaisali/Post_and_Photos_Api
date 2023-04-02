import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/PhotosModel.dart';
import 'package:http/http.dart' as http;
class Api2 extends StatefulWidget {
  const Api2({Key? key}) : super(key: key);

  @override
  State<Api2> createState() => _Api2State();
}

class _Api2State extends State<Api2> {
  List<PhotosModel> photosList=[];
  Future<List<PhotosModel>> getPhotosApi() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      photosList.clear();
     for(Map i in data){
       PhotosModel photosModel = PhotosModel(title: i["title"], url: i["url"], id: i["id"]);
       photosList.add(photosModel);
     }
     return photosList;
    }else{
     return photosList;
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPhotosApi(),
        builder: (context ,AsyncSnapshot<List<PhotosModel>> snapshot){
      return ListView.builder(
         itemCount: photosList.length,
          itemBuilder: (context , index){
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(photosList[index].url.toString()),
          ),
          title: Text(photosList[index].title.toString()),
          trailing: Text(photosList[index].id.toString()),
        );
      });
    });
  }
}
