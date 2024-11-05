import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/posts/posts_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/posts/posts_event.dart';
import 'package:flutter_bloc_tutorial/bloc/posts/posts_state.dart';

import '../../utils/enums.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(PostFetched());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.blue,
         title: Text("Posts Api"),
       ),
      body: BlocBuilder<PostsBloc,PostsStates>(
        builder: (context, state){
          switch(state.postsStatus){
            case PostStatus.loading:
              return Center(child: CircularProgressIndicator());
            case PostStatus.failure:
              return Center(child: Text(state.message.toString()));
            case PostStatus.success:
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                      hintText:"Search with email",
                          border: OutlineInputBorder()
                      ),
                      onChanged:(filterKey) {
                        context.read<PostsBloc>().add(SearchItem(filterKey));
                      },
                    ),
                  ),
                  Expanded(
                    child: state.searchMessage.isNotEmpty ?
                    Center(child: Text(state.searchMessage.toString())) :
                    ListView.builder(
                      itemCount:state.temPostList.isEmpty ? state.postsList.length : state.temPostList.length,
                      itemBuilder: (context,index){
                        if(state.temPostList.isNotEmpty){
                          final item = state.temPostList[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 8,left: 8),
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 20,right: 20),
                                      child: Text(item.id.toString(),)
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 20,right: 20),
                                      child: Text(item.name.toString(),)
                                  ),
                                  ListTile(
                                    title: Text(item.email.toString()),
                                    subtitle: Text(item.body.toString()),
                                  ),

                                ],
                              ),
                            ),
                          );
                        }else{
                          final item = state.postsList[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 8,left: 8),
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 20,right: 20),
                                      child: Text(item.id.toString(),)
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 20,right: 20),
                                      child: Text(item.name.toString(),)
                                  ),
                                  ListTile(
                                    title: Text(item.email.toString()),
                                    subtitle: Text(item.body.toString()),
                                  ),

                                ],
                              ),
                            ),
                          );
                        }


                      }
                  ),
          )
                ],


              );
          }

        }
      ),
    );
  }
}
