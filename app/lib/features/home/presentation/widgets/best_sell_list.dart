import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/features/home/domain/entities/BestSeller.dart';

class BestSellerList extends StatefulWidget {
  final bool isLoading;
  final List<BookSeller> bestSellerBooks;
  const BestSellerList(
      {super.key, required this.bestSellerBooks, required this.isLoading});

  @override
  State<BestSellerList> createState() => _BestSellerListState();
}

class _BestSellerListState extends State<BestSellerList> {
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
  void didUpdateWidget(covariant BestSellerList oldWidget) {
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
    return SizedBox(
      height: 350,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : displayedBooks.isEmpty
              ? const Center(
                  child: Text('No books available'),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      displayedBooks.length > 8 ? 8 : displayedBooks.length,
                  itemBuilder: (context, index) {
                    var book = displayedBooks[index];
                    int discountPercent =
                        ((double.parse(book.discountedPrice)) *
                                    100 /
                                    double.parse(book.originalPrice) -
                                100)
                            .toInt();
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10),
                                ),
                                child: Image.network(
                                  book.imageLink,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      book.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
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
                                                style: TextStyle(
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
                                            style: TextStyle(
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                            children: [
                                              WidgetSpan(
                                                child: Transform.translate(
                                                  offset: const Offset(2, -4),
                                                  child: Text(
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
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text.rich(
                                      TextSpan(
                                        text: formatCurrency(
                                            book.discountedPrice),
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          WidgetSpan(
                                            child: Transform.translate(
                                              offset: const Offset(2, -8),
                                              child: Text(
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
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
