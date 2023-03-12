import 'package:assignment_3/Data/Model/data.dart';
import 'package:assignment_3/service/apiService.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final _apiServiceProvider = ApiServiceProvider();

  ShopBloc() : super(ShopInitialState()) {
    on<GetDataButtonPressed>((event, emit) async {
      emit(ShopLoadingState());
      final item = await _apiServiceProvider.fetchItem();
      emit(ShopSuccessState(item!));
    });
  }
}
