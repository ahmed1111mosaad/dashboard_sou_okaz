import 'package:dashbaord_sou_okaz/core/assets/assets.dart';
import 'package:dashbaord_sou_okaz/core/utils/app_colors.dart';
import 'package:flutter/material.dart';


class CheckList extends StatefulWidget {
  const CheckList({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isSelected = !isSelected;
        widget.onChanged(isSelected);
        setState(() {});
      },
      child: Container(
        width: 27,
        height: 27,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : null,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: isSelected ? 0 : 2,
            color: isSelected ? AppColors.primaryColor : Colors.grey,
          ),
        ),
        child: isSelected ? Image.asset(Assets.assetsImagesCheck) : SizedBox(),
      ),
    );
  }
}
