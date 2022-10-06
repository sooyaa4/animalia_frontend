import 'package:animalia_frontend/pages/cartTreatmentPage.dart';
import 'package:animalia_frontend/pages/cart_pages.dart';
import 'package:animalia_frontend/pages/checkout_page_treatment.dart';
import 'package:animalia_frontend/pages/checkout_pages.dart';
import 'package:animalia_frontend/pages/checkout_success.dart';
import 'package:animalia_frontend/pages/edit_password.dart';
import 'package:animalia_frontend/pages/edit_profile.dart';
import 'package:animalia_frontend/pages/halaman_bayar.dart';
import 'package:animalia_frontend/pages/halaman_wishlist.dart';
import 'package:animalia_frontend/pages/home/main_page.dart';
import 'package:animalia_frontend/pages/pembelian.dart';
import 'package:animalia_frontend/pages/sign_in_page.dart';
import 'package:animalia_frontend/pages/sign_up_page.dart';
import 'package:animalia_frontend/pages/splash_page.dart';
import 'package:animalia_frontend/pages/treatment.dart';
import 'package:animalia_frontend/providers/auth_provider.dart';
import 'package:animalia_frontend/providers/cart_provider.dart';
import 'package:animalia_frontend/providers/cart_treatment_proivider.dart';
import 'package:animalia_frontend/providers/fetch_data_provider.dart';
import 'package:animalia_frontend/providers/histori_transaksi_barang.dart';
import 'package:animalia_frontend/providers/histori_transaksi_treatment.dart';
import 'package:animalia_frontend/providers/jeniskirim_provider.dart';
import 'package:animalia_frontend/providers/kategori_provider.dart';
import 'package:animalia_frontend/providers/metode_bayar_provider.dart';
import 'package:animalia_frontend/providers/product_barang_provider.dart';
import 'package:animalia_frontend/providers/transaksi_barang_provider.dart';
import 'package:animalia_frontend/providers/transaksi_treatment.dart';
import 'package:animalia_frontend/providers/treatment_provider.dart';
import 'package:animalia_frontend/providers/wishlist_provider.dart';
import 'package:animalia_frontend/widgets/otp.dart';
import 'package:animalia_frontend/widgets/pembayaran_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductBarangProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransaksiBarangprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TreatmentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartTreatmentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransaksiTreatmentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HistoriBarangProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HistoriTreatmentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FetchDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MetodeBayarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => JenisKirimProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => KategoriProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (contex) => SplashPage(),
          '/sign-in': (contex) => SignInPage(),
          '/sign-up': (contex) => SignUpPage(),
          '/home': (contex) => MainPage(),
          '/edit-profile': (contex) => EditProfilePage(),
          '/edit-password': (contex) => EditPasswordPage(),
          '/histori-beli': (contex) => PembelianPage(),
          '/histori-treatment': (contex) => HistoriTreatmentPage(),
          '/cart': (contex) => CartPage(),
          '/cartt': (context) => CartTreatmentPage(),
          '/wishlist': (context) => WishListPage(),
          '/checkout': (contex) => CheckoutPage(),
          '/checkouttreatment': (contex) => CheckoutTreatmentPage(),
          '/checkout-success': (contex) => CheckoutSuccessPage(),
          '/otp': (context) => OtpPage(),
          '/bayar': (context) => PembayaranCard(),
          '/halaman-bayar': (context) => HalamanBayar(),
        },
      ),
    );
  }
}
