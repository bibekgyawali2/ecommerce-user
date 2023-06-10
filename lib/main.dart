import 'package:ecommerceuser/cubits/address_cubit/address_cubit.dart';
import 'package:ecommerceuser/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerceuser/screens/address.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/cart_cubit/order_cubit_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit()..fetchData(),
        ),
        BlocProvider(
          create: (context) => OrderCubitCubit(),
        ),
        BlocProvider(
          create: (context) => OrderCubitCubit()..getCart(),
        ),
        BlocProvider(
          create: (context) => AddressCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      home: const AddAddress(),
    );
  }
}
