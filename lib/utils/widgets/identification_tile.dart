import 'package:azur/utils/size/size_config.dart';
import 'package:flutter/material.dart';
import 'TextView.dart';
class IdentificatonTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function() onTap;
  const IdentificatonTile({
    Key? key, required this.title,required this.subtitle, required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.widthMultiplier*100,
        height: SizeConfig.heightMultiplier*12,
        decoration:  BoxDecoration(
            color:const Color(0xffEFF0F3),
            borderRadius: BorderRadius.circular(16)
        ),
        child: Card(
          color:const Color(0xffEFF0F3),
          elevation: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextView(text: title,
                    color: Colors.black,
                    size:  SizeConfig.textMultiplier*2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextView(text: subtitle,
                      color: Colors.black38,
                      size: SizeConfig.textMultiplier*1.5,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios,size: 18,color: Colors.black,)
            ],
          ),
        ),
      ),
    );
  }
}
