import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:friends_secrets/app/modules/notification/infra/models/notification_model.dart';

class NotificationTodo extends StatelessWidget {
  final NotificationModel notification;

  const NotificationTodo({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: key,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${notification.created?.day}/${notification.created?.month}/${notification.created?.year}",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  if (!notification.isVisualized)
                    const SizedBox(
                      width: 30,
                    ),
                  if (!notification.isVisualized)
                    Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                    ),
                  if (!notification.isVisualized)
                    const SizedBox(
                      width: 5,
                    ),
                  if (!notification.isVisualized)
                    Text(
                      "Novo",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    )
                ],
              ),
              subtitle: Text(
                "${notification.title}",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text("${notification.body}"),
            ),
          ],
        ),
      ),
    );
  }
}
