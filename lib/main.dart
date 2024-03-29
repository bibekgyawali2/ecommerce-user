import 'package:device_preview/device_preview.dart';
import 'package:ecommerceuser/cubits/address_cubit/address_cubit.dart';
import 'package:ecommerceuser/cubits/auth_cubit/auth_cubit.dart';
import 'package:ecommerceuser/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerceuser/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/cart_cubit/order_cubit_cubit.dart';
import 'cubits/order_cubit/order_cubit.dart';
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
          create: (context) => AuthCubit(),
        ),
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
        BlocProvider(
          create: (context) => AddressCubit()..getAddress(),
        ),
        BlocProvider(
          create: (context) => OrderCubit()..getOrder(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
