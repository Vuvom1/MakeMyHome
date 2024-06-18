import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/device/device_utility.dart';

class TRatingProgressIndicator extends StatelessWidget {
  final String text;
  final double value;

  const TRatingProgressIndicator({
    super.key, 
    required this.text, 
    required this.value
    });

  @override
  Widget build(BuildContext context) {
   return Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    text,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )),
                              Expanded(
                                flex: 11,
                                child: SizedBox(
                                  width: DeviceUtility.getScreenWidth(context) *
                                      0.8,
                                  child: LinearProgressIndicator(
                                    value: value,
                                    minHeight: 11,
                                    backgroundColor: CustomColor.darkGrey,
                                    borderRadius: BorderRadius.circular(7),
                                    valueColor: const AlwaysStoppedAnimation(
                                        CustomColor.yellow),
                                  ),
                                ),
                              )
                            ],
                          );
  }
  
}
