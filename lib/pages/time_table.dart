import 'package:flutter/material.dart';
import '../components/header/header.dart';
import '../components/app_drawer.dart';

// ── Static timetable (reused across streams for demo) ───────────────────────
final List<Map<String, dynamic>> _weekData = [
  {
    'day': 'Monday',
    'slots': [
      {'time': '8:00 – 9:00 AM', 'subject': 'Data Structures & Algorithms', 'code': 'CS301', 'room': 'LH-1', 'faculty': 'Dr. Rajesh Kumar'},
      {'time': '9:00 – 10:00 AM', 'subject': 'Engineering Mathematics III', 'code': 'MA301', 'room': 'LH-2', 'faculty': 'Dr. Priya Sharma'},
      {'time': '10:15 – 11:15 AM', 'subject': 'Computer Networks', 'code': 'CS302', 'room': 'LH-1', 'faculty': 'Prof. Anil Mehta'},
      {'time': '11:15 – 12:15 PM', 'subject': 'Operating Systems', 'code': 'CS303', 'room': 'LH-3', 'faculty': 'Dr. Kavita Singh'},
      {'time': '1:00 – 3:00 PM', 'subject': 'DSA Lab', 'code': 'CS301L', 'room': 'Lab-1', 'faculty': 'Dr. Rajesh Kumar'},
    ],
  },
  {
    'day': 'Tuesday',
    'slots': [
      {'time': '8:00 – 9:00 AM', 'subject': 'Database Management', 'code': 'CS304', 'room': 'LH-2', 'faculty': 'Mrs. Sunita Verma'},
      {'time': '9:00 – 10:00 AM', 'subject': 'Computer Networks', 'code': 'CS302', 'room': 'LH-1', 'faculty': 'Prof. Anil Mehta'},
      {'time': '10:15 – 11:15 AM', 'subject': 'Engineering Mathematics III', 'code': 'MA301', 'room': 'LH-2', 'faculty': 'Dr. Priya Sharma'},
      {'time': '1:00 – 3:00 PM', 'subject': 'Networks Lab', 'code': 'CS302L', 'room': 'Lab-2', 'faculty': 'Prof. Anil Mehta'},
    ],
  },
  {
    'day': 'Wednesday',
    'slots': [
      {'time': '8:00 – 9:00 AM', 'subject': 'Operating Systems', 'code': 'CS303', 'room': 'LH-3', 'faculty': 'Dr. Kavita Singh'},
      {'time': '9:00 – 10:00 AM', 'subject': 'Data Structures & Algorithms', 'code': 'CS301', 'room': 'LH-1', 'faculty': 'Dr. Rajesh Kumar'},
      {'time': '10:15 – 11:15 AM', 'subject': 'Soft Skills', 'code': 'HS301', 'room': 'Seminar Hall', 'faculty': 'Mr. Deepak Joshi'},
      {'time': '11:15 – 12:15 PM', 'subject': 'Database Management', 'code': 'CS304', 'room': 'LH-2', 'faculty': 'Mrs. Sunita Verma'},
    ],
  },
  {
    'day': 'Thursday',
    'slots': [
      {'time': '8:00 – 9:00 AM', 'subject': 'Engineering Mathematics III', 'code': 'MA301', 'room': 'LH-2', 'faculty': 'Dr. Priya Sharma'},
      {'time': '9:00 – 10:00 AM', 'subject': 'Computer Networks', 'code': 'CS302', 'room': 'LH-1', 'faculty': 'Prof. Anil Mehta'},
      {'time': '1:00 – 3:00 PM', 'subject': 'DBMS Lab', 'code': 'CS304L', 'room': 'Lab-3', 'faculty': 'Mrs. Sunita Verma'},
    ],
  },
  {
    'day': 'Friday',
    'slots': [
      {'time': '8:00 – 9:00 AM', 'subject': 'Data Structures & Algorithms', 'code': 'CS301', 'room': 'LH-1', 'faculty': 'Dr. Rajesh Kumar'},
      {'time': '9:00 – 10:00 AM', 'subject': 'Operating Systems', 'code': 'CS303', 'room': 'LH-3', 'faculty': 'Dr. Kavita Singh'},
      {'time': '10:15 – 11:15 AM', 'subject': 'Database Management', 'code': 'CS304', 'room': 'LH-2', 'faculty': 'Mrs. Sunita Verma'},
      {'time': '11:15 – 12:15 PM', 'subject': 'Soft Skills', 'code': 'HS301', 'room': 'Seminar Hall', 'faculty': 'Mr. Deepak Joshi'},
    ],
  },
  {
    'day': 'Saturday',
    'slots': [
      {'time': '9:00 – 10:00 AM', 'subject': 'Computer Networks', 'code': 'CS302', 'room': 'LH-1', 'faculty': 'Prof. Anil Mehta'},
      {'time': '10:00 – 11:00 AM', 'subject': 'Engineering Mathematics III', 'code': 'MA301', 'room': 'LH-2', 'faculty': 'Dr. Priya Sharma'},
      {'time': '11:15 – 1:15 PM', 'subject': 'OS Lab', 'code': 'CS303L', 'room': 'Lab-1', 'faculty': 'Dr. Kavita Singh'},
    ],
  },
];

final List<Map<String, dynamic>> _streamOptions = [
  {'name': 'B.Tech', 'years': 4},
  {'name': 'BBA', 'years': 3},
  {'name': 'MBA', 'years': 2},
  {'name': 'B.Des', 'years': 4},
];

final List<Color> _slotColors = [
  Colors.blue, Colors.green, Colors.orange,
  Colors.purple, Colors.teal, Colors.pink,
];

class TimeTablePage extends StatefulWidget {
  final bool isAdmin;
  const TimeTablePage({super.key, this.isAdmin = false});

