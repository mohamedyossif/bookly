import 'package:bookly_app/Core/Utilities/app_router.dart';
import 'package:bookly_app/Features/Home/Presentation/manger/FeaturedBookCubit/featured_book_cubit.dart';
import 'package:bookly_app/Features/Home/Presentation/manger/NewestBookCubit/newest_book_cubit.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const BooklyApp());
}

// need to perform navigation or other context-based operations from outside the usual widget tree
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBookCubit()..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBookCubit()..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        routerConfig: AppRouter.routes,
      ),
    );
  }
}
