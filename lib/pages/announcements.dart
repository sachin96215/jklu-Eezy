import 'package:flutter/material.dart';
import 'package:jklu_eezy/components/header/header.dart';
import 'package:jklu_eezy/components/user_components/announcements/block.dart';
import 'package:jklu_eezy/components/admin_components/announcment.dart';

// ── Static announcement data ──────────────────────────────────────────────────
final List<Map<String, dynamic>> _staticAnnouncements = [
  {
    'Title': 'Mid-Semester Examinations Schedule Released',
    'Subtitle': 'Academic Affairs',
    'Description':
        'The mid-semester examination schedule for all programmes has been released. '
            'Exams will be conducted from June 10–18, 2026. Students are advised to '
            'check the official portal and report any timetable clashes to their department coordinator.',
    'date': '2026-05-28',
    'time': '10:00 AM',
    'Category': 'Academic',
    'priority': 'high',
  },
  {
    'Title': 'Annual Sports Meet — Registration Open',
    'Subtitle': 'Sports Committee',
    'Description':
        'Registrations for the Annual Sports Meet 2026 are now open. Events include '
            'cricket, football, badminton, athletics, and chess. Register before June 5 '
            'through the sports committee office or the JKLU Eezy app.',
    'date': '2026-05-25',
    'time': '2:00 PM',
    'Category': 'Event',
    'priority': 'medium',
  },
  {
    'Title': 'Library Timing Change — Summer Schedule',
    'Subtitle': 'Library Administration',
    'Description':
        'Effective June 1, 2026, the central library will operate from 8:00 AM to '
            '8:00 PM on weekdays and 9:00 AM to 5:00 PM on Saturdays. '
            'The library will remain closed on Sundays during summer break.',
    'date': '2026-05-22',
    'time': '9:00 AM',
    'Category': 'Notice',
    'priority': 'low',
  },
  {
    'Title': 'Workshop: AI & Machine Learning Bootcamp',
    'Subtitle': 'CSE Department',
    'Description':
        'The CSE department is organising a 3-day intensive bootcamp on Artificial '
            'Intelligence and Machine Learning from June 12–14, 2026. '
            'Industry experts from top tech companies will conduct hands-on sessions. '
            'Limited seats — register now at the CSE department office.',
    'date': '2026-05-20',
    'time': '11:00 AM',
    'Category': 'Workshop',
    'priority': 'medium',
  },
  {
    'Title': 'Hostel Fee Payment Deadline',
    'Subtitle': 'Hostel Administration',
    'Description':
        'All students residing in university hostels are reminded that the hostel fee '
            'for the upcoming semester must be paid by June 15, 2026. '
            'Late payments will attract a penalty of ₹500 per week. '
            'Contact the accounts office for payment details.',
    'date': '2026-05-18',
    'time': '3:00 PM',
    'Category': 'Finance',
    'priority': 'high',
  },
  {
    'Title': 'Campus Wi-Fi Upgrade — Scheduled Downtime',
    'Subtitle': 'IT Department',
    'Description':
        'The IT department will be upgrading the campus Wi-Fi infrastructure on '
            'June 2, 2026, from 12:00 AM to 6:00 AM. Internet services will be '
            'unavailable during this period. Plan your work accordingly.',
    'date': '2026-05-15',
    'time': '5:00 PM',
    'Category': 'Infrastructure',
    'priority': 'low',
  },
];

class Announcements extends StatefulWidget {
  final bool isAdmin;
  const Announcements({super.key, this.isAdmin = false});

  @override
  State<Announcements> createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  late List<Map<String, dynamic>> announcements;

  @override
  void initState() {
    super.initState();
    announcements = List.from(_staticAnnouncements);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(249, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back & Add row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const BackButton(
                            color: Color.fromARGB(255, 3, 59, 105),
                          ),
                          const Flexible(
                            child: Text(
                              'Back to Dashboard',
                              style: TextStyle(
                                color: Color.fromARGB(255, 3, 59, 105),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Spacer(),
                          if (widget.isAdmin)
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const Announcement(),
                                    ),
                                  ).then((_) => setState(() {}));
                                },
                                icon: const Icon(Icons.add,
                                    color: Colors.white),
                                label: const Text(
                                  'Add Announcement',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 3, 59, 105),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        'Announcements',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Stay updated with latest campus news',
                        style: TextStyle(
                            fontSize: 17, color: Colors.black54),
                      ),
                      const SizedBox(height: 20),

                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: announcements.length,
                        itemBuilder: (context, index) {
                          final ann = announcements[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: AnnouncementCard(
                              title: ann['Title'] ?? 'Untitled',
                              subtitle: ann['Subtitle'] ?? 'General',
                              description: ann['Description'] ?? '',
                              date: ann['date'] ?? '',
                              time: ann['time'] ?? '',
                              category: ann['Category'] ?? 'General',
                              priority: ann['priority'] ?? 'low',
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
