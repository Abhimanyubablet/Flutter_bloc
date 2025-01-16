part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

abstract class PostsActionState extends PostsState {}

class PostsInitial extends PostsState {}

class PostsLoadingState extends PostsState{}

class PostsFetchSuccessState extends PostsState{
  final List<PostsModel> posts;
  PostsFetchSuccessState({ required this.posts});
}

class PostsErrorState extends PostsState{}

class PostsAdditionSuccessState extends PostsActionState{}

class PostsAdditionErrorState extends PostsActionState{}





