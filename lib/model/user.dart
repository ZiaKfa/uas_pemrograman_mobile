class User {
  String username;
  String password;

  User({required this.username, required this.password});

  static List<User> getUsers() {
    return [
      User(username: 'alice', password: 'password123'),
      User(username: 'bob', password: 'securePass!'),
      User(username: 'charlie', password: 'charlie2023'),
      User(username: 'dave', password: 'davePass#1'),
      User(username: 'eve', password: 'eveSecret*'),
    ];
  }
}