import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_config.dart';
import 'package:ecommerce/core/utils/app_routes.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/features/commerce/screens/home_screen/tabs/favorite_tab/favorite_tab.dart';
import 'package:ecommerce/features/commerce/screens/home_screen/tabs/home_tab/home_tab.dart';
import 'package:ecommerce/features/commerce/screens/home_screen/tabs/product_tab/product_tab.dart';
import 'package:ecommerce/features/commerce/screens/home_screen/tabs/profile_tab/profile_tab.dart';
import 'package:ecommerce/features/common/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomeTab(), ProductTab(), FavoriteTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: width * 0.3,
        leading: Image.asset(AppAssets.routeIcon),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          spacing: height * 0.02,
          children: [
            Visibility(
              visible: selectedIndex != 3,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextFormFeild(
                      hintText: 'what do you search for?',
                      textStyle: AppStyles.light14LightBlue,
                      borderRadius: 25,
                      borderSideColor: AppColors.blueColor,
                      prefixIcon: Image.asset(AppAssets.searchIcon),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.cartScreen);
                    },
                    icon: Image.asset(AppAssets.shoppingCartIcon),
                  ),
                ],
              ),
            ),
            Expanded(child: tabs[selectedIndex]),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            bottomNavigationBarItem(
              Image.asset(AppAssets.homeIcon),
              Image.asset(AppAssets.homeSelectedIcon),
              0,
            ),
            bottomNavigationBarItem(
              Image.asset(AppAssets.productIcon),
              Image.asset(AppAssets.productSelectedIcon),
              1,
            ),
            bottomNavigationBarItem(
              Image.asset(AppAssets.favoriteIcon),
              Image.asset(AppAssets.favoriteSelectedIcon),
              2,
            ),
            bottomNavigationBarItem(
              Image.asset(AppAssets.profileIcon),
              Image.asset(AppAssets.profileSelectedIcon),
              3,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(
    Widget icon,
    Widget activeIcon,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: icon,
      label: '',
      activeIcon: activeIcon,
    );
  }
}
