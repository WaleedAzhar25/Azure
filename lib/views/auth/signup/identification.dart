import 'dart:developer';
import 'dart:io';
import 'package:azur/utils/colors.dart';
import 'package:azur/views/auth/signup/agreement_policies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/size/size_config.dart';
import '../../../utils/widgets/TextView.dart';
import '../../../utils/widgets/buttons.dart';
import '../../../utils/widgets/identification_tile.dart';
class Identification extends StatefulWidget {
  const Identification({Key? key}) : super(key: key);

  @override
  State<Identification> createState() => _IdentificationState();
}

class _IdentificationState extends State<Identification> {
  File? result;

  Future scanImage() async {
    try {

      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image!=null){
       Get.dialog(
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    height: SizeConfig.heightMultiplier*25,
                    width: SizeConfig.widthMultiplier*75,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: TextView(text: 'Prennez une photo claire de',
                                size: SizeConfig.textMultiplier*2.2,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextView(text: 'votre visage pour s’identifier',
                              size: SizeConfig.textMultiplier*2.2,
                              fontWeight: FontWeight.w500,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50,right:50,top: 50,bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: PrimaryButton(
                                      text: "OK",
                                      textSize: 14,
                                      onTap: (){
                                        Get.to(const AgreementPoliciesScreen());
                                      },
                                      textColor: Colors.white,
                                      borderColor: AppColors.primaryColor,
                                      buttonColor:AppColors.primaryColor,),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              ),
            )
        );
      }
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => result = imageTemp);
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
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
            const Padding(
              padding:  EdgeInsets.all(20.0),
              child: TextView(
                text: 'Choisissez le document d’identification qui \nvous convient',
                color: Colors.black54,
              ),
            ),

             Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child:  IdentificatonTile(
                title: 'Carte d’identité',
                subtitle: 'Issue en ‘pays de résidence’',
                onTap: ()async{
                  await scanImage();
              },),
            ),
             IdentificatonTile(
               title: 'Passeport',
               subtitle: 'Issue en ‘pays de résidence’',
               onTap: (){

               },),
             Padding(
              padding:  const EdgeInsets.symmetric(vertical: 10),
              child: IdentificatonTile(
                title: 'Carte de séjour',
                subtitle: 'Issue en ‘pays de résidence’',
                  onTap: (){}),
            ),

          ],
        ),
      ),
    );
  }
}

