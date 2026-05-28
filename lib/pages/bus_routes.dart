import 'package:flutter/material.dart';
import '../components/header/header.dart';
import '../components/app_drawer.dart';

class BusRoutesPage extends StatelessWidget {
  const BusRoutesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      drawer: const AppDrawer(activeRoute: 'bus'),
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
                    // Top Bar
                    const Text('Bus Routes',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Text('Campus transportation schedules and\ninformation',
                        style: TextStyle(
                            color: Colors.grey[600], fontSize: 15, height: 1.3)),
                    const SizedBox(height: 24),

                    // Tabs
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text('Day Scholar Shuttle',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: Text('Hostler Buses',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Header for List
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Day Scholar Shuttle\nBuses',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                height: 1.2)),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: const Text('Daily\nService',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Bus Cards
                    _buildBusCard(
                      busNumber: 'DS-001',
                      routeTitle: 'Jaipur Central → JKLU',
                      price: '₹15 per day',
                      priceColor: const Color(0xFF22C55E),
                      timing: '7:30 AM - 8:00 AM',
                      driver: 'Ramesh Kumar',
                      contact: '+91 9876543210',
                      capacity: '40 seats',
                      stops: ['Jaipur Central', 'MI Road', 'C-Scheme'],
                    ),
                    _buildBusCard(
                      busNumber: 'DS-002',
                      routeTitle: 'Mansarovar → JKLU',
                      price: '₹12 per day',
                      priceColor: const Color(0xFF22C55E),
                      timing: '7:45 AM - 8:15 AM',
                      driver: 'Suresh Singh',
                      contact: '+91 9876543211',
                      capacity: '40 seats',
                      stops: [
                        'Mansarovar',
                        'JLN Marg',
                        'Transport Nagar',
                        'Shipra Path',
                        'JKLU'
                      ],
                      highlightLastStop: true,
                    ),
                    _buildBusCard(
                      busNumber: 'DS-003',
                      routeTitle: 'Vaishali Nagar → JKLU',
                      price: '₹18 per day',
                      priceColor: const Color(0xFF22C55E),
                      timing: '7:40 AM - 8:10 AM',
                      driver: 'Mohan Lal',
                      contact: '+91 9876543212',
                      capacity: '40 seats',
                      stops: ['Vaishali Nagar', 'Ajmer Road', 'JKLU'],
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

  Widget _buildBusCard({
    required String busNumber,
    required String routeTitle,
    required String price,
    required Color priceColor,
    required String timing,
    required String driver,
    required String contact,
    required String capacity,
    required List<String> stops,
    bool highlightLastStop = false,
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
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E7FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.directions_bus_outlined,
                    color: Color(0xFF4F46E5), size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(busNumber,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(routeTitle,
                        style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: priceColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  price,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildInfoRow(Icons.access_time, 'Timing:', timing),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.person_outline, 'Driver:', driver),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.phone_outlined, 'Contact:', contact,
              valueColor: const Color.fromARGB(255, 25, 40, 95)),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.airline_seat_recline_normal, 'Capacity:', capacity),
          const SizedBox(height: 24),
          Row(
            children: [
              Icon(Icons.route_outlined, size: 20, color: Colors.grey[600]),
              const SizedBox(width: 12),
              const Text('Route Stops:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: stops.asMap().entries.map((entry) {
                final isFirst = entry.key == 0;
                final isLast = entry.key == stops.length - 1;
                final isHighlightedLast = isLast && highlightLastStop;

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isFirst
                                ? Colors.green
                                : isHighlightedLast
                                    ? Colors.red
                                    : Colors.grey[400],
                          ),
                        ),
                        if (!isLast)
                          Container(
                            width: 2,
                            height: 24,
                            color: Colors.grey[300],
                          ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Text(entry.value,
                        style: TextStyle(
                            fontSize: 14,
                            color: isFirst || isLast
                                ? Colors.black87
                                : Colors.grey[700])),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value,
      {Color? valueColor}) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 12),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        const SizedBox(width: 8),
        Text(value,
            style: TextStyle(
                fontSize: 15, color: valueColor ?? Colors.black87)),
      ],
    );
  }
}
