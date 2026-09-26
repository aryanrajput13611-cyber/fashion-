import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const FashionApp());
}

// Auto-login so user directly lands on Home screen
bool isUserLoggedIn = true;

class FashionApp extends StatelessWidget {
  const FashionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashion Store',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9F6F0),
        primaryColor: const Color(0xFFE86B35),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE86B35),
          primary: const Color(0xFFE86B35),
        ),
        useMaterial3: true,
      ),
      home: isUserLoggedIn ? const MainNavigationScreen() : const AuthScreen(),
    );
  }
}

class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final String image;
  final String description;
  final double rating;
  final int reviewsCount;
  bool isWishlist;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.description,
    this.rating = 4.8,
    this.reviewsCount = 142,
    this.isWishlist = false,
  });
}

class CartItem {
  final Product product;
  final String size;
  int quantity;

  CartItem({required this.product, required this.size, this.quantity = 1});
}

class OrderItem {
  final String orderId;
  final String title;
  final double price;
  final String date;
  final String status;
  final int currentStep;

  OrderItem({
    required this.orderId,
    required this.title,
    required this.price,
    required this.date,
    required this.status,
    required this.currentStep,
  });
}

class AddressItem {
  final String name;
  final String address;
  final String phone;
  bool isSelected;

  AddressItem({
    required this.name,
    required this.address,
    required this.phone,
    this.isSelected = false,
  });
}

List<Product> globalProducts = [
  Product(
    id: "1",
    name: "Men's Pullover Hoodie",
    category: "Tops",
    price: 130.0,
    image: "https://images.unsplash.com/photo-1556905055-8f358a7a47b2?w=500&q=80",
    description: "Premium pure cotton microsuede pullover hoodie. Ultra-soft breathable interior for maximum comfort.",
    rating: 4.9,
    reviewsCount: 340,
    isWishlist: true,
  ),
  Product(
    id: "2",
    name: "Classic Beige Sweatshirt",
    category: "Tops",
    price: 95.0,
    image: "https://images.unsplash.com/photo-1578768079052-aa76e520028b?w=500&q=80",
    description: "Relaxed fit round-neck warm pullover designed with high quality imported brushed fleece material.",
    rating: 4.7,
    reviewsCount: 195,
    isWishlist: false,
  ),
  Product(
    id: "3",
    name: "White Jordan Air Sneakers",
    category: "Footwear",
    price: 180.0,
    image: "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=500&q=80",
    description: "Retro street style sneakers with lightweight air cushioning and non-slip soft rubber soles.",
    rating: 5.0,
    reviewsCount: 820,
    isWishlist: false,
  ),
  Product(
    id: "4",
    name: "Designer UV400 Sunglasses",
    category: "Accessories",
    price: 45.0,
    image: "https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=500&q=80",
    description: "Polarized UV400 protective stylish unisex luxury sunglasses with golden rim frame.",
    rating: 4.6,
    reviewsCount: 112,
    isWishlist: false,
  ),
  Product(
    id: "5",
    name: "Urban Cargo Joggers",
    category: "Bottoms",
    price: 75.0,
    image: "https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?w=500&q=80",
    description: "Comfort stretch cargo joggers featuring 6 utility pockets and drawstring elastic waistband.",
    rating: 4.8,
    reviewsCount: 215,
    isWishlist: false,
  ),
  Product(
    id: "6",
    name: "Minimalist Leather Watch",
    category: "Accessories",
    price: 120.0,
    image: "https://images.unsplash.com/photo-1524805444758-089113d48a6d?w=500&q=80",
    description: "Water-resistant stainless steel analog quartz watch with genuine leather strap.",
    rating: 4.9,
    reviewsCount: 460,
    isWishlist: false,
  ),
];

List<CartItem> globalCart = [
  CartItem(product: globalProducts[2], size: "M", quantity: 1),
];

List<OrderItem> globalOrders = [
  OrderItem(
    orderId: "ORD#9482",
    title: "Men's Pullover Hoodie",
    price: 130.0,
    date: "27 Sep 2026",
    status: "Out for Delivery",
    currentStep: 3,
  ),
];

List<AddressItem> globalAddresses = [
  AddressItem(
    name: "Sunan Kumar",
    address: "Attakulangara, Main Road, FPSRA87, Thiruvananthapuram",
    phone: "9310758470",
    isSelected: true,
  ),
  AddressItem(
    name: "Sunny",
    address: "Near Hotel Indraprastha, Attakulangara",
    phone: "9310758470",
    isSelected: false,
  ),
];

String userProfileName = "Sunan Kumar";
String userProfilePhone = "9310758470";
String userProfileEmail = "sunankumar77@gmail.com";
String userProfilePic = "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300&q=80";
String selectedPaymentMethod = "UPI (Google Pay / PhonePe)";

