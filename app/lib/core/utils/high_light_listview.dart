import 'package:flutter/material.dart';

class Listview_home {
  final String title;
  final String image;
  final Widget screen;

  Listview_home(
      {required this.title, required this.image, required this.screen});
}

final List<Listview_home> Highlight = [
  Listview_home(
      title: 'Bảng Xếp Hạng',
      image: "assets/images/highlight_listview/highlight_listview1.jpg",
      screen: Center(child: Text('Bảng Xếp Hạng'),)),

  Listview_home(
      title: "Đánh Giá",
      image: "assets/images/highlight_listview/highlight_listview2.jpg",
      screen: Center(child: Text('Đánh Giá'),)),
  Listview_home(
      title: "Tin Tức",
      image: "assets/images/highlight_listview/highlight_listview3.jpg",
      screen: Center(child: Text('Tin Tức'),)),
];