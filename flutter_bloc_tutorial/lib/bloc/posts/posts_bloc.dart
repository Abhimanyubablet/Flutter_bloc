import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/posts/posts_event.dart';
import 'package:flutter_bloc_tutorial/bloc/posts/posts_state.dart';
import 'package:flutter_bloc_tutorial/model/posts_model.dart';
import 'package:flutter_bloc_tutorial/utils/enums.dart';

import '../../repository/post_reprository.dart';

class PostsBloc extends Bloc<PostsEvent,PostsStates>{

  List<PostsModel> temPostList = [];

  PostsRepository postsRepository= PostsRepository();
  PostsBloc():super(const PostsStates()){
    on<PostFetched>(fetchPostApi);
    on<SearchItem>(_filterList);
  }

  void _filterList(SearchItem event, Emitter<PostsStates>emit) async{

    if(event.stSearch.isEmpty){
      emit(state.copyWith(temPostList: [],searchMessage: ''));
    }
    else{
      // temPostList = state.postsList.where((element) => element.id.toString() == event.stSearch.toString()).toList();
      temPostList = state.postsList.where((element) => element.email.toString().toLowerCase() .contains(event.stSearch.toLowerCase())).toList();
      if(temPostList.isEmpty){
        emit(state.copyWith(temPostList: temPostList,searchMessage: "No Data Found"));
      }
      else{
        emit(state.copyWith(temPostList: temPostList,searchMessage: ''));

      }
    }

  }

  void fetchPostApi(PostFetched event, Emitter<PostsStates>emit) async{
    await postsRepository.fetchPost().then((value){
       emit(state.copyWith(
         postsStatus: PostStatus.success,
         message: "success",
         postsList: value
       ));

     }).onError((error,stackTrace){
       print(error);
       print(stackTrace);
       emit(state.copyWith(postsStatus: PostStatus.failure , message: error.toString()));
     });
  }


}