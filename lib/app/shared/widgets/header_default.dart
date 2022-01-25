import 'package:flutter/material.dart';

class HeaderDefault extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double top;
  final double left;
  final double right;

  const HeaderDefault({
    Key? key,
    required this.title,
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
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      subtitle!,
                      style: Theme.of(context).textTheme.headline3,
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
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
