import 'package:api_get_post_put_patch_delete_http_test/models/employee.dart';
import 'package:api_get_post_put_patch_delete_http_test/services/employee_service.dart';
import 'package:flutter/material.dart';

class EmployeeScreens extends StatelessWidget {
  const EmployeeScreens({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Emploee Data"),
        actions: [
          IconButton.outlined(
              onPressed: () {
                EmployeeService().getAllEmployeeData();
              },
              icon: Icon(Icons.refresh_outlined))
        ],
      ),
      body: FutureBuilder(
        future: EmployeeService().getAllEmployeeData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error fatching employee Data"),
            );
          }

          if (snapshot.hasData) {
            var data = snapshot.data as List<Employee>;

            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data[index].avatar!),
                    ),
                    title: Text(
                        "${data[index].first_name} ${data[index].last_name}"),
                    subtitle: Text(data[index].email!),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
