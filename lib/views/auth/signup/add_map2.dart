import 'package:azur/views/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/widgets/TextView.dart';
import '../../../../utils/widgets/auth_input_text_field.dart';
import '../../../../utils/widgets/buttons.dart';
import '../../../utils/size/size_config.dart';
class AddMap2Screen extends StatefulWidget {
  const AddMap2Screen({Key? key}) : super(key: key);

  @override
  State<AddMap2Screen> createState() => _AddMap2ScreenState();
}

class _AddMap2ScreenState extends State<AddMap2Screen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController preNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  const EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
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
                      child: TextView(text: "Ajouter une carte",
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
                  text: 'Titulaire de la carte',
                  color: AppColors.lableTextField,
                  fontWeight: FontWeight.w400,
                  size: SizeConfig.textMultiplier*1.8,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AuthTextInputField(
                  textEditingController:nameController,
                  hintText: 'Saisissez le nom et prenom',
                  hintcolor: AppColors.lableTextField,
                  bordercolor: AppColors.lableTextField,
                  hintSize: SizeConfig.textMultiplier*1.8,
                  leftPadding: 20,
                  topPadding: 20,
                  bottomPadding: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: defaultPadding,),
                child: TextView(
                  text: 'Numero de la carte',
                  color: AppColors.lableTextField,
                  fontWeight: FontWeight.w400,
                  size: SizeConfig.textMultiplier*1.8,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AuthTextInputField(
                  textEditingController: preNameController,
                  hintText: 'Saisissez le numero de la carte',
                  textInputAction: TextInputAction.next,
                  hintcolor: AppColors.lableTextField,
                  bordercolor: AppColors.lableTextField,
                  hintSize: SizeConfig.textMultiplier*1.8,
                  leftPadding: 20,
                  topPadding: 20,
                  bottomPadding: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: SizeConfig.widthMultiplier*40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: "Date de validité",
                            size: SizeConfig.textMultiplier*1.8,
                            color: AppColors.lableTextField,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: AuthTextInputField(
                                hintText: 'MM/AA',
                              textInputAction: TextInputAction.next,
                              hintcolor: AppColors.lableTextField,
                              bordercolor: AppColors.lableTextField,
                              hintSize: SizeConfig.textMultiplier*1.8,
                              leftPadding: 40,
                              topPadding: 20,
                              bottomPadding: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: SizeConfig.widthMultiplier*40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: "CVV",
                            size: SizeConfig.textMultiplier*1.8,
                            color: AppColors.lableTextField,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: AuthTextInputField(
                                hintText: '3 chiffres',
                              textInputAction: TextInputAction.next,
                              hintcolor: AppColors.lableTextField,
                              bordercolor: AppColors.lableTextField,
                              hintSize: SizeConfig.textMultiplier*1.8,
                              leftPadding: 40,
                              topPadding: 20,
                              bottomPadding: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TextView(
                text: 'Adresse de facturation',
                color: AppColors.lableTextField,
                fontWeight: FontWeight.w400,
                size: SizeConfig.textMultiplier*1.8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AuthTextInputField(
                  textEditingController: preNameController,
                  hintText: 'Saisissez l’adresse',
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
                        text: 'Confirmer',
                        onTap: (){
                          Get.offAll(const LoginScreen());
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
