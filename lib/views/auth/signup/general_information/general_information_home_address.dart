import 'package:azur/utils/size/size_config.dart';
import 'package:azur/views/auth/signup/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/widgets/TextView.dart';
import '../../../../utils/widgets/auth_input_text_field.dart';
import '../../../../utils/widgets/buttons.dart';

class GeneralInformationHomeAddress extends StatefulWidget {
  const GeneralInformationHomeAddress({Key? key}) : super(key: key);

  @override
  State<GeneralInformationHomeAddress> createState() => _GeneralInformationHomeAddressState();
}

class _GeneralInformationHomeAddressState extends State<GeneralInformationHomeAddress> {
  TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        Get.back();
                      }, icon: const Icon(Icons.arrow_back_sharp,color: Colors.black,)),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextView(text: "Informations générales",
                          size: SizeConfig.textMultiplier*2.7,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50,),
                  child: TextView(
                    text: 'Adresse de résidence',
                    color: AppColors.lableTextField,
                    fontWeight: FontWeight.w400,
                    size: SizeConfig.textMultiplier*1.8,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AuthTextInputField(
                    textEditingController:addressController,
                    hintText: '34 Rue des fleurs, Paris, 50251',
                    hintcolor: AppColors.lableTextField,
                    bordercolor: AppColors.lableTextField,
                     validator: (value){
                      if(value!.isEmpty){
                        return 'Veuillez entrer l\'adresse';
                      }
                     },
                    textInputAction: TextInputAction.done,
                    hintSize: SizeConfig.textMultiplier*1.8,
                    leftPadding: 20,
                    topPadding: 20,
                    bottomPadding: 20,
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier*15,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          text: 'Continuer',
                          onTap: (){
                            if(_formKey.currentState!.validate()){
                              Get.to(const OtpScreen());
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
              ],
            ),
          ),
        ),
      ),

    );
  }
}
