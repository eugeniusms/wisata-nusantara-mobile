import 'package:wisata_nusantara_mobile/apps/faq/models/public_faq_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailScreen({super.key, required this.todo});

  // Declare a field that holds the Todo.
  final PublicFaq todo;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(todo.fields.title),
      // ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Text(
                    todo.fields.question,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color.fromARGB(255, 0, 157, 255)),
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: const [
                  //     Text(
                  //       "Rating: ",
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //     Text(
                  //       "Status: ",
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //     Text(
                  //       "Release Date: ",
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //     Text(
                  //       "Review: ",
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //   ],
                  // ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text("${todo.fields.rating.toString()}/5"),
                  //     Text(todo.fields.watched),
                  //     Text(todo.fields.releaseDate),
                  //     // Text(todo.fields.releaseDate),
                  //   ],
                  // ),
                ],
              ),
              Text(todo.fields.answer),
            ],
          )),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: FloatingActionButton.extended(
            tooltip: 'Back',
            hoverElevation: 50,
            label: const Text('Back'),
            icon: const Icon(Icons.skip_previous),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ]),
    );
  }
}
