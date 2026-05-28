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
          height: 80,
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 40.0 : 20.0,
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 221, 221, 221),
              width: 1.0,
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),

              // 🔹 Logo + App Name
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 66, 117),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'JK',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'JKLU Eezy',
                      style: TextStyle(
                        color: Color.fromARGB(255, 3, 59, 105),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // 🔹 Notification Icon
              IconButton(
                icon: const Icon(Icons.notifications_outlined, size: 22),
                onPressed: () {},
              ),

              const SizedBox(width: 10),

              // 🔹 Profile Icon — shows static admin info
              IconButton(
                icon: const Icon(Icons.person_outline, size: 22),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ProfilePopup(
                      username: 'Admin',
                      email: 'admin@jklu.edu.in',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePopup extends StatelessWidget {
  final String username;
  final String email;

  const ProfilePopup({
    super.key,
    required this.username,
    required this.email,
  });

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
            const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 15),
            Text(
              username,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(email, style: const TextStyle(color: Colors.grey)),
            const Divider(height: 30),
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
            const Divider(height: 30),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
