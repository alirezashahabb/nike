part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final List<BannerModel> bannerList;
  final List<ProductModel> latestProduct;
  final List<ProductModel> popularProduct;

  const HomeSuccessState(
      {required this.bannerList,
      required this.latestProduct,
      required this.popularProduct});
}

final class HomeErrorState extends HomeState {
  final AppException appException;

  const HomeErrorState({required this.appException});
  @override
  List<Object> get props => [appException];
}
