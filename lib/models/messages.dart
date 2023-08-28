import 'package:KomyChat/widgets/consts.dart';


class Messages {
  final String message;
  final String id;
  Messages(this.message,this.id);

  factory Messages.fromJson(jasonData) {
    return Messages(jasonData[KMessages],jasonData[KId]);
  }
}
