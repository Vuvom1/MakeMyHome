import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/common/widgets/layout/grid_layout.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSize.defaultSpace),
          child: Column(
            children: [
              DropdownButtonFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)), 
                onChanged: (value) {},
                items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
                    .map((option) => DropdownMenuItem(child: Text(option), value: option,))
                    .toList(),
                ),
          
                const SizedBox(height: CustomSize.spaceBtwSections,),
          
                TGridLayout(
                  itemCount: 10, 
                  itemBuilder: (_, index) => const ProductCardVertical(),
                  )
            ],
          ),
        ),
      ),
    );
  }
  
}