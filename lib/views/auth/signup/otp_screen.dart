import 'package:azur/utils/constants.dart';
import 'package:azur/utils/size/size_config.dart';
import 'package:azur/views/auth/signup/identification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../utils/colors.dart';
import '../../../utils/widgets/TextView.dart';
import '../../../utils/widgets/buttons.dart';
class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var otp='';
  var text='PIN de votre compte Azur';
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
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      Get.back();
                    }, icon: const Icon(Icons.arrow_back_sharp,color: Colors.black,)),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: TextView(text: "Sécurité",
                        size: SizeConfig.textMultiplier*2.7,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Align(
                  alignment: Alignment.center,
                  child: TextView(
                      text: text,
                    size: SizeConfig.textMultiplier*2,
                  ),
                ),
              ),
              OTPTextField(

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
                    text='Confirmer le PIN';
                  });
                },
              ),
              SizedBox(height: SizeConfig.heightMultiplier*20,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:30),
                child: Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        text: 'Continuer',
                        onTap: (){
                          Get.to(const Identification());
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

            ],
          ),
        ),
      ),
    );
  }
}
