import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tutorial/model/posts_model.dart';

import '../../utils/enums.dart';

class PostsStates extends Equatable{

  final PostStatus postsStatus;
  final List<PostsModel> postsList;
  final List<PostsModel> temPostList;
  final String message;
  final String searchMessage;


  const PostsStates({
   this.postsStatus = PostStatus.loading,
   this.postsList = const <PostsModel>[],
    this.temPostList = const <PostsModel>[],
    this.message ='',
    this.searchMessage =''


  });

  PostsStates copyWith({PostStatus? postsStatus, List<PostsModel>? postsList ,String? message,List<PostsModel>? temPostList,String? searchMessage}){
    return PostsStates(
      postsStatus: postsStatus ?? this.postsStatus ,
      postsList: postsList ?? this.postsList,
        temPostList: temPostList ?? this.temPostList,
        message: message ?? this.message,
        searchMessage: searchMessage ?? this.searchMessage

    );
  }

  @override
  List<Object?> get props => [postsStatus,postsList,temPostList,message,searchMessage];

}