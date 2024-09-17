import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/model/model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());


    List<Posts>? posts;
     String url =  "https://jsonplaceholder.typicode.com/posts";

     Future <void>  getPosts() async {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200 && response.body.isNotEmpty){
        final List<dynamic> jsonDecodeList = jsonDecode(response.body);
        posts = jsonDecodeList.map((json) => Posts.fromJson(json)).toList();
        emit(DataReach());
        
      }
}
}
