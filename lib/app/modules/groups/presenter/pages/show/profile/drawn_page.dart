import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/show/profile/drawn_controller.dart';
import 'package:friends_secrets/app/shared/widgets/app_bar_default.dart';
import 'package:friends_secrets/app/shared/widgets/loading_present.dart';

class DrawnPage extends StatefulWidget {
  final String id;
  const DrawnPage({Key? key, required this.id}) : super(key: key);
  @override
  DrawnPageState createState() => DrawnPageState();
}

class DrawnPageState extends ModularState<DrawnPage, DrawnController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: controller.request(context),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const LoadingPresent();
              default:
                return NestedScrollView(
                  headerSliverBuilder: (_, b) => [
                    AppBarDefault(
                      expandedHeight: 400,
                      title: "${controller.user?.name?.split(" ").first}\n${controller.user?.name?.split(" ").last}",
                      childTop: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          imageUrl: "${controller.user?.photoUrl}",
                          imageBuilder: (context, imageProvider) => Center(
                            child: CircleAvatar(
                              backgroundImage: imageProvider,
                              radius: 60,
                            ),
                          ),
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ],
                  body: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Observer(builder: (context) {
                            return Wrap(
                              spacing: 10,
                              children: controller.user?.likers
                                      ?.map(
                                        (item) => Chip(
                                          label: Text('${item.name}'),
                                          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                                        ),
                                      )
                                      .toList() ??
                                  [],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
