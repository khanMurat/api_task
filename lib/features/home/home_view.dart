import 'package:api_test_murat/core/constants/app_size_constant.dart';
import 'package:api_test_murat/ui/components/home_widget.dart';
import 'package:api_test_murat/core/constants/color_kit.dart';
import 'package:api_test_murat/core/extension/context_extension.dart';
import 'package:api_test_murat/features/home/home_view_model.dart';
import 'package:api_test_murat/ui/components/sliver_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, this.queryParameters}) : super(key: key);

  final Map<String, dynamic>? queryParameters;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final _viewModel = HomeViewModel.instance;
  final String appBarTitle = "Exercises";
  String query = "";

  @override
  void initState() {
    _viewModel.getExerciseList(
        query: query, queryParamters: widget.queryParameters);
    _viewModel.context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorKit.grey400,
      body: SafeArea(
        child: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: ColorKit.grey400,
                  pinned: false,
                  floating: true,
                  stretch: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(appBarTitle),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate:
                      SliverHeaderWidget(search: _viewModel.searchExercise),
                ),
                if (_viewModel.exerciseList.isNotEmpty)
                  SliverGrid.count(
                    mainAxisSpacing: context.perHeight(3),
                    crossAxisCount: 1,
                    childAspectRatio: 2.5,
                    children: [
                      for (var exercise in value.exerciseList)
                        Padding(
                          padding: const EdgeInsets.all(Sizes.p8),
                          child: Card(
                            child: HomeWidget(exerciseModel: exercise),
                          ),
                        )
                    ],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
