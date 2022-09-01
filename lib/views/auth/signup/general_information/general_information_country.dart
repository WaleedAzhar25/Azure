import 'package:azur/views/auth/signup/general_information/general_information_home_address.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/size/size_config.dart';
import '../../../../utils/widgets/TextView.dart';
import '../../../../utils/widgets/auth_input_text_field.dart';
import '../../../../utils/widgets/buttons.dart';

class GeneralInformationCountry extends StatefulWidget {
  const GeneralInformationCountry({Key? key}) : super(key: key);

  @override
  State<GeneralInformationCountry> createState() => _GeneralInformationCountryState();
}

class _GeneralInformationCountryState extends State<GeneralInformationCountry> {
  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryController.text='France';
  }
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
                  text: 'Pays de résidence',
                  color: AppColors.lableTextField,
                  fontWeight: FontWeight.w400,
                  size: SizeConfig.textMultiplier*1.8,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AuthTextInputField(
                  textEditingController:countryController,
                  hintText: '',
                  hintcolor: AppColors.lableTextField,
                  bordercolor: AppColors.lableTextField,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  suffixIcon: IconButton(onPressed: (){
                    showCountryPicker(
                      context: context,
                      countryListTheme: CountryListThemeData(
                        flagSize: 25,
                        backgroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
                        bottomSheetHeight: 500, // Optional. Country list modal height
                        //Optional. Sets the border radius for the bottomsheet.
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        //Optional. Styles the search field.
                        inputDecoration: InputDecoration(
                          labelText: 'Search',
                          hintText: 'Start typing to search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFF8C98A8).withOpacity(0.2),
                            ),
                          ),
                        ),
                      ),
                      onSelect: (Country country) {
                      setState((){
                        countryController.text=country.name;
                      });
                      });

                  }, icon: const Icon(CupertinoIcons.chevron_down,color: Colors.black,size: 20,)),
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
                            Get.to(const GeneralInformationHomeAddress());
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
