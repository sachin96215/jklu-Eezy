import 'package:flutter/material.dart';
import '../header/header.dart';

class Announcement extends StatefulWidget {
  const Announcement({super.key});

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final descriptionController = TextEditingController();
  String selectedCategory = 'Academic';
  String selectedPriority = 'medium';
  bool isLoading = false;

  final List<String> categories = [
    'Academic', 'Event', 'Notice', 'Workshop', 'Finance', 'Infrastructure'
  ];
  final List<String> priorities = ['high', 'medium', 'low'];

  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() => isLoading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Announcement added successfully! (Demo mode)'),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios_new,
                                color: Colors.blueAccent),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const Text('Back to Announcements',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Center(
                        child: Text('Add New Announcement',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 25),

                      _buildTextField(titleController, 'Title *', Icons.title),
                      const SizedBox(height: 15),
                      _buildTextField(subtitleController, 'Subtitle / Department', Icons.subtitles_outlined),
                      const SizedBox(height: 15),
                      _buildTextField(descriptionController, 'Description *', Icons.description_outlined, maxLines: 4),
                      const SizedBox(height: 15),

                      // Category dropdown
                      DropdownButtonFormField<String>(
                        value: selectedCategory,
                        decoration: _inputDecoration('Category', Icons.category_outlined),
                        items: categories
                            .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                            .toList(),
                        onChanged: (v) => setState(() => selectedCategory = v!),
                      ),
                      const SizedBox(height: 15),

                      // Priority dropdown
                      DropdownButtonFormField<String>(
                        value: selectedPriority,
                        decoration: _inputDecoration('Priority', Icons.flag_outlined),
                        items: priorities
                            .map((p) => DropdownMenuItem(value: p, child: Text(p.toUpperCase())))
                            .toList(),
                        onChanged: (v) => setState(() => selectedPriority = v!),
                      ),
                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: isLoading ? null : _submit,
                          icon: const Icon(Icons.send, color: Colors.white),
                          label: Text(
                            isLoading ? 'Publishing...' : 'Publish Announcement',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController c, String label, IconData icon,
      {int maxLines = 1}) {
    return TextField(
      controller: c,
      maxLines: maxLines,
      decoration: _inputDecoration(label, icon),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.blueAccent),
      labelText: label,
      filled: true,
      fillColor: Colors.grey[50],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blueAccent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
      ),
    );
  }
}
