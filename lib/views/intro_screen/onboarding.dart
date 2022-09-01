import 'package:azur/utils/colors.dart';
import 'package:azur/utils/widgets/buttons.dart';
import 'package:azur/views/auth/login/login_screen.dart';
import 'package:azur/views/auth/signup/signup_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/onBoarding_model.dart';
import '../../utils/size/size_config.dart';

class Onborading extends StatefulWidget {
  const Onborading({Key? key}) : super(key: key);

  @override
  State<Onborading> createState() => _OnboradingState();
}

class _OnboradingState extends State<Onborading> {
  int currentIndex = 0;
   PageController? _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: PageView.builder(
                      onPageChanged: (int index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemCount: onBoardingContent.length,
                      itemBuilder: (_, i) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 1,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(onBoardingContent[i].image),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Container(
                            margin:const EdgeInsets.symmetric(horizontal: 15),
                            child: null,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier*5,
                  ),
                   Text(
                    'Bienvenue à Azur',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier*6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            contentPadding: 20,
                            buttonColor: AppColors.primaryColor,
                            text: "Connexion",

                            onTap: (){
                              Get.offAll(const LoginScreen());
                            },
                            textColor: Colors.white, borderColor:AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            contentPadding: 20,
                            buttonColor: Colors.white,
                            text: "S’inscrire",
                            onTap: (){
                              Get.offAll(const SignupScreen());
                            },
                            textColor: AppColors.primaryColor, borderColor:AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.23,
              child: Image.asset('assets/images/Vector.png')),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.54,
            child: DotsIndicator(
              decorator: DotsDecorator(
                activeColor: Colors.white,
                color: Colors.grey,
                size: const Size(10.0, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                activeSize: const Size(10.0, 10),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              dotsCount: onBoardingContent.length,
              position: double.parse(currentIndex.toString()),
            ),
          ),
        ],
      ),
    );
  }
}



