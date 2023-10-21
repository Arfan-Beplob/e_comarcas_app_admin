import 'package:e_comarcas_app/pages/category_screen.dart';
import 'package:e_comarcas_app/pages/new_product_screen.dart';
import 'package:e_comarcas_app/pages/view_product_screen.dart';
import 'package:flutter/material.dart';

class DashBordItem {
  final IconData icon;
  final String name;
  final String rout;

  DashBordItem({
    required this.icon,
    required this.name,
    required this.rout,
  });

  static List<DashBordItem> dashboardItemList = [
    DashBordItem(
      icon: Icons.add,
      name: 'Add product',
      rout: NewProductPage.routeName,
    ),
    DashBordItem(
      icon: Icons.add,
      name: 'View product',
      rout: ViewProductScreen.routeName,
    ),DashBordItem(
      icon: Icons.category,
      name: 'Category',
      rout: CategoryScreen.routeName,
    ),
  ];
}
