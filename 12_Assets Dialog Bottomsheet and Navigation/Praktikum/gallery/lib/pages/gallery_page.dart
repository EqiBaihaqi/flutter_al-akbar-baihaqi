import 'package:assets_dialogbottomsheet_navgator/model/list_image_model.dart';
import 'package:assets_dialogbottomsheet_navgator/view_image.dart';
import 'package:assets_dialogbottomsheet_navgator/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF211134),
        title: const Text('Gallery'),
        centerTitle: true,
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: ImageUrlModel.images.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          title: const Text('View Full Image ?'),
                          content: SizedBox(
                            width: 300,
                            height: 300,
                            child: Image.network(
                              ImageUrlModel.images[index],
                              fit: BoxFit.contain,
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel')),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ViewImage(
                                                image:
                                                    ImageUrlModel.images[index],
                                              )));
                                },
                                child: Text('Open'))
                          ]);
                    });
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ViewImage()));
              },
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white38),
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: NetworkImage(ImageUrlModel.images[index]),
                        fit: BoxFit.cover)),
              ),
            );
          }),
    );
  }
}
