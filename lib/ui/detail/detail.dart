import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inventory/data/models/data.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/detail';

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final Barang barang = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(children: [
          CachedNetworkImage(
            imageUrl: barang.foto,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/noimage.png',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
          ),
          AppBar(
            title: Text('Detail Barang'),
            backgroundColor: Colors.transparent,
          )
        ]),
        Padding(
          padding: EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(
              barang.namaBarang,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              barang.tanggalMasuk,
              style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white70),
            ),
                Container(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Stock : ${barang.jumlah}',
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.orangeAccent),
                          ),
                          Text(
                            'Owner ID : ${barang.idUser}',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ]),
                  ),
                ),
            SizedBox(
              height: 8.0,
            ),
            Divider(
              color: Colors.white70,
            ),
                SizedBox(height: 16.0,),
                Text(
                  'Deskrpsi :',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 8.0,),
                Text(
                  barang.keterangan,
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white70),
                ),
          ]),
        )
      ],
    ));
  }
}
