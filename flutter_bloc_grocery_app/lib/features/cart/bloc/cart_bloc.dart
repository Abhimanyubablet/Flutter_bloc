
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_grocery_app/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_items.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  Future<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartSuccessState(cartItems: cartItems));
  }

  Future<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) async {
    cartItems.remove(event.productDataModel);
    emit(CartSuccessState(cartItems: cartItems));
  }



}
