
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_grocery_app/data/grocery_data.dart';
import 'package:flutter_bloc_grocery_app/data/wishlist_items.dart';
import 'package:flutter_bloc_grocery_app/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_items.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent );
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  Future<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState>emit)async {
   emit(HomeLoadingState());
   await Future.delayed(Duration(seconds: 3));
   emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e)=> ProductDataModel(
       id: e["id"],
       name: e["name"],
       description: e["description"],
       price: e["price"],
       imageUrl: e["imageUrl"]
   )).toList()));
  }

  Future<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) async {
    print("WishList product clicked");
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  Future<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) async {
    print("Cart product clicked");
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  Future<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) async {
    print("WishList navigate clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  Future<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) async {
    print("Cart navigate clicked");
    emit(HomeNavigateToCartPageActionState());
  }

  }



