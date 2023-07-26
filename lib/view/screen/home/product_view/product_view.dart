import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/provider/home/product_screen_provider/product_view_provider.dart';
import 'package:ideal_promoter/view/screen/home/product_view/widget/carousel_view.dart';
import 'package:ideal_promoter/view/widget/buttons/icon_button.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductPageProvider(),
      child: Consumer<ProductPageProvider>(builder: (context, data, _) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CarouselView(),
                // const KHeight(24),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: const TextSpan(
                              style: AppTextStyle.heading2,
                              children: [
                            TextSpan(text: '\$150.00'),
                            WidgetSpan(child: KWidth(10)),
                            TextSpan(
                                text: '\$300.00',
                                style: TextStyle(
                                    color: Color(0xFF9C9C9C),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 1.5)),
                            WidgetSpan(child: KWidth(10)),
                            TextSpan(
                                text: '50% off',
                                style: TextStyle(
                                  color: AppColors.green,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ))
                          ])),
                      const KHeight(8),
                      const Text(
                        'Wooden bedside table featuring a raised'
                        ' design on the door. Wooden bedside table'
                        ' featuring a raised design on the door,'
                        ' Wooden bedside table featuring a raised design'
                        ' on the door  Wooden bedside table featuring '
                        'a raised design on the doo',
                        style: AppTextStyle.text,
                      ),
                      const KHeight(16),
                      Row(
                        children: [
                          CustIconButton(
                            flex: 3,
                            icon: const Icon(
                              Icons.copy_rounded,
                              color: Colors.white,
                              size: 14,
                            ),
                            onTap: () {},
                            text: 'Copy Urls',
                          ),
                          const KWidth(10),
                          CustIconButton(
                            flex: 5,
                            icon: SvgPicture.asset(
                              'assets/icons/',
                              height: 14,
                              width: 14,
                            ),
                            onTap: () {},
                            text: 'Get it on Whatsapp',
                            color: AppColors.green,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
