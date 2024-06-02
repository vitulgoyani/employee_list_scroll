import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_obj;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../models/employee_model.dart';

class HomeController extends GetxController {
  Dio dio = Dio();

  RxList<EmployeeModel> employeeList = <EmployeeModel>[].obs;

  ScrollController scrollController = ScrollController();

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      getEmployeeList();
    }
  }

  getEmployeeList() async {
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true));
    try {
      dio_obj.Response response =
          await dio.get("https://dummyapi.online/api/users");

      if (response.statusCode == 200) {
        employeeList.addAll(List<EmployeeModel>.from(
            response.data.map((x) => EmployeeModel.fromJson(x))));

        debugPrint(employeeList.length.toString());

      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController.addListener(_scrollListener);
    getEmployeeList();
  }
}
