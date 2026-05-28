import 'package:flutter/material.dart';
import 'package:jklu_eezy/components/header/header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jklu_eezy/components/user_components/home/service_bloc.dart';
import 'package:jklu_eezy/pages/announcements.dart';
import 'package:jklu_eezy/pages/contact_directory.dart';
import 'package:jklu_eezy/pages/mess.dart';
import 'package:jklu_eezy/pages/quick_actions.dart';
import 'package:jklu_eezy/pages/lost_n_found.dart';
import 'package:jklu_eezy/pages/time_table.dart';
import 'package:jklu_eezy/pages/study_materials.dart';
import 'package:jklu_eezy/pages/bus_routes.dart';
import 'package:jklu_eezy/pages/laundry.dart';
import 'package:jklu_eezy/pages/complaints.dart';
import 'package:jklu_eezy/components/app_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(249, 255, 255, 255),
      drawer: const AppDrawer(activeRoute: 'dashboard'),
      body: Column(
        children: [
          // ✅ Header stays fixed
          const Header(),

          // ✅ Everything else scrolls
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // ✅ Welcome Card
                  ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 300.0),
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 3, 33, 85),
                            Color.fromARGB(255, 10, 231, 128)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left Icon Box
                              Container(
                                padding: const EdgeInsets.all(12),
                                margin: const EdgeInsets.only(top: 30),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF466892),
                                      Color(0xFF5C859F)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.graduationCap,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Welcome to ',
                                            style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'JKLU Eezy',
                                            style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Your complete campus companion',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'Access all campus services, contact information, '
                            'mess management, study materials, and more in one unified '
                            'platform designed for JKLU students.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ✅ Stats Grid
                  GridView.count(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 30),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    childAspectRatio: 1.5,
                    children: [
                      _buildStatCard('150+', 'Faculty Members'),
                      _buildStatCardWithIcon(
                          '4.2', 'Mess Rating', Icons.star, Colors.green),
                      _buildStatCard('50+', 'Study Resources'),
                      _buildStatCard('24/7', 'Support'),
                    ],
                  ),

                  // ✅ Services
                  ServiceBloc(
                    title: 'Contact Directory',
                    description: 'Faculty, staff, and service contact',
                    icon: Icons.contacts_outlined,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ContactDirectory(isAdmin: true)),
                      );
                    },
                  ),
                  ServiceBloc(
                    title: 'Announcements',
                    description: 'Latest news and updates',
                    icon: Icons.announcement_outlined,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Announcements(isAdmin: true)),
                      );
                    },
                  ),
                  ServiceBloc(
                    title: 'Mess Management',
                    description: 'Menu, timings, and meal tickets',
                    icon: Icons.restaurant_menu_outlined,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MessManagementPage(isAdmin: true)),
                      );
                    },
                  ),
                  ServiceBloc(
                    title: 'Study Materials',
                    description: 'Papers, e-books, and resources',
                    icon: Icons.menu_book_outlined,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const StudyMaterialsPage()));
                    },
                  ),
                  ServiceBloc(
                    title: 'Lost & Found',
                    description: 'Report and recover items',
                    icon: Icons.search,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const LostNFound(isAdmin: true)),
                      );
                    },
                  ),
                  ServiceBloc(
                    title: 'Class Timetable',
                    description: 'Your academic schedule',
                    icon: Icons.calendar_month_outlined,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const TimeTablePage(isAdmin: true)),
                      );
                    },
                  ),
                  ServiceBloc(
                    title: 'Bus Routes',
                    description: 'Transport schedules',
                    icon: Icons.directions_bus_outlined,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BusRoutesPage()));
                    },
                  ),
                  ServiceBloc(
                    title: 'Laundry',
                    description: 'Get notified when clothes are ready',
                    icon: Icons.local_laundry_service_outlined,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LaundryPage()));
                    },
                  ),
                  ServiceBloc(
                    title: 'Complaints',
                    description: 'Lodge complaints regarding campus issues',
                    icon: Icons.report_problem_outlined,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ComplaintsPage()));
                    },
                  ),
                  ServiceBloc(
                    title: 'Quick Actions',
                    description: 'Emergency contacts & services',
                    icon: Icons.notifications_outlined,
                    gradiant: true,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuickActions()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value,
              style: const TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(label,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildStatCardWithIcon(
      String value, String label, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value,
                  style: TextStyle(
                      fontSize: 25, color: color, fontWeight: FontWeight.bold)),
              const SizedBox(width: 5),
              Icon(icon, color: color, size: 20),
            ],
          ),
          const SizedBox(height: 5),
          Text(label,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}