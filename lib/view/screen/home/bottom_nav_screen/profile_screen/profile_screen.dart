import 'package:flutter/material.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/provider/home/profile_screen_provider/profile_screen_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/profile_screen/widget/circular_percent_indicator.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/profile_screen/widget/text_field.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/widget/background_widget.dart';
import 'package:provider/provider.dart';

import '../../../../widget/height_and_width.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileScreenProvider(),
      child: Consumer<ProfileScreenProvider>(builder: (context, data, _) {
        return BackGroundWidget(
          column1: [
            const KHeight(72),
            const CircularPercentWidget(),
            const KHeight(4),
            const Text(
              'Abdu Rahman',
              style: AppTextStyle.buttonText,
            ),
            const KHeight(28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'joined on',
                            style: AppTextStyle.smalleWhiteText,
                          ),
                          Text(
                            '05-02-2023',
                            style: AppTextStyle.smallestText,
                          )
                        ],
                      ),
                      const KWidth(32),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Refferl Id ',
                            style: AppTextStyle.smalleWhiteText,
                          ),
                          const KHeight(1),
                          Row(
                            children: [
                              const Text(
                                'MXT1021',
                                style: AppTextStyle.smallestText,
                              ),
                              const KWidth(3),
                              InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.copy_all,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        data.readOnly = !data.readOnly;
                        data.onRefresh();
                      },
                      child: data.readOnly == true
                          ? Image.asset(
                              'assets/icons/edit_icon.png',
                              height: 20,
                              width: 18,
                            )
                          : const Icon(
                              Icons.save_as_outlined,
                              color: Colors.white,
                              size: 20,
                            ))
                ],
              ),
            ),
            const KHeight(22),
          ],
          column2: Column(
            children: [
              const KHeight(22),
              ProfileTextField(
                value: '',
                labelText: 'Name',
                onChanged: (val) {},
                readOnly: data.readOnly,
              ),
              const KHeight(16),
              ProfileTextField(
                value: '',
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) {},
                readOnly: data.readOnly,
              ),
              const KHeight(16),
              ProfileTextField(
                value: '',
                labelText: 'Mobile Number',
                keyboardType: TextInputType.number,
                readOnly: data.readOnly,
                onChanged: (val) {},
              ),
              const KHeight(16),
              ProfileTextField(
                value: '',
                labelText: 'Address',
                readOnly: data.readOnly,
                onChanged: (val) {},
              ),
              const KHeight(16),
              ProfileTextField(
                value: '',
                labelText: 'Social Link 1',
                readOnly: data.readOnly,
                onChanged: (val) {},
              ),
              const KHeight(16),
              ProfileTextField(
                value: '',
                labelText: 'Social Link 2',
                readOnly: data.readOnly,
                onChanged: (val) {},
              ),
              const KHeight(16)
            ],
          ),
        );
      }),
    );
  }
}
