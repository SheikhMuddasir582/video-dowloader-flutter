import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_downloader/components/Custom%20Text%20Widgets/CustomTextWidget.dart';
import 'package:video_downloader/utils/Langauge%20Helper/Getsavedlanguage.dart';
import 'package:video_downloader/view/Langauge%20Screens/language_selection.dart';

class Langaugeoptions extends StatefulWidget {
  const Langaugeoptions({
    super.key,
  });

  @override
  State<Langaugeoptions> createState() => _LangaugeoptionsState();
}

class _LangaugeoptionsState extends State<Langaugeoptions> {
  String? language;

  @override
  void initState() {
    super.initState();
    Langaugegetter.getSavedLanguage().then((value) {
      setState(() {
        language = value;
      });
    });
  }

  String selectedValue = 'Default';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: Get.width * 0.035,
              ),
              CustomText(text: 'Language Options'.tr),
              InkWell(
                onTap: () {
                  Get.to(LanguageSelection(
                    Settingpage: true,
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.4),
                    child: DropdownButton<String>(
                      hint: Text(language == null ? '' : language.toString()),
                      value: selectedValue,
                      onChanged: (String? value) {},
                      items: null,
                      underline: Container(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
