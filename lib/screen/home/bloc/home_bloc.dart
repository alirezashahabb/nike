import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nike/common/exception.dart';
import 'package:nike/data/model/banner.dart';
import 'package:nike/data/model/product.dart';
import 'package:nike/data/repo/banner_repo.dart';
import 'package:nike/data/repo/prodduct_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRep;
  final IProductRepository _iProductRepository;
  HomeBloc(this._bannerRep, this._iProductRepository)
      : super(HomeLoadingState()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStartedEvent || event is HomeRefreshEvent) {
        try {
          emit(HomeLoadingState());
          final bannerList = await _bannerRep.getBanner();
          final latestproductsList =
              await _iProductRepository.getAll(ProductSort.lATEST);
          final popularproductsList =
              await _iProductRepository.getAll(ProductSort.pOPULAR);
          emit(HomeSuccessState(
              bannerList: bannerList,
              latestProduct: latestproductsList,
              popularProduct: popularproductsList));
        } catch (e) {
          emit(HomeErrorState(
              appException: e is AppException ? e : AppException()));
        }
      }
    });
  }
}
