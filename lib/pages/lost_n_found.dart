import 'package:flutter/material.dart';
import '../components/header/header.dart';

final List<Map<String, dynamic>> _staticItems = [
  {
    'title': 'Blue Water Bottle',
    'description': 'Lost near library reading hall. Has a JKLU sticker on it.',
    'category': 'lost',
    'location': 'Library',
    'date': '2026-05-26',
    'contact': '+91 98765 11111',
    'color': Colors.red,
    'icon': Icons.water_drop_outlined,
    'image': 'https://picsum.photos/seed/bottle/200',
  },
  {
    'title': 'Scientific Calculator (Casio FX-991)',
    'description': 'Found in Lab 3, CSE Block. Please contact to claim.',
    'category': 'found',
    'location': 'CSE Lab 3',
    'date': '2026-05-25',
    'contact': '+91 98765 22222',
    'color': Colors.green,
    'icon': Icons.calculate_outlined,
    'image': 'https://picsum.photos/seed/calc/200',
  },
  {
    'title': 'Black Wallet',
    'description': 'Lost during lunch at the central mess. Contains ID card & some cash.',
    'category': 'lost',
    'location': 'Central Mess',
    'date': '2026-05-24',
    'contact': '+91 98765 33333',
    'color': Colors.red,
    'icon': Icons.account_balance_wallet_outlined,
    'image': 'https://picsum.photos/seed/wallet/200',
  },
  {
    'title': 'Wireless Earbuds (OnePlus)',
    'description': 'Found near basketball court. White case with initials "RK".',
    'category': 'found',
    'location': 'Sports Complex',
    'date': '2026-05-23',
    'contact': '+91 98765 44444',
    'color': Colors.green,
    'icon': Icons.headset_outlined,
    'image': 'https://picsum.photos/seed/earbuds/200',
  },
  {
    'title': 'Laptop Charger (HP 65W)',
    'description': 'Left in Academic Block A, Lecture Hall 2 after last class.',
    'category': 'lost',
    'location': 'Academic Block A, LH-2',
    'date': '2026-05-22',
    'contact': '+91 98765 55555',
    'color': Colors.red,
    'icon': Icons.power_outlined,
    'image': 'https://picsum.photos/seed/charger/200',
  },
  {
    'title': 'Student ID Card — Rahul Sharma (22BTECH001)',
    'description': 'Found at the hostel gate. Contact security to claim.',
    'category': 'found',
    'location': 'Boys Hostel Gate',
    'date': '2026-05-21',
    'contact': 'Security Office: +91 98765 43250',
    'color': Colors.green,
    'icon': Icons.badge_outlined,
    'image': 'https://picsum.photos/seed/idcard/200',
  },
  {
    'title': 'Blue Umbrella',
    'description': 'Lost near the admin block during rain. Has name tag inside.',
    'category': 'lost',
    'location': 'Admin Block',
    'date': '2026-05-20',
    'contact': '+91 98765 66666',
    'color': Colors.red,
    'icon': Icons.umbrella_outlined,
    'image': 'https://picsum.photos/seed/umbrella/200',
  },
  {
    'title': 'Textbook — Engineering Mathematics Vol 2',
    'description': 'Found in the library. Name: Priya written inside cover.',
    'category': 'found',
    'location': 'Library',
    'date': '2026-05-19',
    'contact': 'Library Desk: +91 98765 43230',
    'color': Colors.green,
    'icon': Icons.menu_book_outlined,
    'image': 'https://picsum.photos/seed/textbook/200',
  },
];

class LostNFound extends StatefulWidget {
  final bool isAdmin;
  const LostNFound({super.key, this.isAdmin = false});

  @override
  State<LostNFound> createState() => _LostNFoundState();
}

class _LostNFoundState extends State<LostNFound> {
  String filter = 'all'; // 'all', 'lost', 'found'

  List<Map<String, dynamic>> get filteredItems {
    if (filter == 'all') return _staticItems;
    return _staticItems.where((i) => i['category'] == filter).toList();
  }

  @override
  Widget build(BuildContext context) {
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
                      const Text(
                        'Back to Dashboard',
                        style: TextStyle(
                          color: Color.fromARGB(255, 3, 59, 105),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: Text(
                      'Lost & Found',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Text(
                      'Report and recover lost items on campus',
                      style: TextStyle(color: Colors.grey[600], fontSize: 15),
                    ),
                  ),

                  // Filter chips
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        _filterChip('All', 'all', Colors.blue),
                        const SizedBox(width: 10),
                        _filterChip('Lost', 'lost', Colors.red),
                        const SizedBox(width: 10),
                        _filterChip('Found', 'found', Colors.green),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Stats row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        _statBadge('Total', _staticItems.length.toString(), Colors.blue),
                        const SizedBox(width: 10),
                        _statBadge(
                            'Lost',
                            _staticItems
                                .where((i) => i['category'] == 'lost')
                                .length
                                .toString(),
                            Colors.red),
                        const SizedBox(width: 10),
                        _statBadge(
                            'Found',
                            _staticItems
                                .where((i) => i['category'] == 'found')
                                .length
                                .toString(),
                            Colors.green),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Items list
                  ...filteredItems.map((item) => _buildItemCard(item)),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filterChip(String label, String value, Color color) {
    final isSelected = filter == value;
    return GestureDetector(
      onTap: () => setState(() => filter = value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _statBadge(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Text(value,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: color)),
            Text(label,
                style: TextStyle(color: color.withOpacity(0.8), fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCard(Map<String, dynamic> item) {
    final isLost = item['category'] == 'lost';
    final color = item['color'] as Color;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (item['image'] != null)
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(13),
                topRight: Radius.circular(13),
              ),
              child: Image.network(
                item['image'],
                width: double.infinity,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(item['icon'] as IconData, color: color, size: 26),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item['title'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              isLost ? 'LOST' : 'FOUND',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(item['description'],
                          style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,
                              size: 14, color: Colors.grey[500]),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(item['location'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey[500], fontSize: 12)),
                          ),
                          const SizedBox(width: 12),
                          Icon(Icons.calendar_today_outlined,
                              size: 14, color: Colors.grey[500]),
                          const SizedBox(width: 4),
                          Text(item['date'],
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.phone_outlined,
                              size: 14, color: color),
                          const SizedBox(width: 4),
                          Text(item['contact'],
                              style: TextStyle(
                                  color: color,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
