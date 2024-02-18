
import 'package:bloc_state_management/manager/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView2 extends StatelessWidget {
  const ProductView2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(GetProducts()),
      child: Builder(builder: (context) {
        // ?  to send event after init bloc
        // context.read<ProductBloc>().add(GetProducts());
        return Scaffold(
          body: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is SuccessToGetProducts) {
                return BlocListener<ProductBloc, ProductState>(
                  listener: (context, state) {
                    if (state is SuccessToGetProducts) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Hello world"),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                  },
                  child: GridView.builder(
                    itemCount: state.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    state.products[index].thumbnail))),
                        child: Center(
                          child: Column(
                            children: [
                              Text(state.products[index].title),
                              Text(state.products[index].price.toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is ErrorState) {
                return Center(
                  child: Text("Sorry there is no inten"),
                );
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                ));
              }
            },
          ),
        );
      }),
    );
  }
}
