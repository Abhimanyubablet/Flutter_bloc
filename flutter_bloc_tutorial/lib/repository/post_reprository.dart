import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc_tutorial/model/posts_model.dart';
import 'package:http/http.dart ' as http;
class PostsRepository {

   Future<List<PostsModel>> fetchPost() async {
     try {
        final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));

        if(response.statusCode==200){
          final body = json.decode(response.body) as List;
          return body.map((e){
             return PostsModel(
                 id: e["id"] as int,
                 postId: e["postId"] as int,
                 name: e['name'] as String,
                 email: e['email'] as String,
                 body: e['body'] as String
             );
          }).toList();
        }

     }on SocketException{
       throw Exception("error while fetching data");
     }on TimeoutException{
       throw Exception('error while fetching data');
     }
     throw Exception('error while fetching data');

   }
}