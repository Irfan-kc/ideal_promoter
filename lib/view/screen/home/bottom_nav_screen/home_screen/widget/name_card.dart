import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/provider/Profile/profile_provider.dart';

import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class NameCard extends StatelessWidget {
  const NameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, profileProvider, _) {
      return Row(
        children: [
          const KWidth(32),
          const Image(
            image: AssetImage('assets/images/3d-hands-fun.png'),
            height: 55,
          ),
          const KWidth(20),
          profileProvider.isLoading
              ? Shimmer.fromColors(
                  baseColor: const Color.fromARGB(255, 83, 134, 228),
                  highlightColor: AppColors.secondaryColor.withOpacity(0.2),
                  enabled: true,
                  child: Container(
                    height: 34,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                )
              : profileProvider.profileData == null
                  ? const Text('Failed to load data')
                  : RichText(
                      text: TextSpan(
                        text:
                            'Hi, ${profileProvider.profileData!.name ?? "User Name"}\n',
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        children: const [
                          TextSpan(
                            text: 'welcome to ideal e shope',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              letterSpacing: -0.4,
                            ),
                          ),
                        ],
                      ),
                    ),
        ],
      );
    });
  }
}
