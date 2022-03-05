import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/group_model.dart';

class GroupTodo extends StatelessWidget {
  final GroupModel groupModel;
  const GroupTodo({Key? key, required this.groupModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed("/home/${groupModel.id}", arguments: groupModel),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text("${groupModel.description}"),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("${groupModel.users?.last.photoUrl}"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("${groupModel.author?.photoUrl}"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: CircleAvatar(
                    child: Text("+${groupModel.users?.length}"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
