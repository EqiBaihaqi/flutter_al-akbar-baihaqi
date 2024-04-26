import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form/profile_page.dart';

void main() {
  testWidgets('ProfilePage UI Test', (WidgetTester tester) async {
 
    await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

 
    final profilePhotoFinder = find.byKey(const Key('profile_photo'));
    final usernameFinder = find.byKey(const Key('username'));

    // Memastikan apakah foto profile ada
    expect(profilePhotoFinder, findsOneWidget);

    // Memastikan apakah ada username
    expect(usernameFinder, findsOneWidget);
  });
}
