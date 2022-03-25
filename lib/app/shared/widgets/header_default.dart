import 'package:flutter/material.dart';

class HeaderDefault extends StatelessWidget {
  final Widget? childTop;
  final Widget? childBottom;

  final String? title;
  final String? subtitle;
  final void Function()? onTapTitle;
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
    this.onTapTitle,
    this.childTop,
    this.childBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              if (childTop != null) childTop!,
              if (title != null)
                InkWell(
                  onTap: onTapTitle,
                  child: Text(
                    "$title",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              if (subtitle != null) const SizedBox(height: 30),
              if (subtitle != null)
                Text(
                  "$subtitle",
                  style: Theme.of(context).textTheme.headline6,
                ),
              if (childBottom != null) childBottom!,
            ],
          ),
        ],
      ),
    );
  }
}
