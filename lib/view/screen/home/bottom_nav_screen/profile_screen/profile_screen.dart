import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ideal_promoter/constant/const_color.dart';
import 'package:ideal_promoter/constant/text_style.dart';
import 'package:ideal_promoter/models/profile_data_model/profile_data_model.dart';
import 'package:ideal_promoter/models/profile_data_model/social_links.dart';
import 'package:ideal_promoter/provider/Profile/profile_provider.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/profile_screen/widget/circular_percent_indicator.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/profile_screen/widget/logout_alert.dart';
import 'package:ideal_promoter/view/screen/home/bottom_nav_screen/profile_screen/widget/profile_text_field.dart';
import 'package:ideal_promoter/view/screen/home/widget/background_widget.dart';
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
        countryCode = '+${data.countryCode}';
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
            ? const Center(child: CircularProgressIndicator())
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
                        profileProvider.profileData!.name ?? '',
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
                                      'joined on',
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
                                                .then((_) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          "Copied to clipboard")));
                                            });
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
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) => const LogoutAlert());
                                    },
                                    icon: const Icon(
                                      Icons.logout,
                                      color: Colors.white,
                                    )),
                                InkWell(
                                  onTap: () async {
                                    if (isEdit) {
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
                                          email: emailController.text.isEmpty
                                              ? null
                                              : emailController.text,
                                          phone: phoneController.text.isEmpty
                                              ? null
                                              : phoneController.text,
                                          countryCode:
                                              countryCode.split('+')[1],
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
                                            facebookPage: facebookPageController
                                                    .text.isEmpty
                                                ? null
                                                : facebookPageController.text,
                                            instagram:
                                                instagramController.text.isEmpty
                                                    ? null
                                                    : instagramController.text,
                                          ),
                                        ),
                                      );
                                    }
                                    setState(() {
                                      isEdit = !isEdit;
                                    });
                                  },
                                  child: isEdit
                                      ? Container(
                                          height: 25,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              color: AppColors.green,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                            child: profileProvider.isUpdating
                                                ? const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                : const Text(
                                                    'Save',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                          ),
                                        )
                                      : SvgPicture.asset(
                                          'assets/icons/edit_icon.svg',
                                          height: 20,
                                          width: 30,
                                        ),
                                ),
                              ],
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
                          const KHeight(24),
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
                            maxLength: 10,
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
