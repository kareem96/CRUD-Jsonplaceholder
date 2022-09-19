import 'package:crud_jsonplaceholder/src/presentation/bloc/posts/list/posts_bloc.dart';
import 'package:crud_jsonplaceholder/src/presentation/bloc/posts/post/post_bloc.dart';
import 'package:crud_jsonplaceholder/src/presentation/page/posts/post_listing_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<PostsBloc>(
        create: (context) => PostsBloc(),
      ),
      BlocProvider<PostBloc>(
        create: (context) => PostBloc(),
      )
    ], child: const CupertinoApp(
      title: "JsonPlaceHolder",
      home: PostListingView(),
    ));
  }
}
