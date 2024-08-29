import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PostTileShimmer extends StatelessWidget {
  final int itemCount;
  const PostTileShimmer({
    this.itemCount = 10,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (_, __) => Container(
          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
          child: Row(children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    height: 76.0,
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
