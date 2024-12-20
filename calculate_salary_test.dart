import 'package:flutter_test/flutter_test.dart';
import 'package:salary_final/salary_calculator_test.dart';
//import 'package:salary_test/salary_calculator.dart'; // Adjust the path to your main.dart file

void main() {
  test('Salary for 35 hours', () {
    expect(calculateSalary(35), 14000);
  });

  test('Salary for 45 hours', () {
    expect(calculateSalary(45), 19000);
  });
}