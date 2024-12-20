import 'package:flutter/material.dart';

void main() {
  runApp(MySalaryApp());
}

class MySalaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.deepPurple,
      ),
      home: SalaryCalculatorScreen(),
    );
  }
}

class SalaryCalculatorScreen extends StatefulWidget {
  @override
  _SalaryCalculatorScreenState createState() => _SalaryCalculatorScreenState();
}

class _SalaryCalculatorScreenState extends State<SalaryCalculatorScreen> {
  final TextEditingController _hoursController = TextEditingController();
  String _result = '';

  double calculateSalary(int hours) {
    if (hours <= 40) {
      return hours * 400;
    } else {
      int extraHours = hours - 40;
      return (40 * 400) + (extraHours * 600);
    }
  }

  void handleCalculate() {
    final int hours = int.tryParse(_hoursController.text) ?? 0;
    final double salary = calculateSalary(hours);

    setState(() {
      _result = 'Total Salary: Tk $salary';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculate Your Salary',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter Your Work Hours:',
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepOrangeAccent,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _hoursController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.deepOrangeAccent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'Hours Worked',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleCalculate,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Calculate Salary',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _result.isEmpty ? 'Result will appear here.' : _result,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
