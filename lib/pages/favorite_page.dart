import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

import '../models/museum_model.dart';
import '../services/api_service.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  //const FavoritePage({Key? key}) : super(key: key);
  String pathPDF = "";

  APIService _apiService = APIService();

  List<MuseumModel> museums = [];

  @override
  initState() {
    super.initState();
    _getData();
  }

  _getData() {
    _apiService.getMuseums().then((value) {
      museums = value;
    });
  }

  _generatePDF() async {
    ByteData bytesx = await rootBundle.load("assets/images/image1.png");
    Uint8List imageBytes = bytesx.buffer.asUint8List();

    pw.Document pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return [
              //Tabla cabecera: Imagen + un conteiner con una columna de texto:
              pw.Table(
                children: [
                  pw.TableRow(
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Image(
                            pw.MemoryImage(imageBytes),
                            height: 100,
                          ),
                          pw.Container(
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.end,
                                children: [
                                  pw.Text(
                                      "Calle Los Portales 23232 - Cayma - Arequipa"),
                                  pw.Text("Tlf: 43432232"),
                                  pw.Text("E-mail: isdsd@gmail.com"),
                                  pw.Text("Página web: www.sdsad.com"),
                                ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Divider(),
                    ],
                  ),
                ],
              ),
              //tabla contenido
              pw.Table(
                children: museums
                    .map((e) => pw.TableRow(children: [pw.Text(e.name)]))
                    .toList(),
              ),
              //table contenido
              pw.Table(
                children: List.generate(
                  300,
                  (index) => pw.TableRow(
                    children: [
                      pw.Text("wwwwwwwwww"),
                    ],
                  ),
                ),
              ),
            ];
          }),
    );

    Uint8List bytes = await pdf.save();
    Directory dir = await getApplicationDocumentsDirectory();

    File _file = File("${dir.path}/example2PDF.pdf");

    _file.writeAsBytes(bytes);
    await OpenFile.open(_file.path);
  }

  _generarPDF1() async {
    pw.Document pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Text("Hola mundo mundial");
        },
      ),
    );
    Uint8List bytes = await pdf.save();
    Directory dir = await getApplicationDocumentsDirectory();

    File _file = File("${dir.path}/example5.pdf");
    _file.writeAsBytes(bytes);
    _file.create();
    pathPDF = _file.path;
    print(_file.path);
    await OpenFile.open(_file.path);
  }

  _generarPDFdeImagenLocal() async {
    //Ruta de imagen convertida a byteData
    ByteData bytesx = await rootBundle.load("assets/images/image1.png");
    //de
    Uint8List imageBytes = bytesx.buffer.asUint8List();

    pw.Document pdf = pw.Document();
    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Image(pw.MemoryImage(imageBytes));
          }),
    );

    Uint8List bytes = await pdf.save();
    Directory dir = await getApplicationDocumentsDirectory();
    File _file = File("${dir.path}/example1ImagenPDF.pdf");
    _file.writeAsBytes(bytes);
    await OpenFile.open(_file.path);
  }

  _openpdf() async {
    print("file: " + pathPDF);
    await OpenFile.open(pathPDF);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _generatePDF();
              },
              child: Text(" Generar PDF"),
            ),
            ElevatedButton(
              onPressed: () {
                _openpdf();
              },
              child: Text("Abrir PDF"),
            ),
            ElevatedButton(
              onPressed: () {
                _generarPDFdeImagenLocal();
              },
              child: Text("Generar PDF desde una Imagen Local"),
            ),
          ],
        ),
      ),
    );
  }
}
