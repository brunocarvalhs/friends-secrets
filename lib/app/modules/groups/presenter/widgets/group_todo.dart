import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/group_model.dart';

class GroupTodo extends StatelessWidget {
  final GroupModel groupModel;
  final Function(GroupModel) onTap;
  final Function(GroupModel)? onDelete;
  final Function(GroupModel)? onShared;

  const GroupTodo({
    Key? key,
    required this.groupModel,
    required this.onTap,
    this.onDelete,
    this.onShared,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          if (onDelete != null)
            SlidableAction(
              onPressed: (context) => onDelete!(groupModel),
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          if (onShared != null)
            SlidableAction(
              onPressed: (context) => onShared!(groupModel),
              backgroundColor: const Color.fromARGB(255, 98, 155, 219),
              foregroundColor: Colors.white,
              icon: Icons.share_rounded,
              label: 'Shared',
            ),
        ],
      ),
      child: InkWell(
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
                children: <Widget>[
                  ...groupModel.users
                      ?.getRange(
                          0,
                          groupModel.users!.length > 6
                              ? 6
                              : groupModel.users!.length)
                      .map<Widget>(
                        (member) => Padding(
                          padding: EdgeInsets.only(
                              left: groupModel.users!.length > 1
                                  ? (groupModel.users!.indexOf(member) + 1) * 20
                                  : 0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("${member.photoUrl}"),
                          ),
                        ),
                      )
                      .toList() as List<Widget>,
                  if (groupModel.users!.length > 1)
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: CircleAvatar(
                        child: Text(
                            "+ ${groupModel.users!.length > 9 ? 9 : groupModel.users?.length ?? 0}"),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
