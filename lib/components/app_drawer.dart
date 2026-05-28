import 'package:flutter/material.dart';
import 'package:jklu_eezy/pages/home.dart';
import 'package:jklu_eezy/pages/contact_directory.dart';
import 'package:jklu_eezy/pages/announcements.dart';
import 'package:jklu_eezy/pages/mess.dart';
import 'package:jklu_eezy/pages/study_materials.dart';
import 'package:jklu_eezy/pages/lost_n_found.dart';
import 'package:jklu_eezy/pages/time_table.dart';
import 'package:jklu_eezy/pages/quick_actions.dart';
import 'package:jklu_eezy/pages/bus_routes.dart';
import 'package:jklu_eezy/pages/laundry.dart';
import 'package:jklu_eezy/pages/complaints.dart';

class AppDrawer extends StatelessWidget {
  final String activeRoute;
  const AppDrawer({super.key, this.activeRoute = 'dashboard'});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── User Header ──────────────────────────────────────────
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'AS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 3, 59, 105),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Admin',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text('JKLU Admin',
                          style: TextStyle(
                            color: Color.fromARGB(255, 3, 59, 105),
                            fontSize: 13,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),

          // ── Nav Items ────────────────────────────────────────────
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _item(
                  context,
                  Icons.home_outlined,
                  'Dashboard',
                  'dashboard',
                  () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const Home()));
                  },
                ),
                _item(
                  context,
                  Icons.contacts_outlined,
                  'Contact Directory',
                  'contact',
                  () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const ContactDirectory(isAdmin: true)));
                  },
                ),
                _item(
                  context,
                  Icons.announcement_outlined,
                  'Announcements',
                  'announcements',
                  () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const Announcements(isAdmin: true)));
                  },
                ),
                _item(
                  context,
                  Icons.restaurant_menu_outlined,
                  'Mess Management',
                  'mess',
                  () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const MessManagementPage(isAdmin: true)));
                  },
                ),
                _item(
                  context,
                  Icons.menu_book_outlined,
                  'Study Materials',
                  'study',
                  () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const StudyMaterialsPage()));
                  },
                ),
                _item(
                  context,
                  Icons.search,
                  'Lost & Found',
                  'lost',
                  () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const LostNFound(isAdmin: true)));
                  },
                ),
                _item(
                  context,
                  Icons.calendar_month_outlined,
                  'Class Timetable',
                  'timetable',
                  () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const TimeTablePage(isAdmin: true)));
                  },
                ),
                _item(
                  context,
                  Icons.directions_bus_outlined,
                  'Bus Routes',
                  'bus',
                  () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const BusRoutesPage()));
                  },
                ),
                _item(
                  context,
                  Icons.local_laundry_service_outlined,
                  'Laundry',
                  'laundry',
                  () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const LaundryPage()));
                  },
                ),
                _item(
                  context,
                  Icons.report_problem_outlined,
                  'Complaints',
                  'complaints',
                  () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ComplaintsPage()));
                  },
                ),
                _item(
                  context,
                  Icons.notifications_outlined,
                  'Quick Actions',
                  'quick',
                  () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const QuickActions()));
                  },
                ),
              ],
            ),
          ),

          // ── Footer ───────────────────────────────────────────────
          const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
          _item(context, Icons.info_outline, 'About', 'about',
              () => Navigator.pop(context)),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 6, 20, 24),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Made with ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 3, 59, 105), fontSize: 13),
                  ),
                  TextSpan(text: '❤️', style: TextStyle(fontSize: 13)),
                  TextSpan(
                    text: ' by Sharad and Sachin',
                    style: TextStyle(
                      color: Color.fromARGB(255, 3, 59, 105),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, IconData icon, String label, String route,
      VoidCallback onTap) {
    final isActive = activeRoute == route;
    return InkWell(
      onTap: onTap,
      child: Container(
        color: isActive ? Colors.grey[100] : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        child: Row(
          children: [
            Icon(icon,
                color: isActive
                    ? const Color.fromARGB(255, 3, 59, 105)
                    : Colors.black87,
                size: 22),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                fontWeight:
                    isActive ? FontWeight.bold : FontWeight.normal,
                color: isActive
                    ? const Color.fromARGB(255, 3, 59, 105)
                    : Colors.black87,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
