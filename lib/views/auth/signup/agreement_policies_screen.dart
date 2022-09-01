import 'package:azur/utils/colors.dart';
import 'package:azur/utils/size/size_config.dart';
import 'package:azur/views/auth/signup/add_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/widgets/TextView.dart';
import '../../../utils/widgets/buttons.dart';
class AgreementPoliciesScreen extends StatefulWidget {
  const AgreementPoliciesScreen({Key? key}) : super(key: key);

  @override
  State<AgreementPoliciesScreen> createState() => _AgreementPoliciesScreenState();
}

class _AgreementPoliciesScreenState extends State<AgreementPoliciesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,bottom: 20),
                    child: IconButton(onPressed: (){
                      Get.back();
                    }, icon: const Icon(Icons.arrow_back_sharp,color: Colors.black,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextView(
                          text: 'Réglements et politique Azur',
                      size: SizeConfig.textMultiplier*2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextView(
                        color: AppColors.lableTextField,
                        size: SizeConfig.textMultiplier*1.8,
                        text: "Texte explicatif, le reste est a ignoré . Lorem ipsum dolor sit amet, "
                        "consectetur adipiscing elit. Donec quisque at diam enim elit aliquet enim volutpat. Justo ullamcorper sapien nibh eleifend amet, praesent lectus sed. Eget nec elementum aenean "
                        "elementum arcu mauris praesent arcu. Semper at scelerisque faucibus sed fringilla in mattis. Cras pellentesque volutpat, massa in fringilla sed Quam elementum cursus viverra tellus feugiat. Volutpat dolor facilisi augue porta in.Justo ullamcorper sapien nibh eleifend amet, praesent lectus sed. Eget nec elementum aenean elementum arcu mauris praesent arcu. Semper at scelerisque faucibus sed fringilla in mattis. Cras pellentesque volutpat, massa in fringilla sed.Quam elementum cursus viverra tellus feugiat. Volutpat dolor facilisi augue porta in"
                            "Texte explicatif, le reste est a ignoré . Lorem ipsum dolor sit amet, "
                    "consectetur adipiscing elit. Donec quisque at diam enim elit aliquet enim volutpat. Justo ullamcorper sapien nibh eleifend amet, praesent lectus sed. Eget nec elementum aenean "
                    "elementum arcu mauris praesent arcu. Semper at scelerisque faucibus sed fringilla in mattis. Cras pellentesque volutpat, massa in fringilla sed Quam elementum cursus viverra tellus feugiat. Volutpat dolor facilisi augue porta in.Justo ullamcorper sapien nibh eleifend amet, praesent lectus sed. Eget nec elementum aenean elementum arcu mauris praesent arcu. Semper at scelerisque faucibus sed fringilla in mattis. Cras pellentesque volutpat, massa in fringilla sed.Quam elementum cursus viverra tellus feugiat. Volutpat dolor facilisi augue porta in"),
                  ),
                ],
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          text: 'Accepter et continuer',
                          onTap: (){
                            Get.to(const AddMapScreen());
                          },
                          textColor: Colors.white,
                          borderColor: AppColors.primaryColor,
                          buttonColor: AppColors.primaryColor,
                          textSize: SizeConfig.textMultiplier*1.8,
                        ),
                      ),
                    ],
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
