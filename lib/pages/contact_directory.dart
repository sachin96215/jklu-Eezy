import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jklu_eezy/components/admin_components/add_contact.dart';
import 'package:jklu_eezy/components/user_components/contact_directory/contact_block.dart';
import '../components/header/header.dart';

// ── Static contact data ────────────────────────────────────────────────────────
final List<Map<String, dynamic>> _staticContacts = [
  {
    'role': 'faculty',
    'name': 'Dr. Rajesh Kumar',
    'position': 'Professor & Head of Department',
    'department': 'Computer Science & Engineering',
    'phone': '+91 98765 43210',
    'email': 'rajesh.kumar@jklu.edu.in',
    'location': 'Academic Block A, Room 201',
  },
  {
    'role': 'faculty',
    'name': 'Dr. Priya Sharma',
    'position': 'Associate Professor',
    'department': 'Electronics & Communication',
    'phone': '+91 98765 43211',
    'email': 'priya.sharma@jklu.edu.in',
    'location': 'Academic Block B, Room 105',
  },
  {
    'role': 'faculty',
    'name': 'Prof. Anil Mehta',
    'position': 'Assistant Professor',
    'department': 'Mechanical Engineering',
    'phone': '+91 98765 43212',
    'email': 'anil.mehta@jklu.edu.in',
    'location': 'Workshop Block, Room 301',
  },
  {
    'role': 'admin',
    'name': 'Mrs. Sunita Verma',
    'position': 'Registrar',
    'department': 'Administrative Office',
    'phone': '+91 98765 43220',
    'email': 'registrar@jklu.edu.in',
    'location': 'Admin Block, Ground Floor',
  },
  {
    'role': 'admin',
    'name': 'Mr. Deepak Joshi',
    'position': 'Examination Controller',
    'department': 'Examination Cell',
    'phone': '+91 98765 43221',
    'email': 'exam.controller@jklu.edu.in',
    'location': 'Admin Block, Room 102',
  },
  {
    'role': 'health',
    'name': 'Dr. Kavita Singh',
    'position': 'Chief Medical Officer',
    'department': 'Campus Health Centre',
    'phone': '+91 98765 43230',
    'email': 'health@jklu.edu.in',
    'location': 'Health Centre, Near Gate 2',
  },
  {
    'role': 'health',
    'name': 'Dr. Ramesh Gupta',
    'position': 'General Physician',
    'department': 'Campus Health Centre',
    'phone': '+91 98765 43231',
    'email': 'dr.gupta@jklu.edu.in',
    'location': 'Health Centre, Room 3',
  },
  {
    'role': 'mess',
    'name': 'Mr. Suresh Yadav',
    'position': 'Mess Manager',
    'department': 'Mess & Canteen Services',
    'phone': '+91 98765 43240',
    'email': 'mess@jklu.edu.in',
    'location': 'Central Mess, Ground Floor',
  },
  {
    'role': 'security',
    'name': 'Mr. Rajendra Singh',
    'position': 'Head of Security',
    'department': 'Campus Security',
    'phone': '+91 98765 43250',
    'email': 'security@jklu.edu.in',
    'location': 'Main Gate Security Office',
  },
  {
    'role': 'hostel',
    'name': 'Dr. Meena Patel',
    'position': 'Chief Warden',
    'department': 'Hostel Administration',
    'phone': '+91 98765 43260',
    'email': 'hostel@jklu.edu.in',
    'location': 'Hostel Block A, Warden Office',
  },
  {
    'role': 'hostel',
    'name': 'Mr. Vikram Rathore',
    'position': 'Boys Hostel Warden',
    'department': 'Hostel Administration',
    'phone': '+91 98765 43261',
    'email': 'bh.warden@jklu.edu.in',
    'location': 'Boys Hostel Block B',
  },
  {
    'role': 'staff',
    'name': 'Mr. Harish Chandra',
    'position': 'IT Support Manager',
    'department': 'Information Technology',
    'phone': '+91 98765 43270',
    'email': 'it.support@jklu.edu.in',
    'location': 'Computer Centre, Room 001',
  },
];

class ContactDirectory extends StatefulWidget {
  final bool isAdmin;
  const ContactDirectory({super.key, this.isAdmin = false});

  @override
  State<ContactDirectory> createState() => _ContactDirectoryState();
}

class _ContactDirectoryState extends State<ContactDirectory> {
  List<Map<String, dynamic>> contacts = List.from(_staticContacts);
  List<Map<String, dynamic>> filteredContacts = List.from(_staticContacts);
  final TextEditingController searchController = TextEditingController();
  Timer? debounce;

  void _runSearch(String query) {
    if (debounce?.isActive ?? false) debounce!.cancel();
    debounce = Timer(const Duration(milliseconds: 300), () {
      final lowerQuery = query.toLowerCase();
      setState(() {
        filteredContacts = contacts.where((c) {
          final name = c['name']?.toLowerCase() ?? '';
          final role = c['role']?.toLowerCase() ?? '';
          final position = c['position']?.toLowerCase() ?? '';
          final department = c['department']?.toLowerCase() ?? '';
          final phone = c['phone']?.toLowerCase() ?? '';
          return name.contains(lowerQuery) ||
              role.contains(lowerQuery) ||
              position.contains(lowerQuery) ||
              department.contains(lowerQuery) ||
              phone.contains(lowerQuery);
        }).toList();
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10),
                    const BackButton(
                        color: Color.fromARGB(255, 3, 59, 105)),
                    const SizedBox(width: 5),
                    const Text(
                      'Back to Dashboard',
                      style: TextStyle(
                        color: Color.fromARGB(255, 3, 59, 105),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
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
                                  builder: (context) => const AddContact()),
                            ).then((_) => setState(() {}));
                          },
                          icon: const Icon(Icons.add, color: Colors.white),
                          label: const Text('Add Contact',
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 3, 59, 105),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Contact Directory',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Find contact information for faculty and staff',
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.search, color: Colors.black54),
                      suffixIcon: searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                searchController.clear();
                                setState(() {
                                  filteredContacts =
                                      List.from(contacts);
                                });
                              },
                            )
                          : null,
                      hintText:
                          'Search by name, department, or designation',
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Colors.grey.shade300, width: 1.0),
                      ),
                    ),
                    onChanged: _runSearch,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: filteredContacts.length,
                    itemBuilder: (context, index) {
                      final contact = filteredContacts[index];
                      return ContactBlock(
                        role: contact['role'] ?? '',
                        name: contact['name'] ?? '',
                        position: contact['position'] ?? '',
                        department: contact['department'] ?? '',
                        phone: contact['phone'] ?? '',
                        email: contact['email'] ?? '',
                        location: contact['location'] ?? '',
                      );
                    },
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