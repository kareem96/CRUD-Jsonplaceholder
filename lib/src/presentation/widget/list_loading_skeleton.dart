import 'package:flutter/material.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class ListLoadingSkeleton extends StatelessWidget {
  const ListLoadingSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, _) {
          return const SizedBox(
            width: double.infinity,
            child: SkeletonText(height: 12),
          );
        },
        separatorBuilder: (BuildContext context, _) {
          return const SizedBox(
            height: 5,
          );
        },
        itemCount: 3);
  }
}
