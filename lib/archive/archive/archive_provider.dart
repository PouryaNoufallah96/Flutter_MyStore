import 'dart:async';
import 'package:mystore_project/utilities/db.dart';
import '../../models/product.dart';

class ArchiveProvider {
  DB db = DB();
  Future<List<Product>> getArchivedAsync() async {
    /// write from keystore/keychain
    var has = await db.HasData();
    if (has) {
      Iterable temp = await db.getAll();
      var list = temp.map((model) => Product.fromDB(model)).toList();
      return list;
    } else {
      return null;
    }
  }
}
