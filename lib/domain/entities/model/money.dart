import 'package:hive/hive.dart';

part 'money.g.dart';

@HiveType(typeId: 1)
class Moneys {
  Moneys({this.id, this.totalMoney, this.topic});
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? totalMoney;

  @HiveField(2)
  String? topic;
}
