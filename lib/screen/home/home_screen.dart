import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike/data/repo/banner_repo.dart';
import 'package:nike/data/repo/prodduct_repo.dart';
import 'package:nike/screen/home/bloc/home_bloc.dart';
import 'package:nike/widget/error_state.dart';
import 'package:nike/widget/horizantally_products.dart';
import 'package:nike/widget/loading_state.dart';
import 'package:nike/widget/slider_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme themeData = Theme.of(context).textTheme;
    return BlocProvider<HomeBloc>(
      create: (context) {
        final homeBloc = HomeBloc(bannerRepo, productRepo);
        homeBloc.add(HomeStartedEvent());
        return homeBloc;
      },
      child: Scaffold(body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const LoadingState();
            } else if (state is HomeSuccessState) {
              return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/img/nike.png',
                          height: 46,
                          fit: BoxFit.fitHeight,
                        ),
                      );

                    case 2:
                      return SliderSection(
                        banners: state.bannerList,
                      );
                    case 3:
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('جدید ترین',
                                    style: themeData.headlineSmall),
                                Text(' همه', style: themeData.bodyLarge),
                              ],
                            ),
                          ),
                          HorizontallyProducts(
                            products: state.latestProduct,
                          ),
                        ],
                      );
                    case 4:
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('پر بازدید ترین',
                                    style: themeData.headlineSmall),
                                Text(' همه', style: themeData.bodyLarge),
                              ],
                            ),
                          ),
                          HorizontallyProducts(
                            products: state.popularProduct,
                          ),
                        ],
                      );
                    default:
                      return Container();
                  }
                },
              );
            } else if (state is HomeErrorState) {
              return ErrorState(
                onTap: () {
                  BlocProvider.of<HomeBloc>(context).add(HomeRefreshEvent());
                },
                exception: state.appException,
              );
            } else {
              throw ('state is not support');
            }
          },
        ),
      )),
    );
  }
}
