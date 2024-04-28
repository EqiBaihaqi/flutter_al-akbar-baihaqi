import 'package:flutter/material.dart';
import 'package:open_api_implement/page/result_page.dart';
import 'package:open_api_implement/service/recomendation_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _cameraController = TextEditingController();
  final TextEditingController _storageController = TextEditingController();

  bool isLoading = false;
  @override
  void dispose() {
    _budgetController.dispose();
    _cameraController.dispose();
    _storageController.dispose();
    super.dispose();
  }

  void _getRecomendation() async {
    setState(() {
      isLoading = true;
    });
    try {
      final result = await RecommendationService().getRecommendation(
          budget: _budgetController.text,
          pixelCamera: _cameraController.text,
          internalStorage: _storageController.text);
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              gptData: result,
            ),
          ),
        );
      }
    } catch (e) {
      final snackBar = SnackBar(
        content: Text('Terjadi Kesalahan $e'),
      );
      if (mounted) {
        // Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Recomendations'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            TextFormField(
              controller: _budgetController,
              decoration: const InputDecoration(
                labelText: 'Budget',
                hintText: 'Enter Your Budget in IDR',
              ),
            ),
            TextFormField(
              controller: _cameraController,
              decoration: const InputDecoration(
                labelText: 'Camera',
                hintText: 'Enter Your Camera in Pixel',
              ),
            ),
            TextFormField(
              controller: _storageController,
              decoration: const InputDecoration(
                labelText: 'Internal Storage',
                hintText: 'Enter Your Storage',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _getRecomendation();
                },
                child: const Text('Get Recomendation'))
          ],
        ),
      ),
    );
  }
}
