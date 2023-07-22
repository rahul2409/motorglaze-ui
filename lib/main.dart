import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memberships_ui/screens/admin/add_membership.dart';
import 'package:memberships_ui/screens/admin/add_membership_registration.dart';
import 'package:memberships_ui/screens/admin/add_service.dart';
import 'package:memberships_ui/screens/admin/add_store.dart';
import 'package:memberships_ui/screens/admin/add_transaction.dart';
import 'package:memberships_ui/screens/admin/add_user.dart';
import 'package:memberships_ui/screens/customer/homescreen.dart';
import 'package:memberships_ui/screens/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        // Routes for admins
        '/add_user': (context) => const AddUsers(),
        '/add_transactions': (context) => const RecordTransaction(),
        '/add_store': (context) => const AddStores(),
        '/add_service': (context) => const AddServicesMembership(),
        '/add_membership': (context) => const AddMembership(),
        '/add_membership_registrations': (context) =>
            const AddMembershipRegistrations(),
        // Routes for customers
      },
    );
  }
}


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AddStoreScreen(),
//       routes: {
//         '/addUser': (context) => AddUserScreen(),
//         '/addMembership': (context) => AddMembershipScreen(),
//       },
//     );
//   }
// }

// class AddStoreScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Store'),
//       ),
//       body: Column(
//         children: [
//           // Store fields (Store type, location, owner, etc.)
//           // Implement your UI for store fields here
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pushNamed(context, '/addUser');
//             },
//             child: Text('Add User'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AddUserScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add User'),
//       ),
//       body: Column(
//         children: [
//           // User fields (Name, email, phone number, etc.)
//           // Implement your UI for user fields here
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pushNamed(context, '/addMembership');
//             },
//             child: Text('Add Membership'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AddMembershipScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Membership'),
//       ),
//       body: Column(
//         children: [
//           // Membership fields (Type, price, etc.)
//           // Implement your UI for membership fields here
//           ElevatedButton(
//             onPressed: () {
//               // Save the store, user, and membership data to the database
//               // You can implement the logic to save data here
//               Navigator.popUntil(context, ModalRoute.withName('/'));
//             },
//             child: Text('Save'),
//           ),
//         ],
//       ),
//     );
//   }
// }
