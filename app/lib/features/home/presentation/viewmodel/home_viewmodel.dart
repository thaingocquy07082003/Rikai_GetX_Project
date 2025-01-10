import 'package:app/core/commons.dart';
import 'package:app/features/home/domain/entities/BestSeller.dart';
import 'package:app/features/home/domain/usecases/getBestSellBookUsecase.dart';
import 'package:app/features/home/domain/usecases/getFlashSaleBookUsecase.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HomeViewModel extends BaseViewModel {
  final GetFlashSaleBookUsecase _getFlashSaleBooksUseCase =
      GetFlashSaleBookUsecase();
  final GetBestSellBookUsecase _getBestSellerBooksUseCase =
      GetBestSellBookUsecase();
  // Tạo biến observable
  final RxInt currentSlide = 0.obs;
  final RxList<BookSeller> bestSellerBooks = <BookSeller>[].obs;
  final RxBool isLoading = true.obs;
  final RxList<BookSeller> hotSaleBooks = <BookSeller>[].obs;
  final RxBool isHotSaleLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBestSellerBooks();
    fetchHotSaleBooks();
  }

  // Phương thức để cập nhật slide
  void updateSlide(int index) {
    currentSlide.value = index;
  }

  Future<void> fetchBestSellerBooks() async {
    try {
      final result = await _getBestSellerBooksUseCase.call();
      bestSellerBooks.value = result.cast<BookSeller>();
      print(isLoading.value);
      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchHotSaleBooks() async {
    try {
      final result = await _getFlashSaleBooksUseCase.call();
      hotSaleBooks.value = result.cast<BookSeller>();
      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isHotSaleLoading.value = false;
    }
  }
}
