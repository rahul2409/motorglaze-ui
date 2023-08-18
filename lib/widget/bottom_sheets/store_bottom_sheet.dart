import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memberships_ui/models/store_model.dart';
import 'package:uuid/uuid.dart';

import '../../data/store_bloc_http.dart';
import '../../events/store_bloc_event.dart';
// import '../../models/user_model.dart';

var uuid = Uuid();

class AddStoreBottomSheet extends StatelessWidget {
  final TextEditingController _storeNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _storeTypeController = TextEditingController();
  final TextEditingController _storeOwnerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _storeNameController,
            decoration: InputDecoration(labelText: 'Store Name'),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _locationController,
            decoration: InputDecoration(labelText: 'Location'),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _storeTypeController,
            decoration: InputDecoration(labelText: 'Store Type'),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _storeOwnerController,
            decoration: InputDecoration(labelText: 'Store Owner'),
          ),
          // FutureBuilder<List<User>>(
          //   future: fetchUsers(), // Replace with the function to fetch users
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return CircularProgressIndicator();
          //     } else if (snapshot.hasError) {
          //       return Text('Error loading users');
          //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          //       return Text('No users available');
          //     } else {
          //       final List<User> users = snapshot.data!;
          //       return DropdownButtonFormField<User>(
          //         value: _selectedUser,
          //         onChanged: (newValue) {
          //           _selectedUser = newValue;
          //           _storeOwnerController.text = newValue.id.toString();
          //         },
          //         items: users.map((user) {
          //           return DropdownMenuItem<User>(
          //             value: user,
          //             child: Text(user.firstName + user.lastName),
          //           );
          //         }).toList(),
          //         decoration: InputDecoration(labelText: 'Store Owner'),
          //       );
          //     }
          //   },
          // ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              final storeName = _storeNameController.text;
              final location = _locationController.text;
              final storeType = _storeTypeController.text;
              final storeOwnerId = _storeOwnerController.text;
              if (storeName.isNotEmpty &&
                  location.isNotEmpty &&
                  storeType.isNotEmpty &&
                  storeOwnerId.isNotEmpty) {
                final newStore = Store(
                    location: location,
                    type: storeType,
                    storeOwner: storeOwnerId,
                    storeName: storeName,
                    id: uuid.v4(),
                    creationDate: DateTime.now());
                BlocProvider.of<StoreBloc>(context)
                    .add(AddStoreEvent(newStore));
                Navigator.pop(context); // Close bottom sheet
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
