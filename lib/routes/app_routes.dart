import 'package:get/get.dart';
import 'package:makemyhome/features/authentication/screens/login/login.dart';
import 'package:makemyhome/features/authentication/screens/signup/widgets/signup.dart';
import 'package:makemyhome/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:makemyhome/features/personalization/screens/profile/profile.dart';
import 'package:makemyhome/features/personalization/screens/setting/setting.dart';
import 'package:makemyhome/features/personalization/screens/address/address.dart';
import 'package:makemyhome/features/shop/screens/cart/cart.dart';
import 'package:makemyhome/features/shop/screens/checkout/checkout.dart';
import 'package:makemyhome/features/shop/screens/home/home.dart';
import 'package:makemyhome/features/shop/screens/order/order.dart';
import 'package:makemyhome/features/shop/screens/product_reviews/product_review.dart';
import 'package:makemyhome/features/shop/screens/store/store.dart';
import 'package:makemyhome/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
        GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signin, page: () => const LoginScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
  ];
}