import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HeaderDefault extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final double top;
  final double left;
  final double right;

  const HeaderDefault({
    Key? key,
    this.title,
    this.subtitle,
    this.top = 50,
    this.left = 20,
    this.right = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return subtitle != null
        ? Padding(
            padding: EdgeInsets.only(top: top, left: left, right: right),
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
                    title != null
                        ? Text(
                            "$title",
                            style: Theme.of(context).textTheme.headline4,
                          )
                        : Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            enabled: title != null,
                            child: Container(
                              height: 20,
                            ),
                          ),
                    const SizedBox(height: 30),
                    Text(
                      subtitle!,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ],
            ),
          )
        : Padding(
            padding: EdgeInsets.only(top: top, left: left, right: right),
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
                    title != null
                        ? Text(
                            title!,
                            style: Theme.of(context).textTheme.headline4,
                          )
                        : Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            enabled: title != null,
                            child: Container(),
                          ),
                  ],
                ),
              ],
            ),
          );
  }
}
