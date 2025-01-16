import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_grocery_app/api/models/posts_models.dart';
import 'package:flutter_bloc_grocery_app/api/repos/posts_repo.dart';
import 'package:meta/meta.dart';


part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<PostsAddEvent>(postsAddEvent);
  }


  Future<void> postsInitialFetchEvent(PostsInitialFetchEvent event, Emitter<PostsState>emit) async{

    try{
      emit(PostsLoadingState());
      List<PostsModel> posts = await PostsRepo.fetchPost();
      emit(PostsFetchSuccessState(posts: posts));
    }
    catch(e){
      emit(PostsErrorState());
    }

  }


  Future<void> postsAddEvent(PostsAddEvent event, Emitter<PostsState>emit) async {
      bool success = await PostsRepo.addPost();
      print(true);
      if(success){
        emit(PostsAdditionSuccessState());
      }else{
        emit(PostsAdditionErrorState());
      }

  }

}
