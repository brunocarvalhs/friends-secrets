import 'package:flutter/material.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/type_model.dart';

class TypeTodo extends StatelessWidget {
  final TypeModel type;
  final Function(TypeModel) onSelect;
  final bool isSelected;

  const TypeTodo({
    Key? key,
    required this.type,
    required this.onSelect,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelect(type),
      child: Card(
        borderOnForeground: true,
        semanticContainer: false,
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: isSelected
                ? Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  )
                : null,
            color: isSelected ? Theme.of(context).colorScheme.primary.withOpacity(0.1) : null,
          ),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://static.wikia.nocookie.net/dragonball/images/8/84/KrillinDragonBallDebut.png/revision/latest?cb=20150109224457&path-prefix=pt-br'),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "${type.name}",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "${type.description}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
