import 'package:flutter/material.dart';
import '../components/header/header.dart';

final List<Map<String, dynamic>> _timetableData = [
  {
    'day': 'Monday',
    'slots': [
      {'time': '8:00 – 9:00 AM',  'subject': 'Data Structures & Algorithms', 'code': 'CS301', 'room': 'LH-1', 'faculty': 'Dr. Rajesh Kumar'},
      {'time': '9:00 – 10:00 AM', 'subject': 'Engineering Mathematics III', 'code': 'MA301', 'room': 'LH-2', 'faculty': 'Dr. Priya Sharma'},
      {'time': '10:15 – 11:15 AM','subject': 'Computer Networks', 'code': 'CS302', 'room': 'LH-1', 'faculty': 'Prof. Anil Mehta'},
      {'time': '11:15 – 12:15 PM','subject': 'Operating Systems', 'code': 'CS303', 'room': 'LH-3', 'faculty': 'Dr. Kavita Singh'},
      {'time': '1:00 – 3:00 PM',  'subject': 'DSA Lab', 'code': 'CS301L', 'room': 'Lab-1', 'faculty': 'Dr. Rajesh Kumar'},
    ],
  },
  {
    'day': 'Tuesday',
    'slots': [
      {'time': '8:00 – 9:00 AM',  'subject': 'Database Management Systems', 'code': 'CS304', 'room': 'LH-2', 'faculty': 'Mrs. Sunita Verma'},
      {'time': '9:00 – 10:00 AM', 'subject': 'Computer Networks', 'code': 'CS302', 'room': 'LH-1', 'faculty': 'Prof. Anil Mehta'},
      {'time': '10:15 – 11:15 AM','subject': 'Engineering Mathematics III', 'code': 'MA301', 'room': 'LH-2', 'faculty': 'Dr. Priya Sharma'},
      {'time': '1:00 – 3:00 PM',  'subject': 'Networks Lab', 'code': 'CS302L', 'room': 'Lab-2', 'faculty': 'Prof. Anil Mehta'},
    ],
  },
  {
    'day': 'Wednesday',
    'slots': [
      {'time': '8:00 – 9:00 AM',  'subject': 'Operating Systems', 'code': 'CS303', 'room': 'LH-3', 'faculty': 'Dr. Kavita Singh'},
      {'time': '9:00 – 10:00 AM', 'subject': 'Data Structures & Algorithms', 'code': 'CS301', 'room': 'LH-1', 'faculty': 'Dr. Rajesh Kumar'},
      {'time': '10:15 – 11:15 AM','subject': 'Soft Skills & Communication', 'code': 'HS301', 'room': 'Seminar Hall', 'faculty': 'Mr. Deepak Joshi'},
      {'time': '11:15 – 12:15 PM','subject': 'Database Management Systems', 'code': 'CS304', 'room': 'LH-2', 'faculty': 'Mrs. Sunita Verma'},
    ],
  },
  {
    'day': 'Thursday',
    'slots': [
      {'time': '8:00 – 9:00 AM',  'subject': 'Engineering Mathematics III', 'code': 'MA301', 'room': 'LH-2', 'faculty': 'Dr. Priya Sharma'},
      {'time': '9:00 – 10:00 AM', 'subject': 'Computer Networks', 'code': 'CS302', 'room': 'LH-1', 'faculty': 'Prof. Anil Mehta'},
      {'time': '1:00 – 3:00 PM',  'subject': 'DBMS Lab', 'code': 'CS304L', 'room': 'Lab-3', 'faculty': 'Mrs. Sunita Verma'},
    ],
  },
  {
    'day': 'Friday',
    'slots': [
      {'time': '8:00 – 9:00 AM',  'subject': 'Data Structures & Algorithms', 'code': 'CS301', 'room': 'LH-1', 'faculty': 'Dr. Rajesh Kumar'},
      {'time': '9:00 – 10:00 AM', 'subject': 'Operating Systems', 'code': 'CS303', 'room': 'LH-3', 'faculty': 'Dr. Kavita Singh'},
      {'time': '10:15 – 11:15 AM','subject': 'Database Management Systems', 'code': 'CS304', 'room': 'LH-2', 'faculty': 'Mrs. Sunita Verma'},
      {'time': '11:15 – 12:15 PM','subject': 'Soft Skills & Communication', 'code': 'HS301', 'room': 'Seminar Hall', 'faculty': 'Mr. Deepak Joshi'},
    ],
  },
  {
    'day': 'Saturday',
    'slots': [
      {'time': '9:00 – 10:00 AM', 'subject': 'Computer Networks', 'code': 'CS302', 'room': 'LH-1', 'faculty': 'Prof. Anil Mehta'},
      {'time': '10:00 – 11:00 AM','subject': 'Engineering Mathematics III', 'code': 'MA301', 'room': 'LH-2', 'faculty': 'Dr. Priya Sharma'},
      {'time': '11:15 – 1:15 PM', 'subject': 'OS Lab', 'code': 'CS303L', 'room': 'Lab-1', 'faculty': 'Dr. Kavita Singh'},
    ],
  },
];

class TimeTablePage extends StatefulWidget {
  final bool isAdmin;
  const TimeTablePage({super.key, this.isAdmin = false});

  @override
  State<TimeTablePage> createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  int selectedDay = DateTime.now().weekday - 1; // 0=Mon, 5=Sat, 6=Sun→show Mon
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  final List<Color> slotColors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
  ];

  @override
  Widget build(BuildContext context) {
    final dayIndex = selectedDay.clamp(0, 5);
    final dayData = _timetableData[dayIndex];
    final slots = dayData['slots'] as List<Map<String, dynamic>>;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      const BackButton(color: Color.fromARGB(255, 3, 59, 105)),
                      const Text('Back to Dashboard',
                          style: TextStyle(
                              color: Color.fromARGB(255, 3, 59, 105),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: Text('Class Timetable',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Text('Your weekly academic schedule',
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 15)),
                  ),

                  // Day selector
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: days.length,
                      itemBuilder: (_, i) {
                        final isSelected = dayIndex == i;
                        return GestureDetector(
                          onTap: () => setState(() => selectedDay = i),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color.fromARGB(255, 3, 59, 105)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  color: const Color.fromARGB(255, 3, 59, 105)),
                            ),
                            child: Text(
                              days[i],
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : const Color.fromARGB(255, 3, 59, 105),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                    child: Text(
                      '${dayData['day']} — ${slots.length} Classes',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),

                  ...slots.asMap().entries.map((entry) {
                    final i = entry.key;
                    final slot = entry.value;
                    final color = slotColors[i % slotColors.length];

                    return Container(
                      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        children: [
                          // Color bar
                          Container(
                            width: 6,
                            height: 90,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(14),
                                bottomLeft: Radius.circular(14),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          slot['subject'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: color.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(slot['code'],
                                            style: TextStyle(
                                                color: color,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time_outlined,
                                          size: 14, color: Colors.grey[500]),
                                      const SizedBox(width: 4),
                                      Text(slot['time'],
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 13)),
                                      const SizedBox(width: 12),
                                      Icon(Icons.room_outlined,
                                          size: 14, color: Colors.grey[500]),
                                      const SizedBox(width: 4),
                                      Text(slot['room'],
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 13)),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.person_outline,
                                          size: 14, color: Colors.grey[500]),
                                      const SizedBox(width: 4),
                                      Text(slot['faculty'],
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 13)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
