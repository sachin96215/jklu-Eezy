import 'package:flutter/material.dart';
import '../components/header/header.dart';

class MessManagementPage extends StatefulWidget {
  final bool isAdmin;
  const MessManagementPage({super.key, this.isAdmin = false});

  @override
  State<MessManagementPage> createState() => _MessManagementPageState();
}

class _MessManagementPageState extends State<MessManagementPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> days = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
  ];

  final Map<String, Map<String, List<String>>> weeklyMenu = {
    'Monday': {
      'Breakfast': ['Aloo Paratha', 'Curd', 'Pickle', 'Tea/Coffee', 'Milk'],
      'Lunch': ['Dal Tadka', 'Jeera Rice', 'Roti', 'Mix Veg', 'Salad', 'Buttermilk'],
      'Snacks': ['Samosa (2)', 'Chai', 'Biscuits'],
      'Dinner': ['Rajma', 'Rice', 'Roti', 'Boondi Raita', 'Gulab Jamun'],
    },
    'Tuesday': {
      'Breakfast': ['Poha', 'Boiled Egg / Banana', 'Tea/Coffee', 'Milk'],
      'Lunch': ['Chole', 'Bhature', 'Roti', 'Onion Salad', 'Sweet Lassi'],
      'Snacks': ['Bread Pakoda', 'Chai'],
      'Dinner': ['Paneer Butter Masala', 'Naan', 'Dal Fry', 'Rice', 'Pickle'],
    },
    'Wednesday': {
      'Breakfast': ['Idli (3)', 'Sambhar', 'Coconut Chutney', 'Tea/Coffee'],
      'Lunch': ['Kadhi Pakoda', 'Rice', 'Roti', 'Aloo Gobi', 'Salad'],
      'Snacks': ['Vada Pav', 'Chai'],
      'Dinner': ['Dal Makhani', 'Jeera Rice', 'Roti', 'Baingan Bharta', 'Ice Cream'],
    },
    'Thursday': {
      'Breakfast': ['Puri (3)', 'Aloo Sabzi', 'Pickle', 'Tea/Coffee', 'Milk'],
      'Lunch': ['Matar Paneer', 'Rice', 'Roti', 'Dal', 'Chaach'],
      'Snacks': ['Pakoda', 'Chai'],
      'Dinner': ['Chicken Curry / Soya Curry', 'Rice', 'Roti', 'Raita', 'Kheer'],
    },
    'Friday': {
      'Breakfast': ['Upma', 'Coconut Chutney', 'Boiled Egg', 'Tea/Coffee'],
      'Lunch': ['Palak Paneer', 'Jeera Rice', 'Roti', 'Dal', 'Salad', 'Buttermilk'],
      'Snacks': ['Pav Bhaji', 'Chai'],
      'Dinner': ['Aloo Matar', 'Rice', 'Roti', 'Boondi Raita', 'Halwa'],
    },
    'Saturday': {
      'Breakfast': ['Dosa (2)', 'Sambhar', 'Chutney', 'Tea/Coffee', 'Milk'],
      'Lunch': ['Biryani (Veg/Non-Veg)', 'Raita', 'Salad', 'Papad', 'Cold Drink'],
      'Snacks': ['Maggi', 'Chai'],
      'Dinner': ['Paneer Tikka Masala', 'Naan', 'Dal', 'Rice', 'Gulab Jamun'],
    },
    'Sunday': {
      'Breakfast': ['Chole Bhature', 'Pickle', 'Tea/Coffee', 'Fruit'],
      'Lunch': ['Special Thali — Dal, Rice, 2 Sabzi, Roti, Pickle, Raita, Sweet'],
      'Snacks': ['Snack Box', 'Juice'],
      'Dinner': ['Pav Bhaji', 'Rice', 'Dal', 'Roti', 'Ice Cream'],
    },
  };

  final List<Map<String, dynamic>> mealTimings = [
    {'meal': 'Breakfast', 'time': '7:30 AM – 9:30 AM', 'icon': Icons.wb_sunny_outlined, 'color': Colors.orange},
    {'meal': 'Lunch', 'time': '12:30 PM – 2:30 PM', 'icon': Icons.lunch_dining_outlined, 'color': Colors.green},
    {'meal': 'Snacks', 'time': '5:00 PM – 6:00 PM', 'icon': Icons.coffee_outlined, 'color': Colors.brown},
    {'meal': 'Dinner', 'time': '7:30 PM – 9:30 PM', 'icon': Icons.nightlight_outlined, 'color': Colors.indigo},
  ];

  int selectedDay = DateTime.now().weekday - 1; // 0 = Monday

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this, initialIndex: selectedDay);
    _tabController.addListener(() => setState(() => selectedDay = _tabController.index));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final day = days[selectedDay];
    final menu = weeklyMenu[day]!;

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
                  // Back
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
                      'Mess Management',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Text(
                      'Weekly menu, timings, and meal info',
                      style: TextStyle(color: Colors.grey[600], fontSize: 15),
                    ),
                  ),

                  // Meal Timings
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '⏰  Meal Timings',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        ...mealTimings.map((m) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: (m['color'] as Color).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(m['icon'] as IconData,
                                        color: m['color'] as Color, size: 22),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(m['meal'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(m['time'],
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 13)),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Day tabs
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: const Color.fromARGB(255, 3, 59, 105),
                    indicator: BoxDecoration(
                      color: const Color.fromARGB(255, 3, 59, 105),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    tabs: days
                        .map((d) => Tab(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(d.substring(0, 3)),
                              ),
                            ))
                        .toList(),
                  ),

                  const SizedBox(height: 16),

                  // Menu for selected day
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "$day's Menu",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 12),

                  ...menu.entries.map((entry) => _buildMealCard(entry.key, entry.value)),

                  const SizedBox(height: 24),

                  // Mess Rating
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color.fromARGB(255, 3, 33, 85), Color.fromARGB(255, 10, 180, 128)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 40),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Average Mess Rating',
                                style: TextStyle(color: Colors.white70, fontSize: 14)),
                            Text('4.2 / 5.0',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const Spacer(),
                        const Text('⭐⭐⭐⭐',
                            style: TextStyle(fontSize: 22)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealCard(String meal, List<String> items) {
    final Map<String, Color> mealColors = {
      'Breakfast': Colors.orange,
      'Lunch': Colors.green,
      'Snacks': Colors.brown,
      'Dinner': Colors.indigo,
    };
    final color = mealColors[meal] ?? Colors.blue;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.restaurant_outlined, color: color, size: 20),
                const SizedBox(width: 8),
                Text(meal,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: color,
                        fontSize: 16)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: items
                  .map((item) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: color.withOpacity(0.3)),
                        ),
                        child: Text(item,
                            style: TextStyle(
                                color: color.withOpacity(0.9),
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
