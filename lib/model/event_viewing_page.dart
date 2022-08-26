import 'package:calenderapp/pages/event_editing_page.dart';
import 'package:flutter/material.dart';
import 'package:calenderapp/utility/utilities.dart';
import 'package:calenderapp/provider/event_provider.dart';
import 'package:calenderapp/widgets/task_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'event.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;
  const EventViewingPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CloseButton(),
        ),
        body: ListView(
          padding: EdgeInsets.all(32),
          children: [
            SizedBox(
              height: 32,
            ),
            Text(
              event.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              event.description,
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ));
  }

  // Widget buildDateTime(Event event) {
  //   return Column(
  //     children: [
  //       buildDate(event.isAllDay ? 'All-Day' : 'From', event.from),
  //     ],
  //   );
  // }

  // List<Widget> buildViewingActions(BuildContext context, Event event) {
  //   IconButton(
  //       icon: Icon(Icons.edit),
  //       onPressed: () => Navigator.of(context).pushReplacement(
  //             MaterialPageRoute(
  //               builder: (context) => EventEditingPage(
  //                 event: event,
  //               ),
  //             ),
  //           ),
  //   ),
  //   IconButton(icon: Icon(Icons.delete),onPressed: (),)

  // }
}
