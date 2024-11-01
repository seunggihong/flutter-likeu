import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SettingMenuCard extends StatelessWidget {
  const SettingMenuCard({
    super.key,
    required this.menuNameString,
  });

  final String menuNameString;

  @override
  Widget build(BuildContext context) {
    List<Container> menuList = [
      Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Text(menuNameString),
      )
    ];

    return GestureDetector(
      onTap: () {
        /// Navigate to Setting menu.
        /// Open Modal sheet.
        Navigator.push(
          context,
          CupertinoModalBottomSheetRoute(
            builder: (_) => menuList[0],
            expanded: false,
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: 80,
        child: Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            menuNameString,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.white,
              backgroundColor: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
