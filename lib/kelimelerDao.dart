import 'package:sozluk_app/VeritabaniYardimcisi.dart';

import 'kelimeler.dart';

class KelimelerDao {
  Future<List<Kelimeler>> tumKelimeler() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM "
        "kelimeler");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kelimeler(
          kelimeId: satir["kelime_id"],
          ingilizce: satir["ingilizce"],
          turkce: satir["turkce"]);
    });
  }

  Future<List<Kelimeler>> kelimeAra(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM "
        "kelimeler WHERE ingilizce LIKE '%$aramaKelimesi'");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kelimeler(
          kelimeId: satir["kelime_id"],
          ingilizce: satir["ingilizce"],
          turkce: satir["turkce"]);
    });
  }
}
