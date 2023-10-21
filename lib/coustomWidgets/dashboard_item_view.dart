import 'package:e_comarcas_app/models/dashbord_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbols.dart';
class DashboardItemView extends StatelessWidget {
  final DashBordItem item;
  const DashboardItemView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  ()=> Navigator.pushNamed(context, item.rout),
      child: Card(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child:  Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(item.icon,size: 40,color: Colors.white,),
              Text(item.name,style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
