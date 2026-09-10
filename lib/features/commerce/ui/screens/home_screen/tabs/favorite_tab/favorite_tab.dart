import 'package:ecommerce/features/commerce/ui/screens/home_screen/tabs/favorite_tab/widget/favorite_item_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../../core/utils/app_config.dart';


class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = AppConfig.height(context);
    var width = AppConfig.width(context);
    return Column(
      children: [
        Expanded(child: ListView.separated(
            itemBuilder: (context, index) {
              return FavoriteItemWidget();
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: height * 0.02,);
            },
            itemCount: 5)),
        SizedBox(height: height * 0.03,)
      ],
    );
  }
}
