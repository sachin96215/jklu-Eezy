// Stub UserService — static data, no backend
class UserService {
  static final UserService instance = UserService._internal();
  UserService._internal();

  String username = 'Admin';
  String email = 'admin@jklu.edu.in';
  String role = 'admin';

  Future<void> loadUser() async {
    // Static — nothing to load
    username = 'Admin';
    email = 'admin@jklu.edu.in';
    role = 'admin';
  }
}
