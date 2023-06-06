import 'dart:html';

import 'package:flutter/material.dart';
import 'SignalR.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPage createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  bool detectTruck = false;
  bool detectPerson = false;
  bool soundAlarm = false;
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: startTime,
    );
    if (picked != null && picked != startTime) {
      setState(() {
        startTime = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: endTime,
    );
    if (picked != null && picked != endTime) {
      setState(() {
        endTime = picked;
      });
    }
  }

  void _saveData() {
    print('Data saved!');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Time Window Picker'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Start Time:'),
                SizedBox(width: 8),
                TextButton(
                  onPressed: () => _selectStartTime(context),
                  child: Text('${startTime.format(context)}'),
                ),
                SizedBox(width: 16),
                Text('End Time:'),
                SizedBox(width: 8),
                TextButton(
                  onPressed: () => _selectEndTime(context),
                  child: Text('${endTime.format(context)}'),
                ),
              ],
            ),
            SizedBox(height: 16),
            CheckboxListTile(
              title: Text('Detect Truck'),
              value: detectTruck,
              onChanged: (bool? newValue) {
                setState(() {
                  detectTruck = newValue ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Detect Person'),
              value: detectPerson,
              onChanged: (bool? newValue) {
                setState(() {
                  detectPerson = newValue ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Sound Alarm on Person Detection'),
              value: soundAlarm,
              onChanged: (bool? newValue) {
                setState(() {
                  soundAlarm = newValue ?? false;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveData,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override

  _SecondPage createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Second Page'),
    );
  }
}


class ConfigsPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<ConfigsPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [FirstPage(), SecondPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Configurations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Status',
          ),
        ],
      ),
    );
  }
}