import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_color.dart';

class TaskShimmer extends StatelessWidget {
  final int itemCount;
  const TaskShimmer({
    this.itemCount = 2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: itemCount,
          itemBuilder: (_, __) => Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColor.grey100,
                      width: 5.0,
                    ),
                  ),
                ),
                child: Container(
                    width: 20.0,
                    height: 75.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                    )),
              )),
    );
  }
}
