import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form/login_page.dart';

void main() {
  testWidgets("Test Title di Login Page", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
      ),
    );

    final text = find.text('Login Page');
    expect(text, findsOneWidget);
  });
  testWidgets('Test hintText TextFormField username dan password',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginPage(),
    ));

    Finder findTextFormField = find.byType(TextFormField);
    // Melakukan pengecekan apakah ada widgewt textformfield
    expect(findTextFormField, findsWidgets);
    // Melakukan pengecekan apakah ada Text Username (pada hint text Text Form Field)
    expect(find.text('Username'), findsOneWidget);
    // Melakukan pengecekan apakah ada Text Password (pada hint text Text Form Field)
    expect(find.text('Password'), findsOneWidget);
  });

  testWidgets('Elevated Button Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginPage(),
    ));

    Finder findElevatedButton = find.byType(ElevatedButton);
    // Melakukan pengecekan apakah ada widget elevated button
    expect(findElevatedButton, findsOneWidget);
    //melakukan pengecekan apakah elevated button bisa di tap
    final submitButtonFinder = find.widgetWithText(ElevatedButton, 'Login');
    await tester.tap(submitButtonFinder);
  });
}
