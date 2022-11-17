import 'package:api_test_murat/core/constants/app_size_constant.dart';
import 'package:api_test_murat/core/constants/color_kit.dart';
import 'package:api_test_murat/core/init/navigation/navigation_constant.dart';
import 'package:api_test_murat/core/init/navigation/navigation_service.dart';
import 'package:api_test_murat/ui/components/search_widget.dart';
import 'package:flutter/material.dart';

class SliverHeaderWidget extends SliverPersistentHeaderDelegate {
  String? query;
  ValueChanged<String>? search;
  SliverHeaderWidget({this.query, this.search});

  final _navigationService = NavigationService.instance;
  final String _hintText = "Search";

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(color: ColorKit.grey400),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(
                top: Sizes.p20,
                bottom: Sizes.p30,
                right: Sizes.p60,
                left: Sizes.p10),
            child: SearchWidget(
                text: query.toString(), onChanged: search!, hint: _hintText),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: Sizes.p30, right: Sizes.p10),
            child: FloatingActionButton.small(
              onPressed: () {
                _navigationService.navigateToPage(NavigationConstant.category);
              },
              child: const Icon(Icons.filter_alt_outlined,
                  color: ColorKit.blackColor),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => Sizes.p120;

  @override
  double get minExtent => Sizes.p100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
