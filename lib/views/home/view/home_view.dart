import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vitra_smart_remote/core/base/state/base_state.dart';
import 'package:vitra_smart_remote/core/base/view/base_view.dart';
import 'package:vitra_smart_remote/core/extension/context_extension.dart';
import 'package:vitra_smart_remote/views/home/view-model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key ?key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  late HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onPageBuilder: ((buildContext, value) => scaffoldBody),
      onModelReady: (model) {
        homeViewModel = model;
      },
    );
  }

  Widget get scaffoldBody => Scaffold(
        floatingActionButton: floatingActionButtonMethod,
        body: textMethod,
      );

  Widget get textMethod {
    return Observer(
        builder: (context) => Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  centerTextMethod(context),
                  TextButton(onPressed: () => homeViewModel.navigateMainPage(), child: Text("Navigate",style: TextStyle(color: Colors.white),))
                ],
              ),
            ));
  }

  Text centerTextMethod(BuildContext context) {
    return Text(
                "${context.locale.home} ${homeViewModel.number.toString()}",
                style: TextStyle(
                  fontSize: 50,
                  color: Theme.of(context).colorScheme.primary,
                ));
  }

  FloatingActionButton get floatingActionButtonMethod =>
      FloatingActionButton(onPressed: () => homeViewModel.incrementNumber());

}
