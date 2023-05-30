import 'package:get/route_manager.dart';
import '../features/customers/customers.dart';
import '../features/dashboard/dashboard_screen.dart';
import '../features/imports/import.dart';
import '../features/login/login_screen.dart';
import '../features/manufactures/manufacturers.dart';
import '../features/order/create_order/create_order_screen.dart';
import '../features/order/order.dart';
import '../features/order/order_detailscreen/order_detail_screen.dart';
import '../features/products/products.dart';
import '../features/reservations/reservation.dart';
import '../features/sales/sales.dart';
import '../features/splash/splash.dart';
import '../features/tastings/tastings.dart';

List<GetPage> routes() => [
      GetPage(
          name: "/",
          page: () => 
          // const CreateOrderScreen(),
           const SplashScreen(),
          transition: Transition.fadeIn
          ),
      GetPage(
          name: "/dashboard",
          page: () => const DashboardScreen(),
          transition: Transition.cupertino),
      GetPage(
          name: "/login",
          page: () => const LogInScreen(),
          transition: Transition.cupertino),
      GetPage(
          name: "/orders",
          page: () => const OrdersScreen(),
          transition: Transition.cupertino),
      GetPage(
        name: "/orderdetailscreen",
        page: () => const OrderDetailScreen(),
        transition: Transition.cupertino,
      ),
      GetPage(
        name: "/createorders",
        page: () => const CreateOrderScreen(),
        transition: Transition.cupertino,
      ),
      GetPage(
          name: "/tastings",
          page: () => const TastingsScreen(),
          transition: Transition.cupertino),
      GetPage(
          name: "/reservations",
          page: () => const ReservationScreen(),
          transition: Transition.cupertino),
      GetPage(
          name: "/manufacturers",
          page: () => const ManufacturersScreen(),
          transition: Transition.cupertino),
      GetPage(
          name: "/sales",
          page: () => const SalesScreen(),
          transition: Transition.cupertino),
      GetPage(
          name: "/products",
          page: () => const ProductsScreen(),
          transition: Transition.cupertino),
      GetPage(
          name: "/customers",
          page: () => const CustomerssScreen(),
          transition: Transition.cupertino),
      GetPage(
          name: "/imports",
          page: () => const ImportsScreen(),
          transition: Transition.cupertino),
      GetPage(
          name: "/createorders",
          page: () => const DashboardScreen(),
          transition: Transition.cupertino),
    ];
