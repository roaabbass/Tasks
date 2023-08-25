import 'dart:convert' as convert;



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../overall_data/model/Product_data.dart';
import '../overall_data/model/user_info_model.dart';
import 'my_app_state.dart';

class AppCubitA extends Cubit<AppStateA> {
  AppCubitA() : super(MyAppInitial());

  List<Product> products = [];

  UserDataModel? userData;

  Future<void> getData() async {
    try {
      emit(LoadingState());
      final response =
      await http.get(Uri.parse('https://dummyjson.com/products'));
      if (response.statusCode == 200) {
        var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
        for (var item in jsonResponse['products']) {
          products.add(Product.fromJson(item));
        }
      }
      emit(DoneState());
    } catch (e) {
      emit(ErrorState());
    }
  }

  Future<void> getDataFromFirebase() async {
    try {
      emit(GetDatLoadingState());
      String? uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userA =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();
      userData = UserDataModel(
        name: userA['name'],
        password: userA['password'],
        phone: userA['phone'],
        email: userA['email'],
        uid: userA['uid'],
      );
      emit(GetDatDoneState());
    } catch (e) {
      emit(GetDatErrorState(e.toString()));
    }
  }

  Future<void> login(
      String email,
      String password,
      ) async {
    try {
      emit(LoginLoadingState());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        if (value.user != null) {
          emit(LoginDoneState());
        }
      });
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  double sum = 0;

  void getSum(
      double input1,
      double input2,
      ) {
    sum = input1 + input2;
    emit(GetSum());
  }
}
