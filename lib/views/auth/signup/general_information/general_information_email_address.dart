import 'package:azur/utils/size/size_config.dart';
import 'package:azur/views/auth/signup/general_information/general_information_date_of_birth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/widgets/TextView.dart';
import '../../../../utils/widgets/auth_input_text_field.dart';
import '../../../../utils/widgets/buttons.dart';

class GeneralInformationAddress extends StatefulWidget {
  const GeneralInformationAddress({Key? key}) : super(key: key);

  @override
  State<GeneralInformationAddress> createState() => _GeneralInformationAddressState();
}

class _GeneralInformationAddressState extends State<GeneralInformationAddress> {
  TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isValid=false;

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
                    text: 'Adresse Email',
                    color: AppColors.lableTextField,
                    fontWeight: FontWeight.w400,
                    size: SizeConfig.textMultiplier*1.8,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AuthTextInputField(
                    textEditingController:addressController,
                    hintText: 'Saisissez votre adresse mail',
                    validator: (value){
                      _isValid = EmailValidator.validate(addressController.text);
                      if (addressController.text.isEmpty || _isValid == false) {
                        return 'Entrez une adresse email valide';
                      }
                      return null;
                    },
                    hintcolor: AppColors.lableTextField,
                    bordercolor: AppColors.lableTextField,
                    textInputType: TextInputType.emailAddress,
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
                              Get.to(const GeneralInformationDateBirth());
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
