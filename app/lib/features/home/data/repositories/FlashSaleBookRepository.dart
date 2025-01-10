import 'package:app/features/home/domain/entities/BestSeller.dart';
abstract class FlashSaleBookRepository {
  Future<List<BookSeller>> fetchFlashSaleBooks();
}
