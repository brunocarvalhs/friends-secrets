import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/group_model.dart';

class GroupTodo extends StatelessWidget {
  final GroupModel groupModel;
  const GroupTodo({Key? key, required this.groupModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Modular.to.pushNamed("/home/${groupModel.id}", arguments: groupModel),
        child: Column(
          children: [
            ListTile(
              title: Text(
                "${groupModel.name}",
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                "${groupModel.type?.name}",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("${groupModel.description}"),
            ),
          ],
        ),
      ),
    );
  }
}
