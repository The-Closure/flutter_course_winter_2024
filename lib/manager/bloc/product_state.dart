// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class SuccessToGetProducts extends ProductState {
List<ProductModel> products;
  SuccessToGetProducts({
    required this.products,
  });
}

class OnlineLoadinState extends ProductState {}


class ErrorState extends ProductState {}
