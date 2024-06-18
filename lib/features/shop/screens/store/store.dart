import 'package:flutter/material.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/common/widgets/appbar/tabbar.dart';
import 'package:makemyhome/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:makemyhome/common/widgets/images/circular_image.dart';
import 'package:makemyhome/common/widgets/layout/grid_layout.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:makemyhome/common/widgets/rounded_containers/rounded_container.dart';
import 'package:makemyhome/common/widgets/texts/section_heading.dart';
import 'package:makemyhome/features/shop/controllers/category_controller.dart';
import 'package:makemyhome/features/shop/screens/store/widgets/category_tab.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          
        ),
      
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: CustomHelperFunctions.isDarkMode(context) ? CustomColor.black : CustomColor.primary,
              expandedHeight: 140,
      
      
              flexibleSpace: Padding(
                padding: EdgeInsets.all(CustomSize.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    TSearchContainer(text: '', showBorder: false, showBackground: false,),
      
                    // TSectionHeading(title: 'Featured Brands', onPressed: () {}),
      
                    // const SizedBox(height: CustomSize.spaceBtwItem / 1.5),
      
                    // TRoundedContainer(
                    //   padding: const EdgeInsets.all(CustomSize.sm),
                    //   showBorder: true,
                    //   backgroundColor: Colors.transparent,
                    //   child: Row(
                    //     children: [
                          
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
      
              bottom: TTabBar(
                tabs: categories.map((category) => Tab(child: Text(category.name),)).toList(),
              ),
      
              
            ),
      
            
          ];
        }, 
      
        body: TabBarView(
          children: 
            categories.map((category) => CategoryTab(category: category)).toList()
       
        )
        
        // TabBarView(
        //   children: [
        //    CategoryTab(),
        //   ],
          
        // )
        
        
        ),
      ),
    );
  }
}
