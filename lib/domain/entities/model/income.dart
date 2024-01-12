import 'package:hive/hive.dart';

part 'income.g.dart';

@HiveType(typeId: 2)
class Income {
  Income({this.id, this.incomeMoney, this.topics});
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? incomeMoney;

  @HiveField(2)
  String? topics;
}
