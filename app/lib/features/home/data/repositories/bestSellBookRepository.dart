import 'package:app/features/home/domain/entities/BestSeller.dart';

abstract class BestSellBookRepository {
  Future<List<BookSeller>> fetchBestSellerBooks();
}
