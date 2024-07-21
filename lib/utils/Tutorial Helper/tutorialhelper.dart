// video_downloader_logic.dart
import 'package:video_downloader/utils/Langauge%20Helper/GetShowbool.dart';
import 'package:video_downloader/utils/Social%20Media%20Enum/Socialmediaenum.dart';

class VideoDownloaderLogic {
  static Future<Map<SocialMedia, bool>> retrieveShowValues() async {
    final Map<SocialMedia, bool> showValues = {};
    for (final socialMedia in SocialMedia.values) {
      final show = await SharedPreferencesHelper.retrieveShowTutorialValueForSocialMedia(
          socialMedia);
      showValues[socialMedia] = show;
    }
    return showValues;
  }

  static Future<void> updateShowValue(
      bool value, SocialMedia socialMedia) async {
        await SharedPreferencesHelper.setShowTutorialValueForSocialMedia(socialMedia, value);
      }
}
