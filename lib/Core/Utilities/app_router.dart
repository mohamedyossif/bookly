import 'package:bookly_app/Features/Home/Data/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/Presentation/Views/book_details_view.dart';
import 'package:bookly_app/Features/Home/Presentation/Views/home_view.dart';
import 'package:bookly_app/Features/Home/Presentation/manger/SimilarBookCubit/similar_book_cubit.dart';
import 'package:bookly_app/Features/Splash/Presentation/Views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String homeview = '/homeView';
  static const String bookDetailsView = '/bookDetailsView';

  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeview,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: bookDetailsView,
        builder: (context, state) => BookDetailsView(
          book: state.extra as BookModel,
        ),
      ),
    ],
  );
}
