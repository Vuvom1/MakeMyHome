import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makemyhome/common/widgets/circular_containers/circular_container.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';

class TChoiceChip extends StatelessWidget {
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  const TChoiceChip({
    super.key, 
    required this.text, 
    required this.selected, 
    this.onSelected
    });
  
  @override
  Widget build(BuildContext context) {
    final isColor = CustomHelperFunctions.getColor(text) != null;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: CustomColor.transparent), 
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text), 
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? CustomColor.white : null),
        avatar: isColor ? TCircularContainer(width: 50, height: 50, backgroundColor: CustomHelperFunctions.getColor(text)!) : null, labelPadding: isColor ? const EdgeInsets. all(0) : null, padding: isColor ? const EdgeInsets.all(0) : null, shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? CustomHelperFunctions.getColor(text)! : null,
        )
      );
  }

  
}