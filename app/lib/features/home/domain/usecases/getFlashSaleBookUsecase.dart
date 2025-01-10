
import 'package:app/features/home/data/datasource/resful_api/requestGetSaleBookImpl.dart';
import 'package:app/features/home/data/repositories/FlashSaleBookRepository.dart';
import 'package:app/features/home/domain/entities/BestSeller.dart';

class GetFlashSaleBookUsecase {
  final FlashSaleBookRepository flashSaleBookRepository;
  GetFlashSaleBookUsecase({FlashSaleBookRepository? flashSaleBookRepository})
      : flashSaleBookRepository = flashSaleBookRepository ?? RequestGetSaleBookImpl();
  Future<List<BookSeller>> call() async {
    return await flashSaleBookRepository.fetchFlashSaleBooks();
  }
}