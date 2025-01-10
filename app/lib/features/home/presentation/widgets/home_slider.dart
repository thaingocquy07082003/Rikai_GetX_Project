import 'dart:async'; 
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  final Function(int) onChange;
  final int currentSlide;
  final List<String> images; 

  const HomeSlider({
    super.key,
    required this.onChange,
    required this.currentSlide,
    required this.images, 
  });

  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentSlide);

    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      int nextPage = _pageController.page!.toInt() + 1;

      if (nextPage == widget.images.length) {
        nextPage = 0; // Quay lại trang đầu tiên nếu là trang cuối
      }

      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );

      widget.onChange(nextPage); // Cập nhật chỉ số trang hiện tại
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Hủy timer khi widget bị hủy
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: widget.onChange,
            itemCount: widget.images.length, // Số trang dựa trên số lượng ảnh
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(widget.images[index]), // Lấy ảnh từ danh sách
                  ),
                ),
              );
            },
          ),
        ),
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.images.length, // Số chỉ số trang dựa trên số lượng ảnh
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: widget.currentSlide == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.currentSlide == index
                        ? Colors.black
                        : Colors.transparent,
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
