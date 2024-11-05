import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_articture/bloc/movies/movies_state.dart';
import 'package:flutter_bloc_clean_articture/config/routes/routes_name.dart';
import 'package:flutter_bloc_clean_articture/main.dart';
import 'package:flutter_bloc_clean_articture/services/storage/local_storage.dart';

import '../../Utils/enums.dart';
import '../../bloc/movies/movies_bloc.dart';
import '../../bloc/movies/movies_event.dart';
import '../../config/components/internet_exception_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late MoviesBloc moviesBloc;

  @override
  void initState() {
    super.initState();
    moviesBloc = MoviesBloc(moviesRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: const Text("Home"),
       actions: [
         IconButton(onPressed: (){
           LocalStorage localStorage = LocalStorage();
           localStorage.clearValue("token").then((value){
             localStorage.clearValue("isLogin").then((value){
               Navigator.pushNamed(context, RoutesName.loginScreen);
             });
           });
         }, icon: Icon(Icons.logout))
       ],
     ) ,
      body: BlocProvider(
        create: (_) => moviesBloc..add(MoviesFetched()),
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            switch (state.moviesList.status) {
              case Status.loading:
                return Center(child: CircularProgressIndicator());

              case Status.error:
                if (state.moviesList.message== "No Internet Connection:") {
                  return InternetExceptionWidget(
                    onPress: () {
                      moviesBloc.add(MoviesFetched());
                    },
                  );
                } else {
                  return Center(child: Text('${state.moviesList.message}'));
                }

              case Status.completed:
                final movieList = state.moviesList.data!;
                return ListView.builder(
                  itemCount: movieList.tvShow.length,
                  itemBuilder: (context, index) {
                    final tvShow = movieList.tvShow[index];
                    return Card(
                      child: ListTile(
                        leading: tvShow.imageThumbnailPath != null
                            ? Image.network(tvShow.imageThumbnailPath!)
                            : Icon(Icons.broken_image),
                        title: Text(tvShow.name ?? 'Unknown'),
                        subtitle: Text(tvShow.network ?? 'Unknown Network'),
                        trailing: Text(tvShow.status ?? 'Unknown Status'),
                      ),
                    );
                  },
                );

              default:
                return SizedBox(); // Default case to avoid returning null
            }
          },
        ),
      ),

    );
  }
}
