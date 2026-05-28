import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as ul;
import '../components/header/header.dart';
import '../components/app_drawer.dart';

// ── Data Models ──────────────────────────────────────────────────────────────
class SubjectInfo {
  final String name;
  final int books;
  final int papers;
  SubjectInfo(this.name, this.books, this.papers);
}

class StreamInfo {
  final String name;
  final int years;
  final Color color;
  final List<SubjectInfo> subjects;
  StreamInfo(
      {required this.name,
      required this.years,
      required this.color,
      required this.subjects});
}

final List<StreamInfo> _streams = [
  StreamInfo(
    name: 'B.Tech',
    years: 4,
    color: const Color(0xFF2563EB),
    subjects: [
      SubjectInfo('Computer Science', 8, 15),
      SubjectInfo('Electronics', 6, 12),
      SubjectInfo('Mechanical', 5, 10),
    ],
  ),
  StreamInfo(
    name: 'BBA',
    years: 3,
    color: const Color(0xFF16A34A),
    subjects: [
      SubjectInfo('Marketing', 6, 8),
      SubjectInfo('Finance', 5, 7),
      SubjectInfo('HR Management', 4, 6),
    ],
  ),
  StreamInfo(
    name: 'MBA',
    years: 2,
    color: const Color(0xFF7C3AED),
    subjects: [
      SubjectInfo('Business Strategy', 7, 9),
      SubjectInfo('Operations', 5, 8),
      SubjectInfo('Analytics', 6, 7),
    ],
  ),
  StreamInfo(
    name: 'B.Des',
    years: 4,
    color: const Color(0xFFEA580C),
    subjects: [
      SubjectInfo('Graphic Design', 8, 4),
      SubjectInfo('UI/UX Design', 6, 3),
      SubjectInfo('Product Design', 5, 2),
    ],
  ),
];

// ── Page ─────────────────────────────────────────────────────────────────────
class StudyMaterialsPage extends StatefulWidget {
  const StudyMaterialsPage({super.key});

  @override
  State<StudyMaterialsPage> createState() => _StudyMaterialsPageState();
}

class _StudyMaterialsPageState extends State<StudyMaterialsPage>
    with SingleTickerProviderStateMixin {
  StreamInfo? _selectedStream;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _openPortal() async {
    final uri = Uri.parse('https://jklu.edu.in/campus-life/facilities/lrc');
    try {
      await ul.launchUrl(uri, mode: ul.LaunchMode.externalApplication);
    } catch (_) {
      // fallback
      await ul.launchUrl(uri, mode: ul.LaunchMode.platformDefault);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      drawer: const AppDrawer(activeRoute: 'study'),
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new,
                              color: Color.fromARGB(255, 3, 59, 105),
                              size: 18),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Text('Back to Dashboard',
                            style: TextStyle(
                              color: Color.fromARGB(255, 3, 59, 105),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),

                    const SizedBox(height: 4),
                    const Text('Study Materials',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Access books, papers, and learning resources',
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 15)),

                    const SizedBox(height: 20),

                    // ── MyCog Portal Card ─────────────────────────
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEF2FF),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                            color: const Color(0xFFCDD5FF), width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: const Icon(Icons.open_in_new,
                                    color:
                                        Color.fromARGB(255, 3, 59, 105),
                                    size: 26),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: const [
                                    Text('MyCog Learning Portal',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    SizedBox(height: 2),
                                    Text(
                                        'Access the official JKLU learning\nmanagement system',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                            height: 1.4)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Access your courses, assignments, grades, and digital resources through the official MyCog portal.',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                height: 1.5),
                          ),
                          const SizedBox(height: 18),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: _openPortal,
                              icon: const Icon(Icons.open_in_new,
                                  color: Colors.white, size: 18),
                              label: const Text('Open MyCog Portal',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 3, 33, 85),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                elevation: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ── Browse by Stream ──────────────────────────
                    const Text('Browse by Stream',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.25,
                      ),
                      itemCount: _streams.length,
                      itemBuilder: (_, i) => _buildStreamCard(_streams[i]),
                    ),

                    // ── Resources Section (shown after selection) ─
                    if (_selectedStream != null) ...[
                      const SizedBox(height: 28),
                      Text('${_selectedStream!.name} Resources',
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 14),

                      // Pill-style Tab Bar
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: TabBar(
                          controller: _tabController,
                          labelColor: Colors.black87,
                          unselectedLabelColor: Colors.grey[600],
                          labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                          unselectedLabelStyle:
                              const TextStyle(fontSize: 14),
                          dividerColor: Colors.transparent,
                          indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(26),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2)),
                            ],
                          ),
                          tabs: const [
                            Tab(text: 'Subjects'),
                            Tab(text: 'Books'),
                            Tab(text: 'Exam Papers'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Tab Content
                      AnimatedBuilder(
                        animation: _tabController,
                        builder: (_, __) {
                          if (_tabController.index == 0) {
                            // Subjects
                            return Column(
                              children: _selectedStream!.subjects
                                  .map((s) => _buildSubjectCard(s))
                                  .toList(),
                            );
                          } else if (_tabController.index == 1) {
                            // Books
                            return _buildResourceList(
                                'Books', Icons.menu_book_outlined,
                                Colors.blue);
                          } else {
                            // Exam Papers
                            return _buildResourceList(
                                'Exam Papers', Icons.description_outlined,
                                Colors.orange);
                          }
                        },
                      ),
                    ],

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Stream Card ─────────────────────────────────────────────────────────
  Widget _buildStreamCard(StreamInfo s) {
    final isSelected = _selectedStream?.name == s.name;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedStream = s;
          _tabController.animateTo(0);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected
                ? const Color.fromARGB(255, 3, 59, 105)
                : Colors.grey.shade200,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: s.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.menu_book_outlined,
                  color: Colors.white, size: 28),
            ),
            const SizedBox(height: 10),
            Text(s.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 2),
            Text('${s.subjects.length} Departments',
                style:
                    TextStyle(color: Colors.grey[600], fontSize: 12)),
          ],
        ),
      ),
    );
  }

  // ── Subject Card ────────────────────────────────────────────────────────
  Widget _buildSubjectCard(SubjectInfo s) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(s.name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          _countRow('Books', s.books),
          const SizedBox(height: 8),
          _countRow('Papers', s.papers),
        ],
      ),
    );
  }

  Widget _countRow(String label, int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFF16A34A),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text('$count',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13)),
        ),
      ],
    );
  }

  // ── Generic Resource List ────────────────────────────────────────────────
  Widget _buildResourceList(String type, IconData icon, Color color) {
    final items = _selectedStream!.subjects
        .expand((s) => List.generate(
              type == 'Books' ? s.books : s.papers,
              (i) => '${s.name} — $type ${i + 1}',
            ))
        .toList();

    return Column(
      children: items
          .take(8)
          .map((item) => Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(icon, color: color, size: 18),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(item,
                          style: const TextStyle(fontSize: 14)),
                    ),
                    Icon(Icons.download_outlined,
                        color: Colors.grey[400], size: 20),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
