import 'package:azur/utils/constants.dart';
import 'package:azur/utils/size/size_config.dart';
import 'package:azur/views/auth/signup/general_information/general_information_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../utils/colors.dart';
import '../../../utils/widgets/TextView.dart';
import '../../../utils/widgets/buttons.dart';
class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  var otp='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: IconButton(onPressed: (){
                  Get.back();
                }, icon: const Icon(Icons.arrow_back_sharp,color: Colors.black,)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Align(
                  alignment: Alignment.center,
                  child: TextView(
                    text: "Code de vérification envoyé à votre",
                    size: SizeConfig.textMultiplier*2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10),
                child: Align(
                  alignment: Alignment.center,
                  child: TextView(
                    text: "numéro de téléphone",
                    size: SizeConfig.textMultiplier*2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: OTPTextField(

                  outlineBorderRadius: 5,
                  length: 5,
                  otpFieldStyle: OtpFieldStyle(
                      backgroundColor: Colors.blueGrey.withOpacity(0.1),
                      borderColor: Colors.transparent,
                      focusBorderColor: Colors.transparent,
                      enabledBorderColor: Colors.transparent
                  ),
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 50,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {
                    setState((){
                      otp=pin;
                    });
                  },
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier*20,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        text: 'Continuer',
                        onTap: (){
                            Get.to(const GeneralInformationScreen());
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

              SizedBox(height: SizeConfig.heightMultiplier*20,),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Align(
                  alignment: Alignment.center,
                  child: TextView(
                    text: "Vous n’avez pas reçu un code de ",
                    size: SizeConfig.textMultiplier*1.8,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:5),
                child: Align(
                  alignment: Alignment.center,
                  child: TextView(
                    text: "vérification ?",
                    size: SizeConfig.textMultiplier*1.8,
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
