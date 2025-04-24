import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:provider/provider.dart';
import 'package:sewar/theme/app_styles.dart';
import 'package:sewar/theme/themeprovider.dart';
import 'package:sewar/companyscreens/otherdatapage.dart';
import 'package:flutter/material.dart';
import 'package:sewar/companyscreens/companyprofilepage.dart';
import 'package:sewar/companyscreens/homepage.dart';
import 'package:sewar/companyscreens/matchesschedule.dart';
import 'package:sewar/theme/app_styles.dart';
import 'package:blur/blur.dart';
import 'package:sewar/userscreens/userprofilepage.dart';
import 'package:sewar/userscreens/matchpage.dart';
import 'package:sewar/userscreens/homepage.dart';
import 'package:sewar/userscreens/insidchat.dart';
import 'package:sewar/companyscreens/aimodels.dart';

class DataScreen extends StatefulWidget {
  final bool isDark;
  const DataScreen({Key? key, required this.isDark}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final PageController _pageController = PageController();
  int currentTab = 0;

  void _onTabTapped(int index) {
    setState(() {
      currentTab = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDark;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          //   خلفية
          Container(
            decoration: AppStyles.companybackgroundDecoration(isDark: isDark),
          ),

          //   المحتوى
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),

                //   العنوان
                const Center(
                  child: Text(
                    'Data',
                    style: TextStyle(
                      fontFamily: 'Title',
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                //   الشريط العلوي للتنقل
                Center(
                  child: Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Blur(
                            blur: 11.4,
                            colorOpacity: 0.15,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    const Color.fromARGB(
                                      255,
                                      146,
                                      146,
                                      146,
                                    ).withOpacity(0.40),
                                    const Color.fromARGB(
                                      255,
                                      97,
                                      95,
                                      95,
                                    ).withOpacity(0.40),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(4, (index) {
                              final List<String> icons = [
                                currentTab == 0
                                    ? 'assets/company/icons/sellectedaudienceicon.png'
                                    : 'assets/company/icons/unsellectedaudienceicon.png',
                                currentTab == 1
                                    ? 'assets/company/icons/sellectedmatchicon.png'
                                    : 'assets/company/icons/unsellectedmatchicon.png',
                                currentTab == 2
                                    ? 'assets/company/icons/sellectedcompanyicon.png'
                                    : 'assets/company/icons/unsellectedcompanyicon.png',
                                currentTab == 3
                                    ? 'assets/company/icons/sellectedaidataicon.png'
                                    : 'assets/company/icons/unsellectedaidataicon.png',
                              ];

                              return GestureDetector(
                                onTap: () => _onTabTapped(index),
                                child: Image.asset(
                                  icons[index],
                                  width: 26,
                                  height: 26,
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                //   PageView للتنقل بين المحتوى
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      OtherDataPage(tabIndex: 0), // التبويب الأول
                      OtherDataPage(tabIndex: 1),
                      OtherDataPage(tabIndex: 2),
                      OtherDataPage(tabIndex: 3),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //   الشريط السفلي
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Blur(
                        blur: 11.4,
                        colorOpacity: 0.15,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color.fromARGB(
                                  255,
                                  146,
                                  146,
                                  146,
                                ).withOpacity(0.40),
                                const Color.fromARGB(
                                  255,
                                  97,
                                  95,
                                  95,
                                ).withOpacity(0.40),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => CompanyHomeScreen(
                                        isDark: widget.isDark,
                                      ),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/company/icons/unsellectedhomepageicon.png',
                              width: 26,
                              height: 26,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => CoMatchesScheduleScreen(
                                        isDark: widget.isDark,
                                      ),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/company/icons/unsellectedmatchpageicon.png',
                              width: 26,
                              height: 26,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => CompanyChatsScreen(
                                        isDark: widget.isDark,
                                      ),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/company/icons/unsellectedaipageicon.png',
                              width: 26,
                              height: 26,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) =>
                                          CompanyProfile(isDark: widget.isDark),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/company/icons/sellecteddatapageicon.png',
                              width: 26,
                              height: 26,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) =>
                                          CompanyProfile(isDark: widget.isDark),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/company/icons/unsellectedprofilepageicon.png',
                              width: 26,
                              height: 26,
                              color: AppStyles.icongray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
