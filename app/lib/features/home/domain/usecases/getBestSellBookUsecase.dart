import 'package:app/features/home/data/datasource/resful_api/requestGetBestSellBookImpl.dart';
import 'package:app/features/home/data/repositories/bestSellBookRepository.dart';
import 'package:app/features/home/domain/entities/BestSeller.dart';

class GetBestSellBookUsecase {
  final BestSellBookRepository bestSellBookRepository;
  GetBestSellBookUsecase({BestSellBookRepository? bestSellBookRepository})
      : bestSellBookRepository = bestSellBookRepository ?? RequestGetBestSellBookImpl();
  Future<List<BookSeller>> call() async {
    return await bestSellBookRepository.fetchBestSellerBooks();
  }
}