import 'package:api_test_murat/core/constants/color_kit.dart';
import 'package:api_test_murat/features/category/category_view_model.dart';
import 'package:api_test_murat/ui/components/button_widget.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView>
    with TickerProviderStateMixin {
  late CategoryViewModel _model;
  late TabController controller;

  @override
  void initState() {
    _model = CategoryViewModel();
    _model.setContext(context);
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final _muscle = "muscle";
  final _type = "type";
  final _appBarTitle = "Category";
  final _buttonTitle = "APPLY";

  String? dropdownType;
  String? dropdownMuscle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: Column(
        children: [
          TabBar(
            isScrollable: false,
            indicatorPadding: const EdgeInsets.all(10),
            indicator: BoxDecoration(
                color: ColorKit.blackColor,
                borderRadius: BorderRadius.circular(20)),
            controller: controller,
            labelPadding: const EdgeInsets.symmetric(horizontal: 30),
            tabs: [
              Tab(
                child: Text(
                  _type,
                  style: TextStyle(color: ColorKit.grey400),
                ),
              ),
              Tab(
                child: Text(
                  _muscle,
                  style: TextStyle(color: ColorKit.grey400),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                Column(
                  children: [
                    Center(
                      child: DropdownButton<String>(
                          value: dropdownType,
                          items: _model.typeList.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                          onChanged: (String? newValue) {
                            setState(
                              () {
                                dropdownType = newValue!;
                              },
                            );
                          }),
                    ),
                    CustomButton(
                        mapKey: _type,
                        dropdownValue: dropdownType,
                        buttonTitle: _buttonTitle)
                  ],
                ),
                Column(
                  children: [
                    Center(
                      child: DropdownButton<String>(
                          value: dropdownMuscle,
                          items:
                              _model.muscleList.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                          onChanged: (String? newValue) {
                            setState(
                              () {
                                dropdownMuscle = newValue!;
                              },
                            );
                          }),
                    ),
                    CustomButton(
                        mapKey: _muscle,
                        dropdownValue: dropdownMuscle,
                        buttonTitle: _buttonTitle)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
