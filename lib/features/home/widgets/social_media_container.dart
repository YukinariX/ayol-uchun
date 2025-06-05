import 'package:ayol_uchun/data/models/accounts/social_media_accounts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/colors.dart';

class SocialMediaContainer extends StatelessWidget {

  final List<SocialMediaAccountsModel> accounts;

  const SocialMediaContainer({super.key,required this.accounts});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: 130.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary200,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: Column(
        spacing: 20.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ijtimoiy tarmoqlarimiz:",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 32.h,
            child: ListView.builder(
              itemCount: accounts.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  GestureDetector(
                    onTap: () async {
                      final url = Uri.parse(
                        accounts[index].link,
                      );
                      if (await canLaunchUrl(url)) {
                        await launchUrl(
                          url,
                          mode: LaunchMode
                              .externalApplication,
                        );
                      }
                    },
                    child: SizedBox(
                      width: 60.w,
                      child: SvgPicture.network(
                        accounts[index].icon,
                      ),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
