
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled55/cubit/my_app_cubit.dart';
import 'package:untitled55/cubit/my_app_state.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  // @override
  // void initState() {
  //   if (context.read<AppCubitA>(.isLoadingProfile) {
  //     Future.delayed(Duration.zero, () async {
  //       var data = await context.read<AppCubitA>(.getDataFromFirebase();
  //       setState(() {
  //         context.read<AppCubitA>(.userData = data;
  //         context.read<AppCubitA>(.isLoadingProfile = false;
  //       });
  //     });
  //   }
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubitA, AppStateA>(
        builder: (context, state) {
          if (context.read<AppCubitA>().userData != null) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    style: ListTileStyle.list,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.black)),
                    title: Text(
                      context.read<AppCubitA>().userData!.email,
                      textAlign: TextAlign.center,
                    ),
                    leading: const Icon(Icons.email),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    style: ListTileStyle.list,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.black)),
                    title: Text(
                      context.read<AppCubitA>().userData!.name,
                      textAlign: TextAlign.center,
                    ),
                    leading: const Icon(Icons.person),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    style: ListTileStyle.list,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.black)),
                    title: Text(
                      context.read<AppCubitA>().userData!.phone,
                      textAlign: TextAlign.center,
                    ),
                    leading: const Icon(Icons.phone),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    style: ListTileStyle.list,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.black)),
                    title: Text(
                      context.read<AppCubitA>().userData!.password,
                      textAlign: TextAlign.center,
                    ),
                    leading: const Icon(Icons.security),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    style: ListTileStyle.list,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.blueGrey)),
                    title: Text(
                      context.read<AppCubitA>().userData!.uid,
                      textAlign: TextAlign.center,
                    ),
                    leading: const Icon(Icons.insert_drive_file),
                  ),
                ],
              ),
            );
          } else {
            return const Text('ERROR');
          }
        },
      ),
    );
  }
}
