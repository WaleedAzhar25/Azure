import 'package:azur/utils/colors.dart';
import 'package:azur/utils/constants.dart';
import 'package:azur/utils/size/size_config.dart';
import 'package:azur/utils/widgets/TextView.dart';
import 'package:azur/utils/widgets/auth_input_text_field.dart';
import 'package:azur/utils/widgets/buttons.dart';
import 'package:azur/views/auth/login/login_screen.dart';
import 'package:azur/views/auth/signup/verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController phoneController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            SizedBox(height: SizeConfig.heightMultiplier*10,),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextView(text: "Commencez votre inscription",
                          size: SizeConfig.textMultiplier*2.7,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextView(text: "si vous êtes déjà parrainé",
                          size: SizeConfig.textMultiplier*2.7,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50,),
                      child: TextView(
                        text: 'Numéro de téléphone',
                        color: AppColors.lableTextField,
                        fontWeight: FontWeight.w400,
                        size: SizeConfig.textMultiplier*1.8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: AuthTextInputField(
                        hintText: 'Saisissez votre numero',
                        hintcolor: AppColors.lableTextField,
                        textEditingController: phoneController,
                        bordercolor: AppColors.lableTextField,
                        hintSize: SizeConfig.textMultiplier*1.8,
                        textInputType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        validator: (value){
                          if(value!.length<13){
                            return 'Entrez un numéro de téléphone valide';
                          }
                          return null;
                        },
                        leftPadding: 20,
                        topPadding: 20,
                        bottomPadding: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              text: 'S’inscrire',
                              onTap: (){
                                if(_formKey.currentState!.validate()){
                                    Get.to(const Verification());
                                }
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
                      padding:const EdgeInsets.symmetric(vertical: 20),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: (){
                            Get.to(const LoginScreen());
                          },
                          child: const TextView(
                            text: 'Vous avez un code promotionnel   ?',
                            color: Colors.black,

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier*29,),
            Container(
              height: SizeConfig.heightMultiplier*5,
              width: SizeConfig.widthMultiplier*100,
              color: const Color(0xffF2F3F5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  TextView(
                    text: 'Savoir plus sur le parainage',
                    color: Colors.black54,
                  ),
                  SizedBox(width: 10,),
                  Icon(Icons.arrow_forward,color: Colors.black54,size: 16,)
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
