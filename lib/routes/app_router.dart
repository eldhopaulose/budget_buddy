import 'package:auto_route/auto_route.dart';
import 'package:budget_buddy/presntation/bottom_nav/bottom_nav.dart';
import 'package:budget_buddy/presntation/home/bloc/home_bloc.dart';
import 'package:budget_buddy/presntation/income/income.dart';
import 'package:budget_buddy/presntation/total_income/bloc/total_icome_bloc.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        //HomeScreen is generated as HomeRoute because
        //of the replaceInRouteName property
        AutoRoute(
          path: '/',
          page: BottomNavRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/home',
          page: HomePageRoute.page,
        ),
        AutoRoute(
          path: '/income',
          page: IncomePageRoute.page,
        ),
        AutoRoute(
          path: '/totalincome',
          page: TotalIncomePageRoute.page,
        ),
      ];
}
