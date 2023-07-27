class User {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String password;
  final String phoneNumber;
  final String privilege;
  final String storeId;
  final String userId;
  final bool isDarkMode;

  User({
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.password,
    required this.privilege,
    required this.storeId,
    required this.userId,
    required this.phoneNumber,
    required this.isDarkMode,
  });

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
