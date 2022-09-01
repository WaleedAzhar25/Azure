import 'package:azur/utils/size/size_config.dart';
import 'package:azur/views/auth/signup/general_information/general_information_country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/widgets/TextView.dart';
import '../../../../utils/widgets/auth_input_text_field.dart';
import '../../../../utils/widgets/buttons.dart';

class GeneralInformationDateBirth extends StatefulWidget {
  const GeneralInformationDateBirth({Key? key}) : super(key: key);

  @override
  State<GeneralInformationDateBirth> createState() => _GeneralInformationDateBirthState();
}

class _GeneralInformationDateBirthState extends State<GeneralInformationDateBirth> {
  TextEditingController birthController = TextEditingController();
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
                    text: 'Date de naissance',
                    color: AppColors.lableTextField,
                    fontWeight: FontWeight.w400,
                    size: SizeConfig.textMultiplier*1.8,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AuthTextInputField(
                    textEditingController:birthController,
                    hintText: 'DD/MM/AAAA',
                    hintcolor: AppColors.lableTextField,
                    bordercolor: AppColors.lableTextField,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Veuillez entrer une valeur';
                      }
                      return null;
                    },
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    suffixIcon: IconButton(onPressed: (){

                    }, icon: Icon(Icons.calendar_today_outlined,color: AppColors.lableTextField,size: 22,)),
                    hintSize: SizeConfig.heightMultiplier*1.8,
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
                             Get.to(const GeneralInformationCountry());
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
