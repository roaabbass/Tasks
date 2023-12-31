
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/my_app_cubit.dart';
import '../../cubit/my_app_state.dart';

class CounterA extends StatelessWidget {
  CounterA({
    super.key,
  });

  final TextEditingController input1Controller = TextEditingController();
  final TextEditingController input2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AppCubitA, AppStateA>(
              builder: (context, state) {
                return Text(
                  'sum = ${context.read<AppCubitA>().sum}',
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: input1Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Input 1',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: input2Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Input 2',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<AppCubitA, AppStateA>(
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      alignment: Alignment.center,
                      maximumSize: const Size(200, 60),
                      padding: const EdgeInsets.all(10)),
                  onPressed: () {
                    context.read<AppCubitA>().getSum(
                      double.parse(input1Controller.text),
                      double.parse(input2Controller.text),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Get sum'),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.calculate_outlined),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