  @override
  State<TimeTablePage> createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  String? _selectedStream;
  int? _selectedYear;
  int _selectedDay = DateTime.now().weekday.clamp(1, 6) - 1;

  bool get _showTimetable => _selectedStream != null && _selectedYear != null;

  List<String> _yearLabels(int years) =>
      List.generate(years, (i) => '${_ordinal(i + 1)} Year');

  String _ordinal(int n) {
    if (n == 1) return '1st';
    if (n == 2) return '2nd';
    if (n == 3) return '3rd';
    return '${n}th';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      drawer: const AppDrawer(activeRoute: 'timetable'),
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new,
                              color: Color.fromARGB(255, 3, 59, 105),
                              size: 18),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Text('Back to Dashboard',
                            style: TextStyle(
                              color: Color.fromARGB(255, 3, 59, 105),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Class Timetable',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        Text('View your academic schedule',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 15)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ── Select Stream ─────────────────────────────────
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
                    child: Text('Select Your Stream',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.15,
                      ),
                      itemCount: _streamOptions.length,
                      itemBuilder: (_, i) {
                        final s = _streamOptions[i];
                        final isSelected = _selectedStream == s['name'];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedStream = s['name'];
                              _selectedYear = null;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: isSelected
                                    ? const Color.fromARGB(255, 3, 59, 105)
                                    : Colors.grey.shade200,
                                width: isSelected ? 2 : 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3)),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? const Color.fromARGB(255, 3, 59, 105)
                                            .withOpacity(0.1)
                                        : Colors.grey[100],
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Icon(
                                    Icons.calendar_month_outlined,
                                    color: isSelected
                                        ? const Color.fromARGB(255, 3, 59, 105)
                                        : Colors.black54,
                                    size: 28,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(s['name'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: isSelected
                                            ? const Color.fromARGB(
                                                255, 3, 59, 105)
                                            : Colors.black87)),
                                const SizedBox(height: 2),
                                Text('${s['years']} Years',
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 12)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // ── Select Year (shown after stream selected) ────
                  if (_selectedStream != null) ...[
                    const SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
                      child: Text('Select Year',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          ..._yearLabels(
                                  _streamOptions.firstWhere(
                                      (s) =>
                                          s['name'] == _selectedStream)['years']
                                      as int)
                              .asMap()
                              .entries
                              .map(
                                (entry) => GestureDetector(
                                  onTap: () => setState(
                                      () => _selectedYear = entry.key + 1),
                                  child: AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 200),
                                    margin: const EdgeInsets.only(bottom: 8),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14, horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: _selectedYear == entry.key + 1
                                          ? const Color(0xFFF59E0B)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color:
                                              _selectedYear == entry.key + 1
                                                  ? const Color(0xFFF59E0B)
                                                  : Colors.grey.shade200),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          entry.value,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                _selectedYear == entry.key + 1
                                                    ? Colors.white
                                                    : Colors.black87,
                                          ),
                                        ),
                                        const Spacer(),
                                        if (_selectedYear == entry.key + 1)
                                          const Icon(Icons.check_circle,
                                              color: Colors.white, size: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          const SizedBox(height: 8),
                          // Year dropdown hint
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  _selectedYear == null
                                      ? 'Choose your year of study'
                                      : '${_ordinal(_selectedYear!)} Year selected',
                                  style: TextStyle(
                                      color: _selectedYear == null
                                          ? Colors.grey
                                          : Colors.black87,
                                      fontSize: 14),
                                ),
                                const Spacer(),
                                const Icon(Icons.keyboard_arrow_down,
                                    color: Colors.grey),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // ── Timetable (shown after stream + year) ────────
                  if (_showTimetable) ...[
                    const SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                      child: Text(
                          '$_selectedStream — ${_ordinal(_selectedYear!)} Year Timetable',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),

                    // Day selector
                    SizedBox(
                      height: 48,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: _weekData.length,
                        itemBuilder: (_, i) {
                          final isSelected = _selectedDay == i;
                          return GestureDetector(
                            onTap: () =>
                                setState(() => _selectedDay = i),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color.fromARGB(255, 3, 59, 105)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 3, 59, 105)),
                              ),
                              child: Text(
                                _weekData[i]['day']
                                    .toString()
                                    .substring(0, 3),
                                style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : const Color.fromARGB(
                                            255, 3, 59, 105),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Text(
                          '${_weekData[_selectedDay]['day']} — ${(_weekData[_selectedDay]['slots'] as List).length} Classes',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ),

                    const SizedBox(height: 12),

                    ...(_weekData[_selectedDay]['slots']
                            as List<Map<String, dynamic>>)
                        .asMap()
                        .entries
                        .map((entry) {
                      final i = entry.key;
                      final slot = entry.value;
                      final color = _slotColors[i % _slotColors.length];
                      return Container(
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border:
                              Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 5,
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(slot['subject'],
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                  vertical: 4),
                                          decoration: BoxDecoration(
                                            color:
                                                color.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Text(slot['code'],
                                              style: TextStyle(
                                                  color: color,
                                                  fontSize: 11,
                                                  fontWeight:
                                                      FontWeight.bold)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Icon(Icons.access_time_outlined,
                                            size: 13,
                                            color: Colors.grey[500]),
                                        const SizedBox(width: 4),
                                        Text(slot['time'],
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 12)),
                                        const SizedBox(width: 10),
                                        Icon(Icons.room_outlined,
                                            size: 13,
                                            color: Colors.grey[500]),
                                        const SizedBox(width: 4),
                                        Text(slot['room'],
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 12)),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Icon(Icons.person_outline,
                                            size: 13,
                                            color: Colors.grey[500]),
                                        const SizedBox(width: 4),
                                        Text(slot['faculty'],
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 12)),
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
                  ],

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
