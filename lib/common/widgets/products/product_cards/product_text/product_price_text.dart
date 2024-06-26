import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  const ProductPriceText({
    super.key, 
    this.currencySign = '\$', 
    required this.price, 
    this.maxLines = 1, 
    this.isLarge = true, 
    this.lineThrough = false,
    });

  @override
  Widget build(BuildContext context) {
    return Text(
    currencySign + price,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    style: isLarge ?
      Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
      : Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
    );
  }
  
}