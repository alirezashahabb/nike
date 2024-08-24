import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike/screen/home/home_screen.dart';
import 'package:nike/theme.dart';

class RootScreens extends StatefulWidget {
  const RootScreens({super.key});

  @override
  State<RootScreens> createState() => _RootScreensState();
}

class _RootScreensState extends State<RootScreens> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme themeData = Theme.of(context).textTheme;
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: getLayOut(),
      ),
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            currentIndex: selectedIndex,
            selectedLabelStyle: themeData.bodyMedium,
            unselectedLabelStyle: themeData.bodyMedium,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: LightThemeColors.secondaryColor,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          )
                        ],
                      ),
                      child: const Icon(CupertinoIcons.home),
                    ),
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: LightThemeColors.secondaryColor,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          )
                        ],
                      ),
                      child: const Icon(CupertinoIcons.home),
                    ),
                  ),
                  label: 'خانه'),
              BottomNavigationBarItem(
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: LightThemeColors.secondaryColor,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          )
                        ],
                      ),
                      child: const Icon(CupertinoIcons.cart),
                    ),
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: LightThemeColors.secondaryColor,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          )
                        ],
                      ),
                      child: const Icon(CupertinoIcons.cart),
                    ),
                  ),
                  label: 'سبد خرید'),
              BottomNavigationBarItem(
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: LightThemeColors.secondaryColor,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          )
                        ],
                      ),
                      child: const Icon(CupertinoIcons.person),
                    ),
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: LightThemeColors.secondaryColor,
                              spreadRadius: -7,
                              offset: Offset(0, 13),
                            )
                          ],
                        ),
                        child: const Icon(CupertinoIcons.person)),
                  ),
                  label: 'پروفایل'),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getLayOut() {
    return <Widget>[
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];
  }
}
