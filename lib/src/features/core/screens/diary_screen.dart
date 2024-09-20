import 'package:flutter/material.dart';
import 'package:med_diary/src/features/core/widgets/blood_glucose_count.dart';
import 'package:med_diary/src/features/core/widgets/bp_count.dart';

import '../widgets/custom_app_bar.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    //final textFieldWidth = screenWidth - 40;
    final sliderHeight = screenHeight - 200;

    const double padding = 21.0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            SizedBox(
              height: sliderHeight,
              child: PageView(
                controller: pageController,
                onPageChanged: (int index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: padding, right: padding),
                    height: sliderHeight,
                    //color: Colors.black,
                    child: const BPCount(),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: padding, right: padding),
                    height: sliderHeight,
                    //color: Colors.black,
                    child: const BloodGlucoseCount(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(2, (int index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 10,
                    width: currentPage == index ? 30 : 10,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: currentPage == index ? Colors.black : Colors.grey,
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
