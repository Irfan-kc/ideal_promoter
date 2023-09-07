// ignore_for_file: use_build_context_synchronously

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/models/profile_data_model/profile_data_model.dart';
import 'package:ideal_promoter/models/profile_data_model/social_links.dart';
import 'package:ideal_promoter/provider/Profile/profile_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/profile_screen/widget/circular_percent_indicator.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/profile_screen/widget/logout_alert.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/profile_screen/widget/profile_text_field.dart';
import 'package:ideal_promoter/view/screen/home/widget/background_widget.dart';
import 'package:ideal_promoter/view/widget/Loading/circular_loader.dart';
import 'package:ideal_promoter/view/widget/others/height_and_width.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController facebookPageController = TextEditingController();
  TextEditingController facebookAccountController = TextEditingController();
  TextEditingController instagramController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  String countryCode = "+91";

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await Provider.of<ProfileProvider>(context, listen: false)
          .getProfileData(context);
      var data =
          Provider.of<ProfileProvider>(context, listen: false).profileData;
      if (data != null) {
        nameController = TextEditingController(text: data.name ?? '');
        emailController = TextEditingController(text: data.email ?? '');
        phoneController = TextEditingController(text: data.phone ?? '');
        addressController = TextEditingController(text: data.address ?? '');
        countryCode = '${data.countryCode}';
        if (data.socialLinks != null) {
          facebookPageController =
              TextEditingController(text: data.socialLinks!.facebookPage ?? '');
          facebookAccountController = TextEditingController(
              text: data.socialLinks!.facebookAccount ?? '');
          instagramController =
              TextEditingController(text: data.socialLinks!.instagram ?? '');
        }
      }
    });
    super.initState();
  }

  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, _) {
        return profileProvider.isLoading
            ? Center(child: loader())
            : profileProvider.profileData == null
                ? const Center(
                    child: Text("Failed to load data!"),
                  )
                : BackGroundWidget(
                    column1: [
                      const KHeight(72),
                      CircularPercentWidget(
                        profilePercentage:
                            calculatePercentage(profileProvider.profileData),
                      ),
                      const KHeight(4),
                      Text(
                        profileProvider.profileData!.name ?? 'Promoter',
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Joined on',
                                      style: AppTextStyle.smallWhiteText,
                                    ),
                                    profileProvider.profileData!.createdAt ==
                                            null
                                        ? const SizedBox()
                                        : Text(
                                            '${profileProvider.profileData!.createdAt!.day}-${profileProvider.profileData!.createdAt!.month}-${profileProvider.profileData!.createdAt!.year}',
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
                                      'Referral Id ',
                                      style: AppTextStyle.smallWhiteText,
                                    ),
                                    const KHeight(1),
                                    Row(
                                      children: [
                                        Text(
                                          profileProvider.profileData!.refId ??
                                              '',
                                          style: AppTextStyle.smallestText,
                                        ),
                                        const KWidth(3),
                                        InkWell(
                                          onTap: () {
                                            Clipboard.setData(ClipboardData(
                                                    text: profileProvider
                                                            .profileData!
                                                            .refId ??
                                                        ''))
                                                .then(
                                              (_) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                      "Copied to clipboard",
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: const Icon(
                                            Icons.copy_all,
                                            size: 18,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            TextButton.icon(
                              style: TextButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                    255, 225, 83, 81), // Background Color
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => const LogoutAlert(),
                                );
                              },
                              icon: const Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'Logout',
                                style:
                                    TextStyle(color: AppColors.secondaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const KHeight(22),
                    ],
                    column2: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const KHeight(20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Promoter Details",
                                  style: AppTextStyle.alertHead,
                                ),
                                isEdit
                                    ? TextButton.icon(
                                        style: TextButton.styleFrom(
                                          backgroundColor: AppColors
                                              .green, // Background Color
                                        ),
                                        onPressed: () async {
                                          await Provider.of<ProfileProvider>(
                                                  context,
                                                  listen: false)
                                              .updateProfile(
                                            context,
                                            ProfileData(
                                              address:
                                                  addressController.text.isEmpty
                                                      ? null
                                                      : addressController.text,
                                              name: nameController.text.isEmpty
                                                  ? null
                                                  : nameController.text,
                                              email:
                                                  emailController.text.isEmpty
                                                      ? null
                                                      : emailController.text,
                                              phone:
                                                  phoneController.text.isEmpty
                                                      ? null
                                                      : phoneController.text,
                                              countryCode:
                                                  countryCode,
                                              refId: profileProvider
                                                      .profileData!.refId ??
                                                  '',
                                              socialLinks: SocialLinks(
                                                facebookAccount:
                                                    facebookAccountController
                                                            .text.isEmpty
                                                        ? null
                                                        : facebookAccountController
                                                            .text,
                                                facebookPage:
                                                    facebookPageController
                                                            .text.isEmpty
                                                        ? null
                                                        : facebookPageController
                                                            .text,
                                                instagram: instagramController
                                                        .text.isEmpty
                                                    ? null
                                                    : instagramController.text,
                                              ),
                                            ),
                                          );
                                          setState(() {
                                            isEdit = false;
                                          });
                                        },
                                        icon: profileProvider.isUpdating
                                            ? const SizedBox(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              )
                                            : const Icon(
                                                Icons.save_outlined,
                                                color: Colors.white,
                                              ),
                                        label: Text(
                                          profileProvider.isUpdating
                                              ? "Saving..."
                                              : 'Save Changes',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      )
                                    : TextButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            isEdit = true;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.edit_document,
                                          color: Colors.grey[700],
                                        ),
                                        label: Text(
                                          'Edit Details',
                                          style: TextStyle(
                                              color: Colors.grey[700]),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                          const KHeight(12),
                          ProfileTextField(
                            controller: nameController,
                            labelText: 'Name',
                            onChanged: (val) {},
                            readOnly: !isEdit,
                          ),
                          const KHeight(8),
                          ProfileTextField(
                            controller: emailController,
                            labelText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (val) {},
                            readOnly: true,
                          ),
                          const KHeight(8),
                          ProfileTextField(
                            controller: addressController,
                            labelText: 'Address',
                            keyboardType: TextInputType.text,
                            onChanged: (val) {},
                            readOnly: !isEdit,
                          ),
                          const KHeight(8),
                          ProfileTextField(
                            suffixIcon: CountryCodePicker(
                              enabled: isEdit,
                              onChanged: (c) {
                                setState(() {
                                  countryCode = c.dialCode ?? "";
                                });
                              },
                              initialSelection: countryCode,
                              favorite: const ['+91'],
                              showCountryOnly: false,
                              hideMainText: true,
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 13, bottom: 12),
                              child: Text(countryCode),
                            ),
                            controller: phoneController,
                            labelText: 'Whatsapp Number',
                            readOnly: !isEdit,
                          ),
                          const KHeight(8),
                          ProfileTextField(
                            controller: facebookAccountController,
                            labelText: 'Facebook Account',
                            readOnly: !isEdit,
                            onChanged: (val) {},
                          ),
                          const KHeight(8),
                          ProfileTextField(
                            controller: facebookPageController,
                            labelText: 'Facebook Page',
                            readOnly: !isEdit,
                            onChanged: (val) {},
                          ),
                          const KHeight(8),
                          ProfileTextField(
                            controller: instagramController,
                            labelText: 'Instagram',
                            readOnly: !isEdit,
                            onChanged: (val) {},
                          ),
                          const KHeight(8)
                        ],
                      ),
                    ),
                  );
      },
    );
  }

  double calculatePercentage(ProfileData? profileData) {
    if (profileData == null) {
      return 0;
    }
    int i = 0;
    if (profileData.name != null) i = i + 2;
    if (profileData.email != null) i = i + 2;
    if (profileData.phone != null) i = i + 2;
    if (profileData.address != null) i = i + 2;
    if (profileData.socialLinks != null) {
      if (profileData.socialLinks!.facebookAccount != null ||
          profileData.socialLinks!.facebookPage != null ||
          profileData.socialLinks!.instagram != null) i = i + 2;
    }
    return i / 10;
  }
}
