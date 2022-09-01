import 'package:azur/utils/size/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/widgets/TextView.dart';
import '../../../../utils/widgets/auth_input_text_field.dart';
import '../../../../utils/widgets/buttons.dart';
import 'general_Information_pseudonym_screen.dart';
class GeneralInformationScreen extends StatefulWidget {
  const GeneralInformationScreen({Key? key}) : super(key: key);

  @override
  State<GeneralInformationScreen> createState() => _GeneralInformationScreenState();
}

class _GeneralInformationScreenState extends State<GeneralInformationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController preNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  const EdgeInsets.all(defaultPadding),
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
                    text: 'Nom',
                    color: AppColors.lableTextField,
                    fontWeight: FontWeight.w400,
                    size: SizeConfig.textMultiplier*1.8,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AuthTextInputField(
                    textEditingController:nameController,
                    hintText: 'Saisissez votre Nom',
                    hintcolor: AppColors.lableTextField,
                    bordercolor: AppColors.lableTextField,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'S\'il vous plaît entrez votre nom';
                      }
                      return null;
                    },
                    hintSize: SizeConfig.textMultiplier*1.8,
                    leftPadding: 20,
                    topPadding: 20,
                    bottomPadding: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: defaultPadding,),
                  child: TextView(
                    text: 'Prénom',
                    color: AppColors.lableTextField,
                    fontWeight: FontWeight.w400,
                    size: SizeConfig.textMultiplier*1.8,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AuthTextInputField(
                    textEditingController: preNameController,
                    hintText: 'Saisissez votre prénom ',
                    textInputAction: TextInputAction.done,
                    hintcolor: AppColors.lableTextField,
                    bordercolor: AppColors.lableTextField,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'S\'il vous plaît entrez votre nom';
                      }
                      return null;
                    },
                    hintSize: SizeConfig.textMultiplier*1.8,
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
                          text: 'Continuer',
                          onTap: (){
                            if(_formKey.currentState!.validate()){
                              Get.to(const GeneralInformationPseudonym());
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
