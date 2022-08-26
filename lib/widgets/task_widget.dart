import 'dart:math';

import 'package:calenderapp/model/event_data_source.dart';
import 'package:calenderapp/provider/event_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../model/event_viewing_page.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final selectedEvents = provider.eventsOfSelectedDate;
    if (selectedEvents.isEmpty) {
      return Center(
        child: Text(
          'No events found!',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      );
    }
    return SfCalendarTheme(
      data: SfCalendarThemeData(
          timeTextStyle: TextStyle(fontSize: 16, color: Colors.white)),
      child: SfCalendar(
        view: CalendarView.timelineDay,
        dataSource: EventDataSource(provider.events),
        initialDisplayDate: provider.selectedDate,
        appointmentBuilder: appointmentBuilder,
        headerHeight: 0,
        selectionDecoration:
            BoxDecoration(color: Colors.lightGreen.withOpacity(0.3)),
        onTap: (details) {
          if (details.appointments == null) return;
          final event = details.appointments!.first;
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EventViewingPage(event: event)));
        },
      ),
    );
  }

  Widget appointmentBuilder(
      BuildContext context, CalendarAppointmentDetails details) {
    final event = details.appointments.first;
    return Container(
      width: details.bounds.width,
      height: details.bounds.height,
      decoration: BoxDecoration(
          color: event.backgroundColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12)),
      child: Text(
        event.title,
        maxLines: 2,
        overflow: TextOverflow.visible,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
