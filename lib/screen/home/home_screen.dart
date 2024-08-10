import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:nike/data/repo/banner_repo.dart';
import 'package:nike/data/repo/prodduct_repo.dart';
import 'package:nike/screen/home/bloc/home_bloc.dart';
import 'package:nike/widget/loading_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
                itemCount: 5,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Image.asset(
                        'assets/img/nike.png',
                        height: 46,
                      );

                    default:
                      return Container();
                  }
                },
              );
            } else if (state is HomeErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/img/ErrorState.json',
                        height: 100, width: 100),
                    Text(state.appException.message),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<HomeBloc>(context)
                            .add(HomeRefreshEvent());
                      },
                      child: const Text('تلاش دوباره'),
                    ),
                  ],
                ),
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
