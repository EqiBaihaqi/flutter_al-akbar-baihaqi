import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form/login_page.dart';
import 'package:form/text_form.dart';
import 'package:form/widget/text_form_custom.dart';

void main() {
  testWidgets("Test Title di Login Page", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
      ),
    );
    await tester.pumpAndSettle();
    await tester.pump();
    final text = find.text('Login Page');
    expect(text, findsOneWidget);
  });

  testWidgets("Memiliki 2 textform field dengan label nama dan nomor",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Textform(),
      ),
    );
        await tester.pumpAndSettle();
    await tester.pump();
    const nameLabelText = 'Name';
    const nomorLabelText = 'Nomor';
    final labelTextName = find.byWidgetPredicate(
      (widget) =>
          widget is TextFormFieldCustom && widget.labelText == nameLabelText,
    );
    final labelTextNomor = find.byWidgetPredicate(
      (widget) =>
          widget is TextFormFieldCustom && widget.labelText == nomorLabelText,
    );
    expect(labelTextName, findsOneWidget);
    expect(labelTextNomor, findsOneWidget);
  });
}
