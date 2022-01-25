import 'package:flutter/material.dart';

class AppBarDefault extends StatelessWidget {
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final String title;
  final String? subtitle;
  final double? expandedHeight;
  const AppBarDefault({
    Key? key,
    required this.title,
    this.subtitle,
    this.automaticallyImplyLeading = true,
    this.actions,
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
        actions: actions,
        flexibleSpace: subtitle != null
            ? FlexibleSpaceBar(
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
                ),
              )
            : FlexibleSpaceBar(
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
                          Text(
                            title,
                            style: Theme.of(context).textTheme.headline1,
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
