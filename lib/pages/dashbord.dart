import 'package:e_comarcas_app/auth/auth_service.dart';
import 'package:e_comarcas_app/coustomWidgets/dashboard_item_view.dart';
import 'package:e_comarcas_app/models/dashbord_item.dart';
import 'package:e_comarcas_app/pages/login_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/dashboard';

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.teal,
              height: 150,
            ),
            ListTile(
              onTap: _logOut,
              title: const Text('LogOut'),
              trailing: const Icon(Icons.logout),
            )
          ],
        ),
      ),
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dashboard screen'),
      ),
      body: GridView.builder(
        itemCount:DashBordItem.dashboardItemList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final item = DashBordItem.dashboardItemList[index];
          return DashboardItemView(item: item);
        },
      ),
    );
  }

  void _logOut() {
    AuthService.logout();
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }
}
