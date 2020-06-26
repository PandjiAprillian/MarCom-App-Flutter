import 'package:flutter/material.dart';
import 'package:macom/model/comic.dart';
import 'package:macom/screen_detail.dart';

class HomeScreen extends StatelessWidget {
  final header = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'PT_Sans_Narrow');
  final titleSub = TextStyle(
      color: Colors.white, fontSize: 16.5, fontFamily: 'PT_Sans_Narrow');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffaf4448),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(4, 2),
                            blurRadius: 10)
                      ]),
                      child: Image.asset(
                        'assets/images/marvel.png',
                        width: 380,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text('Best Selling Comis', style: header),
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      var valueComic = comicListHori[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ScreenDetail(data: valueComic);
                          }));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Expanded(
                                  flex: 4,
                                  child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Colors.black54,
                                            offset: Offset(2, 2),
                                            blurRadius: 10)
                                      ]),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: Image.asset(
                                              valueComic.imgPath)))),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: comicListHori.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text('New This Month', style: header),
                ),
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      var valueComic = comicListVert[index];
                      return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ScreenDetail(data: valueComic);
                              }));
                            },
                            leading: Image.asset(valueComic.imgPath),
                            title: Text(valueComic.title, style: titleSub),
                            subtitle: Text(valueComic.writer, style: titleSub),
                          ));
                    },
                    itemCount: comicListVert.length,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

var comicListHori = [
  Comic(
      title: 'Age Of Ultron (2013)',
      published: 'March 06, 2013',
      writer: 'Brian Michael Bendis',
      artStyle: 'Bryan Hitch',
      synopsis:
          'Selama bertahun-tahun para pahlawan Marvel Universe hidup dalam ketakutan, bahwa kecerdasan buatan yang dikenal sebagai Ultron, suatu hari nanti akan berevolusi untuk memenuhi keinginannya untuk menghapus semua kehidupan organik dan mengambil alih Bumi, dan hari yang ditakutkan pun tiba. Acara besar yang terdiri dari 10 bagian Marvel Universe ini dipersembahkan oleh penulis pemenang penghargaan Eisner Brian Michael Bendis dan legenda komik Bryan Hitch.',
      price: r'Buy $1.99',
      imgPath: 'assets/images/age_of_ultron.jpg',
      comicUrls:
          'https://www.marvel.com/comics/issue/47001/age_of_ultron_2013_1'),
  Comic(
      title: 'Superior Spider-man (2013)',
      published: 'January 09, 2013',
      writer: 'Dan Slott',
      artStyle: 'Ryan Stegman',
      synopsis:
          'Peter Parker menghabiskan seumur hidup untuk memenuhi tanggung jawab yang diberikan kekuatannya kepadanya, tetapi kisah Hebatnya akhirnya berakhir secara dramatis dalam Spider-Man  # 700 yang bersejarah. SEKARANG! ... Amazing Spider-Man yang baru telah tiba dan dia lebih baik dalam segala hal. Lebih cerdas!, lebih kuat!, lebih Unggul!, Superior Spider-man!',
      price: r'Buy $2.99',
      imgPath: 'assets/images/superior_spiderman.jpg',
      comicUrls:
          'https://www.marvel.com/comics/issue/46462/superior_spider-man_2013_1'),
  Comic(
      title: 'Avengers Vs. X-Men (2012)',
      published: 'April 04, 2012',
      writer: 'Brian Michael Bendis',
      artStyle: 'Jhon Romita',
      synopsis:
          'Apakah kembalinya Phoenix ke bumi menandakan kelahiran kembali spesies mutan? Itulah Yang X-Men Percaya! Sayangnya, The Avengers Yakin Bahwa Kedatangannya Akan Berarti Akhir Dari Semua Kehidupan Di Bumi!',
      price: r'Buy $1.99',
      imgPath: 'assets/images/avengers_v_xmen_2012.jpg',
      comicUrls:
          'https://www.marvel.com/comics/issue/41188/avengers_vs_x-men_2012_1'),
  Comic(
      title: 'Marvel\'s Spider-Man: Velocity (2019)',
      published: 'December 18, 2019',
      writer: 'Dennis "Hopeless" Hallum',
      artStyle: 'Emilio Laiso',
      synopsis:
          'Setelan Velocity kecepatan tinggi SPIDER-MAN didorong hingga batasnya! Tetapi apakah dia bahkan cukup cepat untuk berlari lebih cepat dari SPEEDSTER MISTERIUS dan menghentikan pemerintahan terornya untuk selamanya? Berpikirlah cepat, Spidey - atau akan ada KEMATIAN pada hati nurani Anda! Kesimpulan utama dari seri Gamerverse pertama-asli!',
      price: r'Buy $3.99',
      imgPath: 'assets/images/spiderman_velocity.jpg',
      comicUrls:
          'https://www.marvel.com/comics/issue/80484/marvels_spider-man_velocity_2019_5'),
  Comic(
      title: 'Ghost Rider (2006)',
      published: 'March 19, 2008',
      writer: 'Jason Aaron',
      artStyle: 'Marko Djurdjevic',
      synopsis:
          'Di sebuah kota kecil di antah berantah, pencarian Johnny Blaze untuk membalas dendam berlanjut ketika dia berhadapan dengan sekelompok perawat yang dipersenjatai dan berusaha melanggar Sumpah Hipokrates mereka. Ditambah lagi Jhonny bertemu dengan seorang polisi muda bernama Kowalski yang mengalami sedikit masalahnya sendiri ketika meneliti kecenderungan aneh pada kotanya.',
      price: r'Buy $1.99',
      imgPath: 'assets/images/ghost_rider_2006.jpg',
      comicUrls:
          'https://www.marvel.com/comics/issue/20860/ghost_rider_2006_21'),
  Comic(
      title: 'Immortal Hulk (2018)',
      published: 'June 06, 2018',
      writer: 'Al Ewing',
      artStyle: 'Joe Bennett',
      synopsis:
          'HORROR MEMILIKI NAMA. Kau tidak pernah tahu pria itu. Dia tidak ingin diperhatikan. Dia diam, tenang, dan tidak pernah mengeluh. Nama pria itu adalah Banner. Horror yang dimilikinya adalah THE IMMORTAL HULK.',
      price: r'Buy $4.99',
      imgPath: 'assets/images/immortal_hulk.jpg',
      comicUrls:
          'https://www.marvel.com/comics/issue/68616/immortal_hulk_2018_1')
];

