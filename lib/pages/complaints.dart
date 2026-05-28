import 'package:flutter/material.dart';
import '../components/header/header.dart';
import '../components/app_drawer.dart';

class ComplaintsPage extends StatelessWidget {
  const ComplaintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      drawer: const AppDrawer(activeRoute: 'complaints'),
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Bar (Title & Button)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Complaints',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                            Text('Report and track issues',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 15)),
                          ],
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add, size: 18, color: Colors.white),
                          label: const Text('New Complaint',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 25, 40, 95),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // AC Complaint Card
                    _buildComplaintCard(
                      icon: Icons.domain,
                      title: 'AC not working in Room 301',
                      time: '1/15/2024, 4:00:00 PM',
                      description:
                          'The air conditioning has stopped working since yesterday',
                      status: 'Open',
                      statusColor: const Color(0xFF22C55E), // green
                    ),

                    // Food quality Complaint Card
                    _buildComplaintCard(
                      icon: Icons.restaurant,
                      title: 'Food quality issue',
                      time: '1/14/2024, 2:30:00 PM',
                      description: 'The food served at lunch today was not fresh',
                      status: 'Resolved',
                      statusColor: Colors.white,
                      statusTextColor: Colors.black87,
                      hasBorder: true,
                      adminResponse:
                          'Issue has been addressed with the mess management team.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComplaintCard({
    required IconData icon,
    required String title,
    required String time,
    required String description,
    required String status,
    required Color statusColor,
    Color statusTextColor = Colors.white,
    bool hasBorder = false,
    String? adminResponse,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Colors.grey[700], size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(time,
                        style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(20),
                  border: hasBorder ? Border.all(color: Colors.grey.shade300) : null,
                ),
                child: Text(
                  status,
                  style: TextStyle(
                      color: statusTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(description,
              style: const TextStyle(fontSize: 15, color: Colors.black87)),
          if (adminResponse != null) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Admin Response:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(adminResponse,
                      style: TextStyle(color: Colors.grey[700], fontSize: 14)),
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }
}
