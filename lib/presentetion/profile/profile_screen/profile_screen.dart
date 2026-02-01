




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_mohit/app/app_routes.dart';
import 'package:machine_test_mohit/core/local/local_storage.dart';
import 'package:machine_test_mohit/core/utils/custom_snackbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.4,),
          Center(
            child: Text('Profile Screen'),
          ),
          ElevatedButton(onPressed: () async {
            await AuthLocalStorage.logout().then((value) {
              Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false);
              AppSnackBar.success(context, "Logout Succesful..",);
            },);
          }, child: Text('LogOut',
            // style: TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }
}
