import 'package:flutter/material.dart';
import '../components/header/header.dart';
import '../components/app_drawer.dart';

class LaundryPage extends StatelessWidget {
  const LaundryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      drawer: const AppDrawer(activeRoute: 'laundry'),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Laundry\nService',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      height: 1.1)),
                              const SizedBox(height: 4),
                              Text('Manage your laundry\nrequests',
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 15,
                                      height: 1.3)),
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add, size: 18, color: Colors.white),
                          label: const Text('New Request',
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

                    // LC001 Pending Card
                    _buildLaundryCard(
                      title: 'Card: LC001',
                      time: '1/15/2024, 4:00:00 PM',
                      status: 'Pending',
                      statusColor: const Color(0xFF22C55E),
                    ),

                    // LC002 Ready Card
                    _buildLaundryCard(
                      title: 'Card: LC002',
                      time: '1/14/2024, 2:30:00 PM',
                      status: 'Ready',
                      statusColor: const Color.fromARGB(255, 25, 40, 95),
                      weight: '5.5 kg',
                      items: '12 pieces',
                      showPickupButton: true,
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

  Widget _buildLaundryCard({
    required String title,
    required String time,
    required String status,
    required Color statusColor,
    String? weight,
    String? items,
    bool showPickupButton = false,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Requested: $time',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          if (weight != null || items != null) ...[
            const SizedBox(height: 24),
            Row(
              children: [
                Text('Weight:',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                const SizedBox(width: 8),
                Text(weight ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('Items:',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                const SizedBox(width: 14),
                Text(items ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
              ],
            ),
          ],
          if (showPickupButton) ...[
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 25, 40, 95),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
              ),
              child: const Text('Request Pickup',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ]
        ],
      ),
    );
  }
}
