import 'package:app/features/home/domain/entities/BestSeller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FlashSaleList extends StatefulWidget {
  final bool isLoading;
  final List<BookSeller> bestSellerBooks;
  const FlashSaleList({super.key, required this.bestSellerBooks, required this.isLoading});

  @override
  State<FlashSaleList> createState() => _FlashSaleScreenState();
}

class _FlashSaleScreenState extends State<FlashSaleList> {
  bool isLoading = true;
  List<BookSeller> displayedBooks = [];

  String formatCurrency(String price) {
    final formatter = NumberFormat('#,###');
    return formatter.format(double.parse(price).round());
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      displayedBooks = widget.bestSellerBooks;
      isLoading = widget.isLoading;
    });
  }

  @override
  void didUpdateWidget(covariant FlashSaleList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.bestSellerBooks != widget.bestSellerBooks || oldWidget.isLoading != widget.isLoading) {
      setState(() {
        displayedBooks = widget.bestSellerBooks;
        isLoading = widget.isLoading;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : displayedBooks.isEmpty
            ? const Center(
                child: Text('No books available'),
              )
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.5,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10,
                ),
                itemCount:
                    displayedBooks.length > 8 ? 8 : displayedBooks.length,
                itemBuilder: (context, index) {
                  var book = displayedBooks[index];
                  int discountPercent = ((double.parse(book.discountedPrice)) *
                              100 /
                              double.parse(book.originalPrice) -
                          100)
                      .toInt();
                  return GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.2,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: ClipRRect(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Image.network(
                                    book.imageLink,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      book.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              child: Text(
                                                discountPercent.toString() +
                                                    "%",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: formatCurrency(
                                                book.originalPrice),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                            children: [
                                              WidgetSpan(
                                                child: Transform.translate(
                                                  offset: const Offset(2, -4),
                                                  child: const Text(
                                                    'đ',
                                                    textScaleFactor: 0.7,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text.rich(
                                      TextSpan(
                                        text: formatCurrency(
                                            book.discountedPrice),
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          WidgetSpan(
                                            child: Transform.translate(
                                              offset: const Offset(2, -8),
                                              child: const Text(
                                                'đ',
                                                textScaleFactor: 0.7,
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  );
                },
              );
  }
}

