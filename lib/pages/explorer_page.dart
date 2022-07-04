import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museum/helpers/data/data_dummy.dart';
import '../ui/general/general_widget.dart';
import '../ui/responsive/responsive.dart';
import '../ui/widgets/item_slider_3_widget.dart';
import 'artist_page.dart';

class ExplorerPage extends StatelessWidget {
  const ExplorerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(ResponsiveUI.of(context).hp(10));

    ResponsiveUI _responsive = ResponsiveUI(context);
    print(_responsive.wp(10));
    print(_responsive.hp(3));

    print(ResponsiveUI.pWidth(context, 0.5));
    print(ResponsiveUI.pHeight(context, 0.3));

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: imagesDummy.map((e) {
                  return Container(
                    height: 180,
                    margin: const EdgeInsets.only(right: 12.0),
                    width: ResponsiveUI.of(context).wp(85),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          e,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            divider30,
            const Text(
              "Categorías",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            divider20,
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ItemSlider3Widget(
                    image:
                        "https://images.pexels.com/photos/3778355/pexels-photo-3778355.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    title: "Artistas",
                    toPage: ArtistPage(),
                  ),
                  ItemSlider3Widget(
                    image:
                        "https://images.pexels.com/photos/7375049/pexels-photo-7375049.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    title: "Técnicas",
                    toPage: ArtistPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
