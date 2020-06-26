import 'package:flutter/material.dart';
import 'package:macom/model/comic.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenDetail extends StatelessWidget {
  final Comic data;
  final whiteColor = Colors.white;
  final iconChild = TextStyle(color: Colors.white, fontSize: 12.5);
  final title =
      TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'Staatliches');
  final synopsis = TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontFamily: 'PT_Sans_Narrow',
      height: 1.5);

  ScreenDetail({@required this.data});

  _launchUrl() async {
    final comicUrl = data.comicUrls;
    if (await canLaunch(comicUrl)) {
      await launch(comicUrl);
    } else {
      throw 'Tidak bisa membuka $comicUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(data.imgPath),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: whiteColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        })),
                Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(data.imgPath),
                    )),
                SizedBox(height: 20),
                Text(data.title, style: title),
                SizedBox(height: 20),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.border_color, color: whiteColor),
                              SizedBox(height: 8),
                              Text(data.writer,
                                  textAlign: TextAlign.start,
                                  style: iconChild)
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.photo_size_select_large,
                                  color: whiteColor),
                              SizedBox(height: 8),
                              Text(data.artStyle, style: iconChild)
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.date_range, color: whiteColor),
                              SizedBox(height: 8),
                              Text(data.published,
                                  textAlign: TextAlign.start,
                                  style: iconChild)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      child: SingleChildScrollView(
                        child: Text(data.synopsis,
                            textAlign: TextAlign.center, style: synopsis),
                      ),
                    )),
                SizedBox(height: 8),
                RaisedButton(
                  color: Color(0xffd50000),
                  textColor: Colors.white,
                  shape: StadiumBorder(),
                  onPressed: () {
                    _launchUrl();
                  },
                  child:
                      Text('${data.price}', style: TextStyle(fontSize: 20)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
