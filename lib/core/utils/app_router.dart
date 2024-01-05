import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentaion/views/home_details_view.dart';
import 'package:bookly/features/home/presentaion/views/home_view.dart';
import 'package:bookly/features/splash/presentaion/views/splash_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentaion/manger/smila_books_cubit/similar_books_cubit.dart';
import '../../features/search/data/repo/search_repo_imp.dart';
import '../../features/search/persentaion/manager/search_cubit/search_cubit.dart';
import '../../features/search/persentaion/views/search_view.dart';
import '../models/book_model/book_model.dart';
import 'api_services.dart';

abstract class AppRouter {
  static const kHomeView = '/HomeView';
  static const kDetailsView = '/detailsView';
  static const kSearchView = '/SearchView';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
              HomeRepoImpl(ApiService(Dio()))
          ),
          child: HomeDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(
              SearchRepoImp(ApiService(Dio()))
          )..fetchSimilarBooks(category: 'programming'),
          child: const SearchView(),
        ),
      ),

    ],
  );
}
