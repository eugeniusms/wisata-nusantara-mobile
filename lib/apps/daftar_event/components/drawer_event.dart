import 'package:flutter/material.dart';

import '../../dashboard/Dashboard.dart';
import '../screens/add_event.dart';

Drawer buildEventDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.only(top: 60.0, left: 30.0),
      children: [
        ListTile(
          title: const Text('Dashboard'),
          leading: const Icon(Icons.house),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Dashboard(
                        title: "Dashboard",
                      )),
            );
          },
        ),
        ListTile(
          title: const Text('Add New Event'),
          leading: const Icon(Icons.add),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AddEvent()),
            );
          },
        )
      ],
    ),
  );
}
