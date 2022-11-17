import 'package:api_test_murat/core/constants/app_size_constant.dart';
import 'package:api_test_murat/core/constants/color_kit.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hint;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hint,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.p44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.p20),
        color: ColorKit.whiteColor,
        border: Border.all(color: ColorKit.whiteColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            icon: const Icon(
              Icons.search,
              color: ColorKit.blackColor,
            ),
            suffixIcon: widget.text.isNotEmpty
                ? GestureDetector(
                    child: const Icon(
                      Icons.close_outlined,
                      color: ColorKit.blackColor,
                    ),
                    onTap: () {
                      controller.clear();
                      widget.onChanged('');
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  )
                : null,
            hintText: widget.hint,
            border: InputBorder.none),
        onChanged: widget.onChanged,
      ),
    );
  }
}
