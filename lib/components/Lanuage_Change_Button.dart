import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_downloader/components/CustomTextWidget.dart';
import 'package:video_downloader/utils/Getsavedlanguage.dart';
import 'package:video_downloader/view/language_selection.dart';

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: Get.width * 0.04),
                child: CustomText(text: 'Language Options'.tr),
              ),
              Padding(
                padding: EdgeInsets.only(left: Get.width * 0.4),
                child: InkWell(
                  onTap: () {
                    Get.to(LanguageSelection(
                      Settingpage: true,
                    ));
                  },
                  child: Container(
                    width: Get.width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SingleChildScrollView(
                      child: DropdownButton<String>(
                        hint: Text(language.toString()),
                        value: selectedValue,
                        onChanged: (String? value) {},
                        items: null,
                        underline: Container(),
                      ),
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
