import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/group_model.dart';

class GroupTodo extends StatelessWidget {
  final GroupModel groupModel;
  final Function(GroupModel) onTap;
  const GroupTodo({Key? key, required this.groupModel, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(groupModel),
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
                children: groupModel.users
                    ?.map((member) => Padding(
                          padding: EdgeInsets.only(left: groupModel.users!.indexOf(member) * 20),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("${member.photoUrl}"),
                          ),
                        ))
                    .toList() as List<Widget>),
          ),
        ],
      ),
    );
  }
}
