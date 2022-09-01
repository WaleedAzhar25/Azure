import 'package:azur/utils/size/size_config.dart';
import 'package:azur/views/auth/signup/add_map2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/colors.dart';
import '../../../utils/widgets/TextView.dart';
import '../../../utils/widgets/buttons.dart';
class AddMapScreen extends StatefulWidget {
  const AddMapScreen({Key? key}) : super(key: key);

  @override
  State<AddMapScreen> createState() => _AddMapScreenState();
}

class _AddMapScreenState extends State<AddMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Padding(
         padding: const EdgeInsets.all(20.0),
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
                       size: SizeConfig.textMultiplier*2.3,
                       color: Colors.black,
                       fontWeight: FontWeight.w500,
                     ),
                   ),
                 ],
               ),
             ),
              Padding(
                padding: const EdgeInsets.only(top: 30,),
                child: Align(
                 alignment: Alignment.center,
                 child: TextView(
                     text: 'Ajouter une carte de débit ou de ',
                 size: SizeConfig.textMultiplier*1.8,
                   fontWeight: FontWeight.w500,
                 ),
             ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:5,bottom: 20),
                child: Align(
                 alignment: Alignment.center,
                 child: TextView(
                     text: 'crédit à votre compte Azur',
                 size: SizeConfig.textMultiplier*1.8,
                   fontWeight: FontWeight.w500,
                 ),
             ),
              ),
             SizedBox(height: SizeConfig.heightMultiplier*5,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
               child: Image.asset("assets/images/map.png"),
             ),
             SizedBox(height: SizeConfig.heightMultiplier*7,),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 20),
               child: Row(
                 children: [
                   Expanded(
                     child: PrimaryButton(
                       text: 'Ajouter une carte',
                       onTap: (){
                         Get.to(const AddMap2Screen());
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
             TextButton(onPressed: (){

             },
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: const [
                 Text("Plus tard",style: TextStyle(color: Colors.black),),
                 Icon(Icons.arrow_forward,color: Colors.black,)
               ],
             ))
           ],
         ),
       ),
    );
  }
}
