import 'package:crud_jsonplaceholder/src/presentation/page/posts/widget/post_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../data/model/post.dart';
import '../../bloc/posts/list/posts_bloc.dart';
import '../../widget/loading_spinner.dart';
import 'form/post_form.dart';

class PostListingView extends StatefulWidget {
  const PostListingView({Key? key}) : super(key: key);

  @override
  _PostListingViewState createState() => _PostListingViewState();
}

class _PostListingViewState extends State<PostListingView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool isInnerBoxScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: const Text("Home"),
              trailing: CupertinoButton(
                padding: const EdgeInsets.all(8),
                onPressed: _showAddPostModal,
                child: const Icon(Icons.add),
              ),
            )
          ];
        },
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (BuildContext context, PostsState state) {
            switch (state.status) {
              case PostsStatus.loading:
                return Column(
                  children: const <Widget>[
                    LoadingSpinner(),
                  ],
                );
              case PostsStatus.success:
                return _buildPostList(state.posts);
              default:
                return Column(
                  children: const <Widget>[
                    LoadingSpinner(),
                  ],
                );
            }
          },
        ),
      ),
    );
  }

  Widget _buildPostList(List<Post> posts) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          final Post post = posts[index];
          return PostTile(post: post);
        });
  }

  void _loadPosts() {
    BlocProvider.of<PostsBloc>(context).add(PostsRequest());
  }

  void _showAddPostModal() {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (BuildContext context) => const PostForm(),
    );
  }
}