import 'package:eltagweed_elmoyasar/core/helpers/constants.dart';
import 'package:share_plus/share_plus.dart';

void shareAppLink() {
  const String message = "حمل الان تطبيق التجويد الميسر: $appLink";
  Share.share(message);
}
