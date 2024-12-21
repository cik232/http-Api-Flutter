import 'dart:convert';

import 'package:api_get_post_put_patch_delete_http_test/models/employee.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  String baseUrl = 'https://reqres.in/api/';

  getAllEmployeeData() async {
    List<Employee> allEmployee = [];
    try{

      var respons = await http.get(Uri.parse(baseUrl + "users?page=2"));
      if(respons.statusCode == 200){
        var data = respons.body;
        // var data2 = jsonDecode(respons.body);
        var decodeData = jsonDecode(data);
        var employees = decodeData['data'];

        // print(employees);


        for(var employee in employees){
          Employee newEmployee = Employee.fromJson(employee);
          allEmployee.add(newEmployee);
        }

        return allEmployee;

      }

    }catch(e){
      throw Exception(e.toString());
    }
  }
}
