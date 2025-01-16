import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_grocery_app/api/bloc/posts_bloc.dart';


class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {

  final PostsBloc postsBloc = PostsBloc();

  @override
  void initState() {
    super.initState();
    postsBloc.add(PostsInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
              "Posts Jsonholder Api Bloc",style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: postsBloc,
        listenWhen:(previous, current) => current is PostsActionState,
        buildWhen: (previous, current) => current is !PostsActionState,
        listener: (context, state) {
        },
        builder: (context, state) {
         switch(state.runtimeType){
           case PostsLoadingState:
             return Center(
               child: CircularProgressIndicator(),
             );
           case PostsFetchSuccessState:
             final successState = state as PostsFetchSuccessState;
             return Container(
               child: ListView.builder(
                    itemCount: successState.posts.length,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.all(16),
                        color: Colors.grey[300],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(successState.posts[index].id.toString()),
                            Text(successState.posts[index].title),
                            Text(successState.posts[index].body),
                          ],
                        ),
                      );
                   },
               )
             );
             break;
           case PostsErrorState:
             return const  Center(
         child: Text('Page Not Found'),
         );
           default :
             return Container();
         }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          postsBloc.add(PostsAddEvent());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
