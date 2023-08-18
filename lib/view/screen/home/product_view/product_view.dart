import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/provider/Products/product_provider.dart';
import 'package:ideal_promoter/provider/Profile/profile_provider.dart';
import 'package:ideal_promoter/provider/WahtsApp/whats_app_provider.dart';
import 'package:ideal_promoter/view/screen/home/product_view/widget/carousel_view.dart';
import 'package:ideal_promoter/view/widget/Loading/circular_loader.dart';
import 'package:ideal_promoter/view/widget/Loading/shimmer_loader.dart';
import 'package:ideal_promoter/view/widget/buttons/icon_button.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class ProductView extends StatefulWidget {
  const ProductView({
    super.key,
    required this.id,
  });
  final String id;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      Provider.of<ProductProvider>(context, listen: false)
          .getProduct(context, widget.id);
    });
  }

  double calculateDiscount(double price, double offerPrice) {
    double discount = price - offerPrice;
    double discountPercentage = (discount / price) * 100;
    return discountPercentage;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<ProductProvider, ProfileProvider, WhatsAppProvider>(
        builder:
            (context, productProvider, profileProvider, whatsAppProvider, _) {
      return Scaffold(
        body: productProvider.isSingleProductLoading
            ? loader()
            : productProvider.singleProduct == null
                ? const Center(child: Text("FAILED TO LOAD DATA!"))
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselView(
                          images: productProvider.singleProduct!.images ?? [],
                        ),
                        // const KHeight(24),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              productProvider.isLoading
                                  ? const CustomShimmer(
                                      width: double.infinity,
                                      height: 20,
                                      radius: 6,
                                    )
                                  : Text(
                                      productProvider.singleProduct!
                                                      .primaryLang!.name !=
                                                  null &&
                                              productProvider.singleProduct!
                                                      .primaryLang!.name !=
                                                  ''
                                          ? productProvider
                                              .singleProduct!.primaryLang!.name!
                                          : "NA",
                                      style: AppTextStyle.body1Text,
                                    ),
                              productProvider.isLoading
                                  ? const Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: CustomShimmer(
                                        width: double.infinity,
                                        height: 18,
                                        radius: 6,
                                      ),
                                    )
                                  : RichText(
                                      text: TextSpan(
                                        style: AppTextStyle.buttonText.apply(
                                          color: AppColors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: productProvider
                                                          .singleProduct!
                                                          .offerPrice !=
                                                      null
                                                  ? '\$${productProvider.singleProduct!.offerPrice}'
                                                  : '\$0'),
                                          const WidgetSpan(child: KWidth(10)),
                                          TextSpan(
                                              text: productProvider
                                                          .singleProduct!
                                                          .price !=
                                                      null
                                                  ? '\$${productProvider.singleProduct!.price}'
                                                  : '\$0',
                                              style: const TextStyle(
                                                  color: Color(0xFF9C9C9C),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  decorationThickness: 1.5)),
                                          const WidgetSpan(child: KWidth(10)),
                                          TextSpan(
                                            text: productProvider.singleProduct!
                                                            .offerPrice !=
                                                        null ||
                                                    productProvider
                                                            .singleProduct!
                                                            .offerPrice !=
                                                        0
                                                ? "${calculateDiscount(productProvider.singleProduct!.price!, productProvider.singleProduct!.offerPrice!).toStringAsFixed(0)}%"
                                                : "",
                                            style: const TextStyle(
                                              color: AppColors.green,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                              const KHeight(8),
                              productProvider.isLoading
                                  ? const CustomShimmer(
                                      width: double.infinity,
                                      height: 200,
                                      radius: 8,
                                    )
                                  : productProvider.singleProduct!.primaryLang!
                                                  .description !=
                                              null &&
                                          productProvider.singleProduct!
                                                  .primaryLang!.description !=
                                              ''
                                      ? Html(
                                          data: productProvider.singleProduct!
                                              .primaryLang!.description!,
                                        )
                                      : const Text(
                                          "NA",
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
                                    onTap: () {
                                      var removeSpace = productProvider
                                          .singleProduct!.primaryLang!.name!
                                          .replaceAll(" ", "-");
                                      var text =
                                          "https://idealeshope.com/products/$removeSpace?ref_id=${profileProvider.profileData!.refId}";
                                      Clipboard.setData(
                                        ClipboardData(
                                          text: text,
                                        ),
                                      ).then((_) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Copied to clipboard")));
                                      });
                                    },
                                    text: 'Copy Urls',
                                  ),
                                  const KWidth(10),
                                  CustIconButton(
                                    flex: 5,
                                    icon: SvgPicture.asset(
                                      'assets/icons/content_copy.svg',
                                      height: 14,
                                      width: 14,
                                    ),
                                    onTap: () {
                                      whatsAppProvider.getItOnWhatsApp(
                                          context,
                                          productProvider.singleProduct!.id ??
                                              "");
                                    },
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
    });
  }
}
