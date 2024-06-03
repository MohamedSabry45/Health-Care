//onboarding Screen
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/asset_manger.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/core/theme/app_colors.dart';
import 'package:gp/routes/routes_names.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController(keepPage: false);
  double currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onBoardingBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            if (currentIndex != 2)
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: TextButton(
                  onPressed: () {
                    pageController.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index.toDouble();
                    });
                  },
                  children: [
                    OnboardingPage(
                      title: 'know your disease',
                      description:
                          'Discover what disease you may have based on your symptoms',
                      image: AssetManger.onboarding_3,
                    ),
                    OnboardingPage(
                      title: 'All Reports',
                      description:
                          'Here you can add your reports so that you can get the best service and treatment',
                      image: AssetManger.onboarding_4,
                    ),
                    OnboardingPage(
                      title: 'Regular appointments',
                      description:
                          'Here you will be notified of your appointments on a regular basis, and all notifications will be on time',
                      image: AssetManger.onboarding_2,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: context.propHeight(40)),

            // Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OnboardingIndicator(
                  index: 0,
                  currentIndex: currentIndex,
                ),
                const SizedBox(width: 20),
                OnboardingIndicator(
                  index: 1,
                  currentIndex: currentIndex,
                ),
                const SizedBox(width: 20),
                OnboardingIndicator(
                  index: 2,
                  currentIndex: currentIndex,
                ),
              ],
            ),

            SizedBox(height: context.propHeight(40)),

            // Next button
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                width: context.propWidth(210),
                onPressed: () {
                  if (currentIndex < 2) {
                    pageController.animateToPage(
                      currentIndex.toInt() + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  } else {
                    Modular.to.navigate(AppRoutes.login);
                    //set onboarding to false
                    
                  }
                },
                title: currentIndex < 2 ? 'Next' : 'Get Started',
              ),
            ),

            SizedBox(height: context.propHeight(40)),
          ],
        ),
      ),
    );
  }
}

// Onboarding page
class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: double.infinity,
            height: context.propHeight(225),
          ),
          const SizedBox(height: 20),
          Divider(
            color: Colors.yellow,
            thickness: 2,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
            softWrap: true,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w200,
              color: Color.fromARGB(244, 26, 21, 21),
            ),
          ),
        ],
      ),
    );
  }
}

// Onboarding indicator
class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({
    Key? key,
    required this.index,
    required this.currentIndex,
  }) : super(key: key);

  final int index;
  final double currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: context.propWidth(24),
      height: context.propHeight(24),
      decoration: BoxDecoration(
        color: index == currentIndex ? Colors.grey : Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
        shape: BoxShape.circle,
      ),
    );
  }
}

// Custom button
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.radius,
    this.width,
    this.height,
  }) : super(key: key);

  final String title;
  final Function() onPressed;
  final Color? backgroundColor;
  final double? radius;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: context.propHeight(15)),
      minWidth: width ?? double.infinity,
      height: height,
      color: backgroundColor ?? AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 16),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: context.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
