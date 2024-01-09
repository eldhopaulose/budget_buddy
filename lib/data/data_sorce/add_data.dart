import 'package:budget_buddy/constants/constants.dart';
import 'package:budget_buddy/domain/entities/model/money.dart';
import 'package:hive/hive.dart';

Future<void> addExpance({required String money, required String topic}) async {
  await Hive.openBox<Moneys>(moneyBox);
  // Open a box named 'myBox'
  var box = Hive.box<Moneys>(moneyBox);

  // Create an instance of Moneys and set its properties
  var moneyInstance = Moneys(totalMoney: money, topic: topic);

  // Add the instance to the box
  box.put('moneyInstance', moneyInstance);

  // Print the totalMoney property of the stored instance
  print(box.get('moneyInstance'));

  // Print all values in the box
  print(box.get('moneyInstance'));

  // Close the box when done
  await box.close(); // Uncomment this line
}

Future<Moneys?> getAllData() async {
  // Open a box named 'myBox'
  var box = await Hive.openBox<Moneys>(moneyBox);

  var storedInstance = box.get('moneyInstance');
  print(
      "Total Money: ${storedInstance?.totalMoney}, Topic: ${storedInstance?.topic}");

  // // Close the box when done
  // await box.close();

  // Check if the moneyInstance is not null and then print the values

  return storedInstance;
}
