import 'dart:convert';
import 'package:app/core/constants/url_constants.dart';
import 'package:app/features/home/data/repositories/bestSellBookRepository.dart';
import 'package:app/features/home/domain/entities/BestSeller.dart';
import 'package:http/http.dart' as http;

class RequestGetBestSellBookImpl implements BestSellBookRepository {
  @override
  Future<List<BookSeller>> fetchBestSellerBooks() async {
    try {
      final response = await http.get(Uri.parse(API.getBestSellerBooks));

      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);
        final jsonResponse = json.decode(responseBody);
        final List<dynamic> data = jsonResponse['data'];

        return data
            .map((book) => BookSeller(
                  id: book['id'].toString(),
                  imageLink: book['imageLink'].toString(),
                  title: book['title'].toString(),
                  originalPrice: book['originalPrice'].toString(),
                  discountedPrice: book['discountedPrice'].toString(),
                  soldQuantity: book['soldQuantity'],
                ))
            .toList();
      }
      throw Exception('Failed to load books');
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
  

}
