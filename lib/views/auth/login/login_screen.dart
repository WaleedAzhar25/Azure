import 'package:azur/utils/widgets/TextView.dart';
import 'package:azur/views/auth/login/otp_login.dart';
import 'package:azur/views/auth/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/colors.dart';
import '../../../utils/size/size_config.dart';
import '../../../utils/widgets/auth_input_text_field.dart';
import '../../../utils/widgets/buttons.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20),
                child: IconButton(onPressed: (){
                  Get.back();
                }, icon: const Icon(Icons.arrow_back_sharp,color: Colors.black,)),
              ),
              SizedBox(height: SizeConfig.heightMultiplier*10,),
               Align(
                 alignment: Alignment.center,
                 child: TextView(
                    text: "Bienvenue à Azur",
                    size: SizeConfig.textMultiplier*3,
                   fontWeight: FontWeight.w600,
              ),
               ),
              SizedBox(height: SizeConfig.heightMultiplier*10,),
              TextView(
                text: 'Pseudonym',
                color: AppColors.lableTextField,
                fontWeight: FontWeight.w400,
                size: SizeConfig.textMultiplier*1.8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AuthTextInputField(
                  hintText: 'Saisissez votre pseudonym',
                  textInputAction: TextInputAction.done,
                  hintcolor: AppColors.lableTextField,
                  bordercolor: AppColors.lableTextField,
                  hintSize: SizeConfig.textMultiplier*1.8,
                  leftPadding: 20,
                  topPadding: 20,
                  bottomPadding: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        text: 'Connexion',
                        onTap: (){
                          Get.to(const OtpLoginScreen());
                        },
                        textColor: Colors.white,
                        borderColor: AppColors.primaryColor,
                        buttonColor: AppColors.primaryColor,
                        textSize: SizeConfig.textMultiplier*2,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:const EdgeInsets.symmetric(vertical: 30),
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: (){
                      Get.to(const SignupScreen());
                    },
                    child: const TextView(
                      text: 'Vous avez oublié votre pseudonym ?',
                      color: Colors.black,

                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
