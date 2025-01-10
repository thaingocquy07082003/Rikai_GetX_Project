import 'package:app/core/commons.dart';
import 'package:app/core/constants/color_constants.dart';
import 'package:app/features/home/presentation/widgets/best_sell_list.dart';
import 'package:app/features/home/presentation/widgets/flast_sale_list.dart';
import 'package:app/features/home/presentation/widgets/high_light_listview_widget.dart';
import 'package:app/features/home/presentation/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeScreen extends BaseScreen<HomeViewModel> {
  HomeScreen({super.key}) {
    Get.put(HomeViewModel());
  }

  @override
  bool get wrapWithSafeArea => false;

  @override
  Widget buildScreen(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeSlider(
                currentSlide: controller.currentSlide.value,
                onChange: (index) {
                  controller.updateSlide(index);
                },
                images: [
                  "assets/images/Slider/banner_image1.webp",
                  "assets/images/Slider/banner_image2.webp",
                  "assets/images/Slider/banner_image3.webp",
                  "assets/images/Slider/banner_image4.webp",
                ],
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0 ),
                child: HighlightListviewWidget(),
              ),
              const SizedBox(height: 30),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Danh mục',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              
                            },
                            child: const Text(
                              'Xem tất cả',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Acme',
                                  color: ConstColor.backgroundColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width * 0.49,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/inapp/Manga.png'),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width * 0.49,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/inapp/WingsBook.png'),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width * 0.49,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/inapp/KhoaHoc.png'),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width * 0.49,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/inapp/VanHoc.png'),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width * 0.49,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/inapp/TruyenTranh.png'),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width * 0.49,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/inapp/GiaiMaBanThan.png'),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // Your category buttons...
              const SizedBox(height: 40),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bán chạy',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                  
                            },
                            child: const Text(
                              'Xem tất cả',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Acme',
                                  color: ConstColor.backgroundColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(() => BestSellerList(
                bestSellerBooks: controller.bestSellerBooks.toList(),
                isLoading: controller.isLoading.value
              )),
              const SizedBox(height: 40),
              const SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Siêu giảm giá',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Xem tất cả',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Acme',
                                color: ConstColor.backgroundColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Obx(() => FlashSaleList(
                              bestSellerBooks: controller.hotSaleBooks.toList(),
                              isLoading: controller.isHotSaleLoading.value
                            )),
              ),
            ],
          ),
        );
  }
}
