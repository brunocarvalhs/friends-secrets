import 'package:flutter/material.dart';
import 'package:friends_secrets/app/shared/widgets/header_default.dart';

class AppBarDefault extends StatelessWidget {
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final String? title;
  final void Function()? onTapTitle;
  final String? subtitle;
  final double? expandedHeight;
  const AppBarDefault({
    Key? key,
    required this.title,
    this.subtitle,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.expandedHeight,
    this.onTapTitle,
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
        actions: actions,
        flexibleSpace: FlexibleSpaceBar(
          background: HeaderDefault(
            title: title,
            subtitle: subtitle,
            onTapTitle: onTapTitle,
            top: automaticallyImplyLeading ? 50 : 0,
            left: 20,
            right: 20,
          ),
        ),
      ),
    );
  }
}
