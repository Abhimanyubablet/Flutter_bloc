import 'dart:convert';

import 'package:flutter_bloc_grocery_app/api/models/posts_models.dart';
import 'package:http/http.dart' as http;

class PostsRepo {
   static Future<List<PostsModel>> fetchPost() async {
     List<PostsModel> posts = [];
     try {
       const url = "https://jsonplaceholder.typicode.com/posts";
       var response = await http.get(Uri.parse(url));
       // Decode the JSON response into a list of maps
       List decodedResponse = jsonDecode(response.body);

       // Iterate(go to) through the list and convert each JSON object to a PostsModel
       for (var json in decodedResponse) {
         PostsModel post = PostsModel.fromJson(json);
         posts.add(post);
       }
       return posts;
     } catch(e){
       print("error : $e");
       return [];
     }
   }

   static Future<bool> addPost() async{
     try{

      Map<String,dynamic> requestBody = {
        "title": 'foo',
        "body": 'bar',
        "userId": 1,
      };
      Map<String,String> headers =  {'Content-type': 'application/json; charset=UTF-8'};

       const url = "https://jsonplaceholder.typicode.com/posts";
       var response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(requestBody),);

       if(response.statusCode == 201){
         return true;
       }else {
         print('Failed with status code: ${response.statusCode}');
         return false;
       }

     }catch(e){
        print(e);
        return false;
     }
   }


}