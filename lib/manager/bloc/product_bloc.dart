import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/manager/counter_bloc/counter_state.dart';
import 'package:bloc_state_management/model/product_model.dart';
import 'package:bloc_state_management/service/prodcuts_service.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProducts>((event, emit) async{
      emit(OnlineLoadinState());
      dynamic result = await getProducts();
      if(result is bool){
        emit(ErrorState());
      }else {
        emit(SuccessToGetProducts(products: result));
      }


    });
  }
}
