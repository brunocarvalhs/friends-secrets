import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppBarLoading extends StatelessWidget {
  final bool automaticallyImplyLeading;
  final double? expandedHeight;
  const AppBarLoading({
    Key? key,
    this.automaticallyImplyLeading = true,
    this.expandedHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: !automaticallyImplyLeading ? 50 : 0),
      sliver: SliverAppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        expandedHeight: expandedHeight,
        pinned: true,
        stretch: true,
        automaticallyImplyLeading: automaticallyImplyLeading,
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: EdgeInsets.only(top: automaticallyImplyLeading ? 50 : 0, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.red,
                      highlightColor: Colors.yellow,
                      child: const SizedBox(
                        height: 20.0,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Shimmer.fromColors(
                      baseColor: Colors.red,
                      highlightColor: Colors.yellow,
                      child: const SizedBox(
                        height: 20.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