var comicListVert = [
  Comic(
      title: 'Venom (2018)',
      published: 'May 09, 2018',
      writer: 'Donny Cates',
      artStyle: 'Ryan Stegman',
      synopsis:
          'Setelah kehancuran S.H.I.E.L.D., sebuah kejahatan purba telah dibangunkan di bawah jalanan kota New York, dan bersamanya, sesuatu yang sama jahatnya telah terbangun di kota itu!. VENOM masih seorang Lethal Protector dari orang-orang tak berdosa di New York, ancaman yang belum pernah terlihat ini bisa memaksa Venom untuk melepaskan segala yang disayangi - termasuk Eddie Brock!',
      price: r'Buy $4.99',
      imgPath: 'assets/images/venom_2018.jpg',
      comicUrls: 'https://www.marvel.com/comics/issue/67577/venom_2018_1'),
  Comic(
      title: 'The Life of Captain Marvel (2018)',
      published: 'July 18, 2018',
      writer: 'Margaret Stohl',
      artStyle: 'Marguerite Sauvage, Carlos Pacheco',
      synopsis:
          'Carol Danvers hanyalah seorang gadis dari pinggiran Boston yang mencintai sains dan Red Sox sampai kesempatan bertemu dengan pahlawan Kree memberinya kekuatan super yang luar biasa. Sekarang, dia adalah pemimpin dalam Avengers dan komandan Alpha Flight. Tetapi bagaimana jika disanan ada lebih banyak cerita? Ketika serangan kecemasan melumpuhkanya di sela-sela perkelahian? Carol menemukan dirinya menghidupkan kembali kenangan hidupnya yang dia pikir sudah tidak ada.',
      price: r'Buy $4.99',
      imgPath: 'assets/images/captain_marvel.jpg',
      comicUrls:
          'https://www.marvel.com/comics/issue/69730/the_life_of_captain_marvel_2018_1'),
  Comic(
      title: 'Scream: Curse of Carnage (2019)',
      published: 'December 18, 2019',
      writer: 'Clay Hapman',
      artStyle: 'Christopher Mooneyham, Garry Brown',
      synopsis:
          'Dalam kebangkitan Carnage, kegelapan telah terbentuk di perairan sekitar New York, sesuatu yang jahat yang memanggil symbiote Scream dengan lagu sirine yang mengerikan!',
      price: r'Buy $3.99',
      imgPath: 'assets/images/scream_curse_of_carnage.jpg',
      comicUrls:
          'https://www.marvel.com/comics/issue/79919/scream_curse_of_carnage_2019_2'),
  Comic(
      title: 'Revenge of the Cosmic Ghost Rider (2019)',
      published: 'December 18, 2019',
      writer: 'Dennis "Hopeless" Hallum, Donny Cates',
      artStyle: 'Scott Hepburn, Geoffrey Shaw',
      synopsis:
          'Cosmic Ghost Rider kembali, Tetapi dengan reputasinya yang seperti sudah di ujuk tanduk, hanya masalah waktu sebelum hukum mengejar masa depan Frank Castle dan mencoba untuk mengikatnya!',
      price: r'Buy $4.99',
      imgPath: 'assets/images/cosmic_ghost_rider.jpg',
      comicUrls:
          'https://www.marvel.com/comics/issue/78678/revenge_of_the_cosmic_ghost_rider_2019_1'),
  Comic(
      title: 'Tony Stark: Iron Man (2018)',
      published: 'December 18, 2019',
      writer: 'Christos Gage, Dan Slott',
      artStyle: 'Francesco Manna',
      synopsis:
          'Bagaimana jika tidak ada Tony Stark? Bagaimana jika hanya ada Manusia Besi? Pada akhir 2019, batas-batas antara manusia dan mesin sudah tidak bisa dibedakan. Dan Marvel Universe akan menjadi tempat yang sangat berbeda di tahun 2020!',
      price: r'Buy $3.99',
      imgPath: 'assets/images/iron_man.jpg',
      comicUrls:
          'https://www.marvel.com/comics/issue/79899/tony_stark_iron_man_2018_19'),
  Comic(
      title: '2020 Rescue (2020)',
      published: 'June 24, 2020',
      writer: 'Dana Schwartz',
      artStyle: 'Jacen Burrows',
      synopsis:
          'Perburuan untuk orang tua Tonny Start, tetapi dengan ibunya yang sedang berada dia atas angin, dan ayahnya yang seorang agen hydra sedang melakukan pelarian. Itu tentu tidak akan mudah untuk Rescure melacak keberadaan mereka berdua. Mungkinkah Rescue membutuhkan bantukan dari seorang teman lama?',
      price: '"NOT RELEASED"',
      imgPath: 'assets/images/rescue_2020.jpg',
      comicUrls: 'marvel.com/comics/issue/84351/2020_rescue_2020_2')
];
