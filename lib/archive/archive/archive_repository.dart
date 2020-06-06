import 'package:mystore_project/archive/archive/index.dart';

import '../../models/product.dart';

class ArchiveRepository {
  final ArchiveProvider _archiveProvider = ArchiveProvider();

  ArchiveRepository();

  Future<List<Product>> getArchivedAsync() async {
    return await _archiveProvider.getArchivedAsync();
  }
}
