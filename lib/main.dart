import 'package:bloc_state_management/config/observer_bloc.dart';
import 'package:bloc_state_management/manager/bloc/product_bloc.dart';
import 'package:bloc_state_management/manager/counter_bloc/counter_bloc.dart';
import 'package:bloc_state_management/manager/counter_bloc/counter_event.dart';
import 'package:bloc_state_management/manager/counter_bloc/counter_state.dart';
import 'package:bloc_state_management/manager/service_bloc/bloc/newcounter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductViewFinal(),
    );
  }
}

// ? counter with builder and lisnter
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewcounterBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocBuilder<NewcounterBloc, NewcounterState>(
                  builder: (context, state) {
                    if (state is SuccessToAdd) {
                      return Text(state.counter.toString());
                    } else {
                      return Text("0");
                    }
                  },
                ),
                BlocListener<NewcounterBloc, NewcounterState>(
                  listener: (context, state) {
                    if (state is SuccessToAdd) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("data")));
                    }
                  },
                  child: TextField(
                    onChanged: (value) {
                      context
                          .read<NewcounterBloc>()
                          .add(ChangedNumber(newValue: int.parse(value)));
                    },
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            context.read<NewcounterBloc>().add(AddNumber());
          }),
        );
      }),
    );
  }
}

// ? counter with builder

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocCounter(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: BlocBuilder<BlocCounter, CounterState>(
              builder: (context, state) {
                if (state is CounterHasBeenIncreamenSuccess) {
                  return Text(state.counter.toString());
                } else if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Text("0");
                }
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            context.read<BlocCounter>().add(IncreamentCounter());
          }),
        );
      }),
    );
  }
}

// ? products with builder and lisnter

class ProductView extends StatelessWidget {
  const ProductView({super.key});

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
                return GridView.builder(
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

// ? products with builder and lisnter : consumer
class ProductViewFinal extends StatelessWidget {
  const ProductViewFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(GetProducts()),
      child: Builder(builder: (context) {
        // ?  to send event after init bloc
        // context.read<ProductBloc>().add(GetProducts());
        return Scaffold(
          body: BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) {
              if (state is SuccessToGetProducts) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Hello world"),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ));
              } else if (state is ErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("There is No Internet "),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                ));
              }
            },
            builder: (context, state) {
              if (state is SuccessToGetProducts) {
                return GridView.builder(
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