final List<String> gallerySamplePhotos = [
  "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300&q=80",
  "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=300&q=80",
  "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&q=80",
  "https://images.unsplash.com/photo-1517841905240-472988babdf9?w=300&q=80",
  "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=300&q=80",
  "https://images.unsplash.com/photo-1580489944761-15a19d654956?w=300&q=80",
];

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  bool usePhoneAuth = false;
  bool isPasswordVisible = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController inputController = TextEditingController(text: "sunankumar77@gmail.com");
  final TextEditingController passwordController = TextEditingController(text: "815313Aam");

  void _submitAuth() {
    final input = inputController.text.trim();
    if (input.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter Email or Phone Number")),
      );
      return;
    }

    if (!isLogin && nameController.text.trim().isNotEmpty) {
      userProfileName = nameController.text.trim();
    }
    if (input.contains("@")) {
      userProfileEmail = input;
    } else {
      userProfilePhone = input;
    }

    isUserLoggedIn = true;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
    );
  }

  void _openForgotPassword() {
    final resetCtrl = TextEditingController(text: inputController.text);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 24,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Forgot Password", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              "Enter Email or Phone number to receive 6-digit OTP code:",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: resetCtrl,
              decoration: InputDecoration(
                hintText: "Email or Phone Number",
                filled: true,
                fillColor: const Color(0xFFFBF8F5),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  final target = resetCtrl.text.trim().isEmpty ? inputController.text : resetCtrl.text.trim();
                  Navigator.pop(ctx);
                  _triggerRealOtpBanner(target);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE86B35),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Send Reset OTP", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _triggerRealOtpBanner(String target) {
    final randomOtp = (100000 + Random().nextInt(900000)).toString();

    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        backgroundColor: const Color(0xFF1E293B),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.mark_email_unread_outlined, color: Colors.amber, size: 18),
                SizedBox(width: 8),
                Text("SMS Notification: Fashion Store", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 4),
            Text("Your 6-Digit OTP for " + target + " is: " + randomOtp, style: const TextStyle(color: Colors.greenAccent, fontSize: 15, fontWeight: FontWeight.w900)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
            child: const Text("DISMISS", style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );

    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    });

    _showOtpDialog(randomOtp);
  }

  void _showOtpDialog(String generatedOtp) {
    final otpCtrl = TextEditingController();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => AlertDialog(
        title: const Text("Enter 6-Digit OTP", style: TextStyle(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(color: const Color(0xFFFFF3ED), borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  const Icon(Icons.check_circle_outline, color: Color(0xFFE86B35), size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Generated OTP: " + generatedOtp,
                      style: const TextStyle(color: Color(0xFFE86B35), fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                  TextButton(
                    onPressed: () => otpCtrl.text = generatedOtp,
                    child: const Text("Auto-fill", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: otpCtrl,
              keyboardType: TextInputType.number,
              maxLength: 6,
              textAlign: TextAlign.center,
              style: const TextStyle(letterSpacing: 6, fontWeight: FontWeight.bold, fontSize: 22),
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "------"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              Navigator.pop(c);
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (otpCtrl.text.trim() == generatedOtp) {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                Navigator.pop(c);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("OTP Verified successfully! Password reset unlocked.")),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Incorrect OTP. Please check the code.")),
                );
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE86B35)),
            child: const Text("Verify", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Column(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE86B35),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFE86B35).withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 36),
                ),
                const SizedBox(height: 14),
                const Text("FASHION", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, letterSpacing: 2)),
                Text(
                  isLogin ? "Welcome back! Login to explore trends" : "Create account to buy & sell fashion",
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(14)),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isLogin = true),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: isLogin ? Colors.white : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isLogin ? const Color(0xFFE86B35) : Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isLogin = false),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: !isLogin ? Colors.white : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: !isLogin ? const Color(0xFFE86B35) : Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        usePhoneAuth = !usePhoneAuth;
                        inputController.text = usePhoneAuth ? "9310758470" : "sunankumar77@gmail.com";
                      });
                    },
                    icon: Icon(
                      usePhoneAuth ? Icons.email_outlined : Icons.phone_android,
                      size: 16,
                      color: const Color(0xFFE86B35),
                    ),
                    label: Text(
                      usePhoneAuth ? "Use Email ID" : "Use Phone Number",
                      style: const TextStyle(color: Color(0xFFE86B35), fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                if (!isLogin) ...[
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      prefixIcon: const Icon(Icons.person_outline),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 14),
                ],
                TextField(
                  controller: inputController,
                  keyboardType: usePhoneAuth ? TextInputType.phone : TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: usePhoneAuth ? "Phone Number" : "Email ID",
                    prefixIcon: Icon(usePhoneAuth ? Icons.phone_android : Icons.alternate_email),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.grey),
                      onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                if (isLogin)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: _openForgotPassword,
                      child: const Text("Forgot Password?", style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ),
                  )
                else
                  const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _submitAuth,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE86B35),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    child: Text(
                      isLogin ? "Log In" : "Create Account",
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                TextButton(
                  onPressed: () {
                    isUserLoggedIn = true;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
                    );
                  },
                  child: const Text("Continue as Guest / Skip Login", style: TextStyle(color: Colors.grey, fontSize: 13, decoration: TextDecoration.underline)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(onRefresh: () => setState(() {})),
      SavedScreen(onRefresh: () => setState(() {})),
      CartScreen(onRefresh: () => setState(() {})),
      ProfileSettingsScreen(onRefresh: () => setState(() {})),
    ];

    final int wishlistCount = globalProducts.where((p) => p.isWishlist).length;

    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, spreadRadius: 2)
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: const Color(0xFFE86B35),
          unselectedItemColor: Colors.grey.shade400,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Badge(
                isLabelVisible: wishlistCount > 0,
                label: Text(wishlistCount.toString()),
                child: const Icon(Icons.favorite_border),
              ),
              activeIcon: const Icon(Icons.favorite),
              label: "Saved",
            ),
            BottomNavigationBarItem(
              icon: Badge(
                isLabelVisible: globalCart.isNotEmpty,
                label: Text(globalCart.length.toString()),
                child: const Icon(Icons.shopping_bag_outlined),
              ),
              activeIcon: const Icon(Icons.shopping_bag),
              label: "Cart",
            ),
            const BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: "Account"),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final VoidCallback onRefresh;
  const HomeScreen({super.key, required this.onRefresh});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategoryIndex = 0;
  final List<String> categories = ["All", "Tops", "Footwear", "Accessories", "Bottoms"];
  String searchQuery = "";

  void _openInteractiveCameraScanner() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const VisualScannerScreen()),
    );
    if (mounted) {
      setState(() {});
      widget.onRefresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filtered = globalProducts.where((p) {
      final matchesCategory = selectedCategoryIndex == 0 || p.category == categories[selectedCategoryIndex];
      final matchesSearch = p.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          p.category.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE86B35),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("FASHION", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, letterSpacing: 1)),
                        Text("Deliver to: " + userProfileName, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        await Navigator.push(context, MaterialPageRoute(builder: (c) => const SellerHubScreen()));
                        if (mounted) {
                          setState(() {});
                          widget.onRefresh();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF3ED),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFE86B35)),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.storefront, color: Color(0xFFE86B35), size: 16),
                            SizedBox(width: 4),
                            Text("Sell", style: TextStyle(color: Color(0xFFE86B35), fontWeight: FontWeight.bold, fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    IconButton(
                      icon: const Icon(Icons.notifications_none_outlined),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Special Coupon 'SAVE20' active for 20% discount!")),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      onChanged: (val) => setState(() => searchQuery = val),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search shoes, hoodies, sunglasses...",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.center_focus_strong, color: Color(0xFFE86B35)),
                    tooltip: "Scan Outfit / Camera Lens",
                    onPressed: _openInteractiveCameraScanner,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFFE86B35), Color(0xFFFF9E70)]),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE86B35).withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(color: Colors.white.withOpacity(0.3), borderRadius: BorderRadius.circular(6)),
                          child: const Text("FLASH SALE • 40% OFF", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
                        ),
                        const SizedBox(height: 8),
                        const Text("Autumn Streetwear Trends", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        const Text("Use coupon 'SAVE20' at cart checkout", style: TextStyle(color: Colors.white70, fontSize: 11)),
                      ],
                    ),
                  ),
                  const Icon(Icons.local_offer_outlined, color: Colors.white, size: 48),
                ],
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: 38,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
                itemBuilder: (BuildContext context, int index) {
                  final isSelected = selectedCategoryIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => selectedCategoryIndex = index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFE86B35) : Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Trending Clothes & Shoes", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(filtered.length.toString() + " Items", style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 12),
            filtered.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text("No matching products found.", style: TextStyle(color: Colors.grey)),
                    ),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filtered.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 0.68,
                    ),
                    itemBuilder: (BuildContext context, int idx) {
                      final prod = filtered[idx];
                      return GestureDetector(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProductDetailScreen(product: prod)),
                          );
                          if (mounted) {
                            setState(() {});
                            widget.onRefresh();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 4)),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(prod.image, height: 130, width: double.infinity, fit: BoxFit.cover),
                                  ),
                                  Positioned(
                                    top: 6,
                                    right: 6,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() => prod.isWishlist = !prod.isWishlist);
                                        widget.onRefresh();
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(prod.isWishlist ? "Added to Wishlist ❤️" : "Removed from Wishlist"),
                                            duration: const Duration(seconds: 1),
                                          ),
                                        );
                                      },
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.white.withOpacity(0.9),
                                        child: Icon(
                                          prod.isWishlist ? Icons.favorite : Icons.favorite_border,
                                          color: prod.isWishlist ? Colors.red : Colors.grey,
                                          size: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 14),
                                  const SizedBox(width: 4),
                                  Text(prod.rating.toString(), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                                  Text(" (" + prod.reviewsCount.toString() + ")", style: const TextStyle(fontSize: 10, color: Colors.grey)),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                prod.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    r'$ ' + prod.price.toStringAsFixed(2),
                                    style: const TextStyle(color: Color(0xFFE86B35), fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      globalCart.add(CartItem(product: prod, size: "M"));
                                      widget.onRefresh();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("Added " + prod.name + " to Cart! 🛒"),
                                          duration: const Duration(seconds: 1),
                                        ),
                                      );
                                    },
                                    child: const CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Color(0xFFE86B35),
                                      child: Icon(Icons.add, color: Colors.white, size: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class VisualScannerScreen extends StatefulWidget {
  const VisualScannerScreen({super.key});

  @override
  State<VisualScannerScreen> createState() => _VisualScannerScreenState();
}

class _VisualScannerScreenState extends State<VisualScannerScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  bool isScanning = true;
  Product? detectedProduct;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    Timer(const Duration(milliseconds: 2200), () {
      if (mounted) {
        setState(() {
          isScanning = false;
          detectedProduct = globalProducts[0];
        });
      }
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.65,
              child: Image.network(
                "https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=800&q=80",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text("Visual Search Lens", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.flash_on, color: Colors.amber),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Center(
                  child: Container(
                    width: 260,
                    height: 260,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE86B35), width: 3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        if (isScanning)
                          AnimatedBuilder(
                            animation: _animController,
                            builder: (context, child) {
                              return Positioned(
                                top: _animController.value * 240,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 3,
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    boxShadow: [
                                      BoxShadow(color: Colors.red.withOpacity(0.8), blurRadius: 10, spreadRadius: 3),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  isScanning ? "Scanning outfit & fabric textures..." : "100% Outfit Match Found!",
                  style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                if (detectedProduct != null)
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(detectedProduct!.image, width: 60, height: 60, fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("MATCHED PRODUCT", style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                              Text(detectedProduct!.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                              Text(r'$ ' + detectedProduct!.price.toStringAsFixed(2), style: const TextStyle(color: Color(0xFFE86B35), fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => ProductDetailScreen(product: detectedProduct!)),
                            );
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE86B35)),
                          child: const Text("View", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: FloatingActionButton(
                    backgroundColor: const Color(0xFFE86B35),
                    onPressed: () {
                      setState(() {
                        isScanning = true;
                        detectedProduct = null;
                      });
                      Timer(const Duration(seconds: 2), () {
                        if (mounted) {
                          setState(() {
                            isScanning = false;
                            detectedProduct = globalProducts[2];
                          });
                        }
                      });
                    },
                    child: const Icon(Icons.camera, color: Colors.white, size: 30),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SavedScreen extends StatefulWidget {
  final VoidCallback onRefresh;
  const SavedScreen({super.key, required this.onRefresh});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    final wishlistItems = globalProducts.where((p) => p.isWishlist).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist & Saved", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: wishlistItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 64, color: Colors.grey.shade400),
                  const SizedBox(height: 12),
                  const Text("Your wishlist is empty!", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                  const SizedBox(height: 6),
                  const Text("Tap the heart on any product to save it here", style: TextStyle(color: Colors.black45, fontSize: 13)),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: wishlistItems.length,
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 12),
              itemBuilder: (BuildContext context, int index) {
                final item = wishlistItems[index];
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(item.image, width: 65, height: 65, fit: BoxFit.cover),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            const SizedBox(height: 4),
                            Text(r'$ ' + item.price.toStringAsFixed(2), style: const TextStyle(color: Color(0xFFE86B35), fontWeight: FontWeight.bold, fontSize: 14)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          globalCart.add(CartItem(product: item, size: "M"));
                          widget.onRefresh();
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Moved to cart! 🛍️")));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE86B35),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        ),
                        child: const Text("Add Cart", style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                        onPressed: () {
                          setState(() => item.isWishlist = false);
                          widget.onRefresh();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

class SellerHubScreen extends StatefulWidget {
  const SellerHubScreen({super.key});

  @override
  State<SellerHubScreen> createState() => _SellerHubScreenState();
}

class _SellerHubScreenState extends State<SellerHubScreen> {
  final nameCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final imgCtrl = TextEditingController(text: "https://images.unsplash.com/photo-1523381294911-8d3cead13475?w=500&q=80");
  final descCtrl = TextEditingController();
  String selectedCat = "Tops";
  final List<String> availableCats = ["Tops", "Footwear", "Accessories", "Bottoms"];

  void _saveProduct() {
    if (nameCtrl.text.trim().isEmpty || priceCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter Product Name and Price")));
      return;
    }

    final double? parsedPrice = double.tryParse(priceCtrl.text.trim());
    if (parsedPrice == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid price format")));
      return;
    }

    final newProduct = Product(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: nameCtrl.text.trim(),
      category: selectedCat,
      price: parsedPrice,
      image: imgCtrl.text.trim().isNotEmpty ? imgCtrl.text.trim() : "https://images.unsplash.com/photo-1523381294911-8d3cead13475?w=500&q=80",
      description: descCtrl.text.trim().isNotEmpty ? descCtrl.text.trim() : "Handcrafted premium fashion product.",
      rating: 5.0,
      reviewsCount: 1,
      isWishlist: false,
    );

    globalProducts.insert(0, newProduct);
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Success! '" + newProduct.name + "' is now live on the store.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seller Hub • Add Product", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: const Color(0xFFFFF3ED), borderRadius: BorderRadius.circular(12)),
              child: const Row(
                children: [
                  Icon(Icons.storefront, color: Color(0xFFE86B35)),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Publish your clothing & accessories. Listed items immediately appear on the Home store for buyers!",
                      style: TextStyle(color: Color(0xFFE86B35), fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "Product Name (e.g. Denim Jacket)", border: OutlineInputBorder())),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: priceCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Price (\$)", border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedCat,
                    decoration: const InputDecoration(labelText: "Category", border: OutlineInputBorder()),
                    items: availableCats.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                    onChanged: (val) => setState(() => selectedCat = val!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            TextField(
              controller: imgCtrl,
              decoration: const InputDecoration(
                labelText: "Product Image URL (JPG/PNG)",
                prefixIcon: Icon(Icons.image_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: descCtrl,
              maxLines: 3,
              decoration: const InputDecoration(labelText: "Product Description", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: _saveProduct,
                icon: const Icon(Icons.cloud_upload_outlined, color: Colors.white),
                label: const Text("Publish to Store", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE86B35),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String selectedSize = "M";
  final List<String> sizes = ["S", "M", "L", "XL", "2XL"];

  void _buyNow() {
    final newOrder = OrderItem(
      orderId: "ORD#" + DateTime.now().millisecondsSinceEpoch.toString().substring(7),
      title: widget.product.name + " (Size " + selectedSize + ")",
      price: widget.product.price,
      date: "Today",
      status: "Order Placed",
      currentStep: 1,
    );
    globalOrders.insert(0, newOrder);
    Navigator.push(context, MaterialPageRoute(builder: (c) => OrderTrackingScreen(order: newOrder)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              widget.product.isWishlist ? Icons.favorite : Icons.favorite_border,
              color: widget.product.isWishlist ? Colors.red : Colors.black87,
            ),
            onPressed: () {
              setState(() => widget.product.isWishlist = !widget.product.isWishlist);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(widget.product.isWishlist ? "Saved to Wishlist ❤️" : "Removed from Wishlist")),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Product link copied: fashionstore.com/item/" + widget.product.id)),
              );
            },
          ),
        ],
        centerTitle: true,
        title: const Text("Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(widget.product.image, height: 280, width: double.infinity, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(widget.product.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          Text(" " + widget.product.rating.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(r'$ ' + widget.product.price.toStringAsFixed(2), style: const TextStyle(fontSize: 22, color: Color(0xFFE86B35), fontWeight: FontWeight.bold)),
                  const SizedBox(height: 18),
                  const Text("Select Size", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 10),
                  Row(
                    children: sizes.map((size) {
                      final isSelected = selectedSize == size;
                      return GestureDetector(
                        onTap: () => setState(() => selectedSize = size),
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFFE86B35) : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: isSelected ? const Color(0xFFE86B35) : Colors.grey.shade300),
                          ),
                          child: Center(
                            child: Text(
                              size,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  const Text("Description", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 6),
                  Text(
                    widget.product.description,
                    style: TextStyle(color: Colors.grey.shade700, height: 1.5, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      globalCart.add(CartItem(product: widget.product, size: selectedSize));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added to Cart! 🛒")));
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: Color(0xFFE86B35)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Add to Cart", style: TextStyle(color: Color(0xFFE86B35), fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _buyNow,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE86B35),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Buy Now", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  final VoidCallback onRefresh;
  const CartScreen({super.key, required this.onRefresh});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final couponCtrl = TextEditingController();
  double discount = 0.0;
  bool isCouponApplied = false;

  double get subtotal {
    double total = 0.0;
    for (var item in globalCart) {
      total += (item.product.price * item.quantity);
    }
    return total;
  }

  double get finalTotal => max(0.0, subtotal - discount);

  void _applyCoupon() {
    if (couponCtrl.text.trim().toUpperCase() == "SAVE20") {
      setState(() {
        discount = subtotal * 0.20;
        isCouponApplied = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Coupon 'SAVE20' applied! You saved \$ " + discount.toStringAsFixed(2))),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid coupon. Try 'SAVE20'")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("My Cart", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
      body: globalCart.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag_outlined, size: 64, color: Colors.grey.shade400),
                  const SizedBox(height: 12),
                  const Text("Your cart is empty!", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(18),
                    itemCount: globalCart.length,
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 14),
                    itemBuilder: (BuildContext context, int index) {
                      final item = globalCart[index];
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(item.product.image, width: 70, height: 70, fit: BoxFit.cover),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                  Text("Size: " + item.size, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                                  const SizedBox(height: 6),
                                  Text(r'$ ' + item.product.price.toStringAsFixed(2), style: const TextStyle(color: Color(0xFFE86B35), fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline, size: 20, color: Colors.grey),
                                  onPressed: () => setState(() {
                                    if (item.quantity > 1) {
                                      item.quantity--;
                                    } else {
                                      globalCart.removeAt(index);
                                    }
                                  }),
                                ),
                                Text(item.quantity.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                                IconButton(
                                  icon: const Icon(Icons.add_circle, size: 20, color: Color(0xFFE86B35)),
                                  onPressed: () => setState(() => item.quantity++),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        const Icon(Icons.local_offer_outlined, color: Color(0xFFE86B35), size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: couponCtrl,
                            decoration: const InputDecoration(border: InputBorder.none, hintText: "Enter Promo Code (e.g. SAVE20)", hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ),
                        TextButton(
                          onPressed: _applyCoupon,
                          child: Text(isCouponApplied ? "APPLIED" : "APPLY", style: TextStyle(fontWeight: FontWeight.bold, color: isCouponApplied ? Colors.green : const Color(0xFFE86B35))),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Payment Method:", style: TextStyle(color: Colors.grey)),
                          Text(selectedPaymentMethod, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFFE86B35))),
                        ],
                      ),
                      if (discount > 0) ...[
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Discount (SAVE20):", style: TextStyle(color: Colors.green)),
                            Text("- \$ " + discount.toStringAsFixed(2), style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total :", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(r'$ ' + finalTotal.toStringAsFixed(2), style: const TextStyle(fontSize: 18, color: Color(0xFFE86B35), fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            final newOrder = OrderItem(
                              orderId: "ORD#" + DateTime.now().millisecondsSinceEpoch.toString().substring(7),
                              title: globalCart.length.toString() + " Fashion Items",
                              price: finalTotal,
                              date: "Today",
                              status: "Processing",
                              currentStep: 2,
                            );
                            globalOrders.insert(0, newOrder);
                            setState(() => globalCart.clear());
                            widget.onRefresh();
                            Navigator.push(context, MaterialPageRoute(builder: (c) => OrderTrackingScreen(order: newOrder)));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE86B35),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text("Pay & Place Order", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class OrderTrackingScreen extends StatelessWidget {
  final OrderItem order;
  const OrderTrackingScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track " + order.orderId),
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xFFFFF3ED),
                    radius: 28,
                    child: Icon(Icons.local_shipping_outlined, color: Color(0xFFE86B35), size: 30),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(order.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        const SizedBox(height: 4),
                        Text("Status: " + order.status, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13)),
                        Text("Arriving by tomorrow evening", style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text("Delivery Steps", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildStep("Order Confirmed", "Item packed by warehouse", true),
            _buildStep("Shipped", "Courier picked up package", order.currentStep >= 2),
            _buildStep("Out for Delivery", "Delivery agent arriving soon", order.currentStep >= 3),
            _buildStep("Delivered", "Delivered at doorstep", order.currentStep >= 4, isLast: true),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(String title, String desc, bool done, {bool isLast = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: done ? const Color(0xFFE86B35) : Colors.grey.shade300,
              child: Icon(Icons.check, size: 14, color: done ? Colors.white : Colors.grey),
            ),
            if (!isLast) Container(width: 2, height: 44, color: done ? const Color(0xFFE86B35) : Colors.grey.shade300),
          ],
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: done ? Colors.black87 : Colors.grey)),
              Text(desc, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileSettingsScreen extends StatefulWidget {
  final VoidCallback onRefresh;
  const ProfileSettingsScreen({super.key, required this.onRefresh});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  void _editProfileSheet() {
    final nameCtrl = TextEditingController(text: userProfileName);
    final phoneCtrl = TextEditingController(text: userProfilePhone);
    final emailCtrl = TextEditingController(text: userProfileEmail);
    final photoUrlCtrl = TextEditingController(text: userProfilePic);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (ctx) => StatefulBuilder(
        builder: (context, setSheetState) => Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Edit Profile & Photo", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 14),
                const Text("Pick from Phone Gallery / Avatars:", style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 8),
                SizedBox(
                  height: 65,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: gallerySamplePhotos.length,
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
                    itemBuilder: (BuildContext context, int idx) {
                      final pic = gallerySamplePhotos[idx];
                      final isSelected = userProfilePic == pic;
                      return GestureDetector(
                        onTap: () {
                          setSheetState(() {
                            userProfilePic = pic;
                            photoUrlCtrl.text = pic;
                          });
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: isSelected ? const Color(0xFFE86B35) : Colors.transparent, width: 3),
                          ),
                          child: CircleAvatar(radius: 28, backgroundImage: NetworkImage(pic)),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: photoUrlCtrl,
                  decoration: const InputDecoration(labelText: "Or Paste Custom Photo Link (URL)", prefixIcon: Icon(Icons.link), border: OutlineInputBorder()),
                  onChanged: (val) {
                    if (val.isNotEmpty) setSheetState(() => userProfilePic = val);
                  },
                ),
                const SizedBox(height: 12),
                TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "Full Name", border: OutlineInputBorder())),
                const SizedBox(height: 12),
                TextField(controller: phoneCtrl, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: "Phone Number", border: OutlineInputBorder())),
                const SizedBox(height: 12),
                TextField(controller: emailCtrl, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(labelText: "Email ID", border: OutlineInputBorder())),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        userProfileName = nameCtrl.text;
                        userProfilePhone = phoneCtrl.text;
                        userProfileEmail = emailCtrl.text;
                        if (photoUrlCtrl.text.isNotEmpty) userProfilePic = photoUrlCtrl.text;
                      });
                      widget.onRefresh();
                      Navigator.pop(ctx);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Profile updated successfully!")));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE86B35)),
                    child: const Text("Save Changes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openPaymentMethods() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => StatefulBuilder(
        builder: (context, setPaymentState) => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Select Payment Method", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 14),
              RadioListTile<String>(
                value: "CASH (Cash on Delivery)",
                groupValue: selectedPaymentMethod,
                title: const Text("CASH (Cash on Delivery)", style: TextStyle(fontWeight: FontWeight.bold)),
                secondary: const Icon(Icons.money, color: Colors.green),
                activeColor: const Color(0xFFE86B35),
                onChanged: (val) {
                  setPaymentState(() => selectedPaymentMethod = val!);
                  setState(() {});
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment set to: " + val!)));
                },
              ),
              RadioListTile<String>(
                value: "UPI (Google Pay / PhonePe)",
                groupValue: selectedPaymentMethod,
                title: const Text("UPI (Google Pay / PhonePe)", style: TextStyle(fontWeight: FontWeight.bold)),
                secondary: const Icon(Icons.account_balance_wallet, color: Colors.blue),
                activeColor: const Color(0xFFE86B35),
                onChanged: (val) {
                  setPaymentState(() => selectedPaymentMethod = val!);
                  setState(() {});
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment set to: " + val!)));
                },
              ),
              RadioListTile<String>(
                value: "CARD (Debit / Credit)",
                groupValue: selectedPaymentMethod,
                title: const Text("CARD (Credit / Debit Card)", style: TextStyle(fontWeight: FontWeight.bold)),
                secondary: const Icon(Icons.credit_card, color: Colors.deepPurple),
                activeColor: const Color(0xFFE86B35),
                onChanged: (val) {
                  setPaymentState(() => selectedPaymentMethod = val!);
                  setState(() {});
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment set to: " + val!)));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openAddresses() {
    final nameCtrl = TextEditingController();
    final addrCtrl = TextEditingController();
    final phCtrl = TextEditingController();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => StatefulBuilder(
          builder: (context, setAddrState) => Scaffold(
            appBar: AppBar(title: const Text("Saved addresses"), centerTitle: true),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: const Color(0xFFEDF4FE), borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: const Icon(Icons.my_location, color: Colors.blueAccent),
                      title: const Text("Use my current location", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 14)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.blueAccent),
                      onTap: () {
                        setAddrState(() {
                          globalAddresses.insert(
                            0,
                            AddressItem(
                              name: userProfileName,
                              address: "GPS Auto-detect: Main Road, Attakulangara, Thiruvananthapuram",
                              phone: userProfilePhone,
                              isSelected: true,
                            ),
                          );
                          for (int i = 1; i < globalAddresses.length; i++) {
                            globalAddresses[i].isSelected = false;
                          }
                        });
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Current GPS location saved!")));
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: const Icon(Icons.add, color: Colors.blueAccent),
                      title: const Text("+ Add New Address", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 14)),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (c) => AlertDialog(
                            title: const Text("Add New Address"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "Receiver Name")),
                                TextField(controller: phCtrl, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: "Phone Number")),
                                TextField(controller: addrCtrl, maxLines: 2, decoration: const InputDecoration(labelText: "Full Address with Pincode")),
                              ],
                            ),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(c), child: const Text("Cancel")),
                              ElevatedButton(
                                onPressed: () {
                                  if (nameCtrl.text.isNotEmpty && addrCtrl.text.isNotEmpty) {
                                    setAddrState(() {
                                      globalAddresses.add(AddressItem(
                                        name: nameCtrl.text,
                                        address: addrCtrl.text,
                                        phone: phCtrl.text.isNotEmpty ? phCtrl.text : userProfilePhone,
                                      ));
                                    });
                                    Navigator.pop(c);
                                  }
                                },
                                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE86B35)),
                                child: const Text("Save", style: TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.separated(
                      itemCount: globalAddresses.length,
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
                      itemBuilder: (BuildContext context, int idx) {
                        final addr = globalAddresses[idx];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: addr.isSelected ? const Color(0xFFE86B35) : Colors.transparent, width: 1.5),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.home, color: addr.isSelected ? const Color(0xFFE86B35) : Colors.grey),
                            title: Text(addr.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            subtitle: Text(addr.address + "\nPhone: " + addr.phone, style: const TextStyle(fontSize: 12)),
                            trailing: IconButton(
                              icon: Icon(
                                addr.isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                                color: addr.isSelected ? const Color(0xFFE86B35) : Colors.grey,
                              ),
                              onPressed: () {
                                setAddrState(() {
                                  for (var a in globalAddresses) {
                                    a.isSelected = false;
                                  }
                                  addr.isSelected = true;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openMyOrders() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          appBar: AppBar(title: const Text("My Orders"), centerTitle: true),
          body: globalOrders.isEmpty
              ? const Center(child: Text("No orders placed yet!"))
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: globalOrders.length,
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 12),
                  itemBuilder: (BuildContext context, int i) {
                    final ord = globalOrders[i];
                    return GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => OrderTrackingScreen(order: ord))),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(ord.orderId, style: const TextStyle(fontWeight: FontWeight.bold)),
                                Text(ord.title, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                                Text(ord.date, style: const TextStyle(fontSize: 11, color: Colors.black45)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(r'$ ' + ord.price.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFE86B35))),
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(6)),
                                  child: Text(ord.status, style: const TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  void _openCustomerSupport() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Customer Support & Help", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            ListTile(
              leading: const CircleAvatar(backgroundColor: Color(0xFFFFF3ED), child: Icon(Icons.email, color: Color(0xFFE86B35))),
              title: const Text("Email Support"),
              subtitle: const Text("support@fashionstore.com"),
              trailing: const Icon(Icons.send, size: 18, color: Color(0xFFE86B35)),
              onTap: () {
                Navigator.pop(ctx);
                showDialog(
                  context: context,
                  builder: (c) => AlertDialog(
                    title: const Text("Email Support Ticket"),
                    content: const Text("Ticket generated!\nAddressed to: support@fashionstore.com\nResponse time: Under 2 hours."),
                    actions: [TextButton(onPressed: () => Navigator.pop(c), child: const Text("OK"))],
                  ),
                );
              },
            ),
            ListTile(
              leading: const CircleAvatar(backgroundColor: Color(0xFFEDF4FE), child: Icon(Icons.phone, color: Colors.blueAccent)),
              title: const Text("Helpline Calling"),
              subtitle: const Text("+91 9310758470"),
              onTap: () {
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Calling support helpline +91 9310758470...")));
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account Settings"), centerTitle: true, backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: _editProfileSheet,
                    child: Stack(
                      children: [
                        CircleAvatar(radius: 36, backgroundColor: const Color(0xFFE86B35), backgroundImage: NetworkImage(userProfilePic)),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(color: Color(0xFFE86B35), shape: BoxShape.circle),
                            child: const Icon(Icons.camera_alt, color: Colors.white, size: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userProfileName, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                        Text(userProfileEmail, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        Text("+91 " + userProfilePhone, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                  IconButton(icon: const Icon(Icons.edit, color: Color(0xFFE86B35)), onPressed: _editProfileSheet)
                ],
              ),
            ),
            const SizedBox(height: 18),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3ED),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE86B35).withOpacity(0.4)),
              ),
              child: ListTile(
                leading: const Icon(Icons.storefront, color: Color(0xFFE86B35), size: 28),
                title: const Text("Seller Hub (List your Products)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFFE86B35))),
                subtitle: const Text("Add clothes, set price & sell to buyers", style: TextStyle(fontSize: 11)),
                trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFFE86B35)),
                onTap: () async {
                  await Navigator.push(context, MaterialPageRoute(builder: (c) => const SellerHubScreen()));
                  if (mounted) widget.onRefresh();
                },
              ),
            ),
            _buildTile(Icons.person_outline, "Edit profile", _editProfileSheet),
            _buildTile(Icons.location_on_outlined, "Saved addresses", _openAddresses),
            _buildTile(Icons.local_shipping_outlined, "My Orders (Live Tracking)", _openMyOrders),
            _buildTile(Icons.payment_outlined, "Payment Methods", _openPaymentMethods, subtitle: selectedPaymentMethod),
            _buildTile(Icons.contact_mail_outlined, "Customer Support (Email & Helpline)", _openCustomerSupport),
            const SizedBox(height: 12),
            ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text("Log Out", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
              onTap: () {
                isUserLoggedIn = false;
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const AuthScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(IconData icon, String title, VoidCallback onTap, {String? subtitle}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.black87),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        subtitle: subtitle != null ? Text(subtitle, style: const TextStyle(fontSize: 11, color: Color(0xFFE86B35))) : null,
        trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
