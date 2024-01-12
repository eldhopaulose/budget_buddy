import 'package:budget_buddy/constants/constants.dart';
import 'package:budget_buddy/domain/entities/model/income.dart';
import 'package:budget_buddy/domain/entities/model/money.dart';
import 'package:hive/hive.dart';

Future<void> addExpance({required String money, required String topic}) async {
  // Open a box named 'moneysbox'
  final moneyBox = await Hive.openBox<Moneys>(moneyBoxDb);

  // Create an instance of Moneys and set its properties
  final moneyInstance = Moneys(totalMoney: money, topic: topic);
  final incomeInstance = Income(incomeMoney: money, topics: topic);

  // Add the instance to the box
  await moneyBox.put('moneyInstance', moneyInstance);

  // Close the 'moneysbox' when done with it
  await moneyBox.close();

  // Open a box named 'incomebox'
  final incomeBox = await Hive.openBox<Income>(moneyBoxDb);
  // Add the income instance to the 'incomebox'
  await incomeBox.add(incomeInstance);

  // Print all values in the 'incomebox'
  print(incomeBox
      .get("incomeInstance")
      ?.incomeMoney); // Adjust the index as needed

  // Close the 'incomebox' when done with it
  await incomeBox.close();
}

Future<Moneys?> getAllData() async {
  // Open a box named 'myBox'
  var box = await Hive.openBox<Moneys>(moneyBoxDb);

  var storedInstance = box.get('moneyInstance');

  return storedInstance;
}
