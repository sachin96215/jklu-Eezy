import 'package:flutter/material.dart';
import 'package:jklu_eezy/pages/login.dart';
import 'package:jklu_eezy/pages/home.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width > 600;

    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: 70,
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 24.0 : 12.0,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                  color: Color.fromARGB(255, 230, 230, 230), width: 1),
            ),
          ),
          child: Row(
            children: [
              // ── Hamburger menu ───────────────────────────────────
              Builder(builder: (innerCtx) {
                return IconButton(
                  icon: const Icon(Icons.menu,
                      color: Color.fromARGB(255, 3, 59, 105), size: 24),
                  onPressed: () {
                    Scaffold.of(innerCtx).openDrawer();
                  },
                  tooltip: 'Menu',
                );
              }),

              const SizedBox(width: 4),

              // ── Logo + App Name ──────────────────────────────────
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 66, 117),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'JK',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'JKLU Eezy',
                      style: TextStyle(
                        color: Color.fromARGB(255, 3, 59, 105),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // ── Notification Bell ────────────────────────────────
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined,
                        color: Colors.black87, size: 22),
                    onPressed: () {},
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 3, 59, 105),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text('5',
                            style:
                                TextStyle(color: Colors.white, fontSize: 9)),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 4),

              // ── Profile Avatar ───────────────────────────────────
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ProfilePopup(
                      username: 'Admin',
                      email: 'admin@jklu.edu.in',
                    ),
                  );
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 59, 105),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text('AS',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13)),
                  ),
                ),
              ),

              const SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Profile Popup ────────────────────────────────────────────────────────────
class ProfilePopup extends StatelessWidget {
  final String username;
  final String email;

  const ProfilePopup({super.key, required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 280,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 3, 59, 105),
                  shape: BoxShape.circle),
              child: const Center(
                child: Text('AS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),
            Text(username,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(email, style: const TextStyle(color: Colors.grey)),
            const Divider(height: 24),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
            const Divider(height: 8),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout',
                  style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
