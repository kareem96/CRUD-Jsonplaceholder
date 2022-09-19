import 'package:crud_jsonplaceholder/src/presentation/page/users/user_avatar_loading.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class UserLoadingSkeleton extends StatelessWidget {
  const UserLoadingSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const UserAvatarLoading(),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              SkeletonText(height: 12),
              SizedBox(
                height: 12,
              ),
              SkeletonText(height: 12),
            ],
          ),
        )
      ],
    );
  }
}
