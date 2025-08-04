import 'package:flutter/material.dart';
import 'package:portfolio_website/app/sections/contact/contact.dart';
import 'package:portfolio_website/app/sections/home/home.dart';
import 'package:portfolio_website/app/sections/portfolio/portfolio.dart';
import 'package:portfolio_website/app/sections/services/services.dart';
import 'package:portfolio_website/app/widgets/footer.dart';

class BodyUtils {
  static const List<Widget> views = [
    HomePage(),
    // About(),
    Services(),
    Portfolio(),
    Contact(),
    Footer(),
  ];
}
