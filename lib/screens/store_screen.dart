import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memberships_ui/data/repository/store_repository.dart';
import 'package:memberships_ui/data/store_bloc_http.dart';
import 'package:memberships_ui/events/store_bloc_event.dart';
import 'package:memberships_ui/utils/customisations.dart';
import 'package:memberships_ui/widget/bottom_sheets/store_bottom_sheet.dart';
import 'package:memberships_ui/widget/drawer_menu_widget.dart';

class StoreScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  const StoreScreen({required this.openDrawer, super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  late StoreBloc _storeBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _storeBloc = BlocProvider.of<StoreBloc>(
        context); // Get the StoreBloc from the context
    _storeBloc.add(FetchStoreEvent()); // Dispatch the event to fetch stores
  }

  @override
  Widget build(BuildContext context) {
    VoidCallback openDrawer = widget.openDrawer;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: DrawerMenuWidget(onClick: openDrawer),
        backgroundColor: Colors.transparent,
        title: Text(
          'Store',
          style: customTextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<StoreBloc, StoreState>(
        builder: (context, state) {
          return FutureBuilder(
            future: StoreRepository().fetchStoresFromApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print('Waiting for api result');
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                      'Error ${snapshot.error}',
                      style: customTextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                    itemCount: state.stores.length,
                    itemBuilder: (context, index) {
                      final store = state.stores[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          // Adjust the padding as needed
                          decoration: BoxDecoration(
                            color: Colors
                                .white, // Customize the container's background color
                            borderRadius: BorderRadius.circular(
                                12), // Adjust the border radius for rounded edges
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                    0.2), // Customize shadow color and opacity
                                spreadRadius:
                                    2, // Adjust the spread radius of the shadow
                                blurRadius:
                                    5, // Adjust the blur radius of the shadow
                                offset:
                                    Offset(0, 3), // Adjust the shadow offset
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(store.storeName),
                            onTap: () {
                              // Navigate to store detail page
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => StoreDetailScreen(store)),
                              // );
                            },
                            trailing: Container(
                              width: 40,
                              child: GestureDetector(
                                child: Center(
                                    child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                                onTap: () {},
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                      'No stores found',
                      style: customTextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: AddStoreBottomSheet(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
