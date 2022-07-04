import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museum/ui/general/general_widget.dart';
import '../ui/general/colors.dart';
import '../ui/responsive/responsive.dart';
import '../ui/widgets/my_app_bar_widget.dart';

class ArtistDetailPage extends StatefulWidget {
  @override
  State<ArtistDetailPage> createState() => _ArtistDetailPageState();
}

class _ArtistDetailPageState extends State<ArtistDetailPage> {
  bool isExponded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: ResponsiveUI.pHeight(context, 0.45),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://www.salirconarte.com/wp-content/uploads/2017/08/vincent-van-gogh-9515695-3-402.jpg",
                      ),
                    ),
                  ),
                ),
                PreferredSize(
                  preferredSize: const Size(double.infinity, 64.0),
                  child: MyAppBar(),
                ),
              ],
            ),
            divider40,
            Text(
              "Vincent Van Gogh",
              style: TextStyle(color: Colors.white, fontSize: 28.0),
            ),
            divider12,
            Text(
              "Mar 30 1863 - jul 1890",
              style: TextStyle(color: Colors.white70, fontSize: 14.0),
            ),
            divider30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                  ),
                ),
                dividerWidth12,
                dividerWidth6,
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            divider30,
            //Contenido descriptivo:
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '''Nació el 30 de marzo de 1853. Hijo de un austero y humilde pastor protestante neerlandés llamado Theodorus y de su mujer Anna Cornelia, Vincent recibió el mismo nombre que le habían puesto a un hermano que nació muerto exactamente un año antes. El 1 de mayo de 1857 nació su hermano Theo y ambos tuvieron cuatro hermanos más: Cornelius Vincent, Elisabetha Huberta, Anna Cornelia y Wilhelmina Jacoba.
Durante la infancia acudió a la escuela de manera discontinua e irregular, pues sus padres le enviaron a diferentes internados. El primero de ellos en Zevenbergen en 1864, donde estudió francés y alemán. Dos años después se matriculó en la escuela secundaria HBS Koning Willem II (Tilburg) viviendo con la familia Hannik en la calle Sint Annaplein 18-19 y permaneció allí hasta que dejó los estudios de manera definitiva a los quince años. Por entonces comenzó su afición por la pintura.
                    ''',
                    overflow: !isExponded
                        ? TextOverflow.ellipsis
                        : TextOverflow.visible,
                    maxLines: !isExponded ? 3 : null,
                    style: TextStyle(color: Colors.white, height: 1.4),
                  ),
                  GestureDetector(
                    onTap: () {
                      isExponded = !isExponded;
                      setState(() {});
                    },
                    child: Text(
                      !isExponded ? "Leer mas" : "Menos informacion",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  divider20,
                  Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    //height: 60,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white30, width: 1.2),
                      borderRadius: BorderRadius.circular(12.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "EXIBICION ONLINE",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Artista destacado",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Lorem isus varein insusp ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        )),
                        Icon(Icons.image_rounded, color: Colors.white),
                        dividerWidth12,
                      ],
                    ),
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
