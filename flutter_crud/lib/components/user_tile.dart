import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';

class UserTile extends StatelessWidget {
  final User user;

  // ignore: use_key_in_widget_constructors
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    final avatar = user.avatarUrl.isEmpty || user.avatarUrl == null
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
            color: Colors.orange,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
            color: Colors.red,
          )
        ]),
      ),
    );
  }
}
