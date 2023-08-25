
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled55/cubit/my_app_cubit.dart';
import 'package:untitled55/cubit/my_app_state.dart';
import 'package:untitled55/user%20inter/widgets/product_wid.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  // @override
  // void initState() {
  //   if (DataSource.isLoading) {
  //     Future.delayed(Duration.zero, () async {
  //       var data = await DataSource.getData();
  //       setState(() {
  //         DataSource.products = data;
  //         DataSource.isLoading = false;
  //       });
  //     });
  //   }
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: BlocConsumer<AppCubitA, AppStateA>(
        listener: (context, state) {
          if (state is ErrorState) {
            showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content: Text('Please try again later'),
                );
              },
            );
            print('يرجي المحاوله في وقت لاحق');
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DoneState ||
              context.read<AppCubitA>().products.isNotEmpty) {
            return SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: GridView.builder(
                    itemCount: context.read<AppCubitA>().products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {},
                        child: ProductItem(
                          product: context.read<AppCubitA>().products[index],
                        ),
                      );
                    },
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                  )),
            );
          } else {
            return const Center(
              child: Text('error**********'),
            );
          }
        },
      ),
    );
  }
}
