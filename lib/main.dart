import 'package:flutter/material.dart';
void main() {
runApp(const FashionApp());
}
class FashionApp extends StatelessWidget {
const FashionApp({super.key});
@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Fashion',
theme: ThemeData(
scaffoldBackgroundColor: const Color(0xFFFBF8F5),
primaryColor: const Color(0xFFE86B35),
colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE86B35)),
useMaterial3: true,
),
home: const AuthScreen(),
);
}
}
// ================= GLOBAL DATA & MODELS =================
class Product {
final String id;
final String name;
final String category;
final double price;
final String image;
final String description;
Product({
required this.id,
required this.name,
required this.category,
required this.price,
required this.image,
required this.description,
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
price: 130.00,
image: "https://images.unsplash.com/photo-1556905055-8f358a7a47b2?w=500&q=80",
description: "Microsuede Cropped hoodie with elegant, soft finish. Pure cotton material designed for daily premium comfort.",
),
Product(
id: "2",
name: "Classic Beige Sweatshirt",
category: "Tops",
price: 95.00,
image: "https://images.unsplash.com/photo-1578768079052-aa76e520028b?w=500&q=80",
description: "Relaxed fit round-neck warm pullover designed with high quality fleece lining.",
),
Product(
id: "3",
name: "White Jordan Sneakers",
category: "Footwear",
price: 180.00,
image: "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=500&q=80",
description: "Clean retro street style sneakers crafted with lightweight cushioning and soft rubber soles.",
),
Product(
id: "4",
name: "Designer UV Sunglasses",
category: "Accessories",
price: 45.00,
image: "https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=500&q=80",
description: "Polarized UV400 protective stylish unisex sunglasses.",
),
];
List<Product> globalFavorites = [globalProducts[0]];
List<CartItem> globalCart = [
CartItem(product: globalProducts[2], size: "M", quantity: 1),
];
List<OrderItem> globalOrders = [
OrderItem(
orderId: "ORD#9482",
title: "Men's Pullover Hoodie",
price: 130.00,
date: "26 Sep 2026",
status: "Out for Delivery",
currentStep: 3,
),
];
List<AddressItem> globalAddresses = [
AddressItem(
name: "Sunan Kumar",
address: "Wraps on wheels, Attakulangara, Main Road, FPSRA87, Thiruvananthapuram",
phone: "9310758470",
isSelected: true,
),
AddressItem(
name: "Sunny",
address: "Wraps on wheels, Attakulangara, Near Hotel Indraprastha",
phone: "9310758470",
isSelected: false,
),
];
// Profile State
String userProfileName = "Sunan Kumar";
String userProfilePhone = "9310758470";
String userProfileEmail = "sunankumar77@gmail.com";
String userProfilePic = "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300&q=80";
String selectedPaymentMethod = "UPI (Google Pay / PhonePe)";
bool notificationEnabled = true;
String currentLanguage = "English";
final List<String> defaultAvatars = [
"https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300&q=80",
"https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=300&q=80",
"https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&q=80",
"https://images.unsplash.com/photo-1517841905240-472988babdf9?w=300&q=80",
"https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=300&q=80",
"https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=300&q=80",
];
// ================= AUTH SCREEN =================
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
final pwd = passwordController.text.trim();
if (input.isEmpty || pwd.isEmpty) {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text("Please fill all required fields")),
);
return;
}
if (!isLogin && nameController.text.trim().isNotEmpty) {
userProfileName = nameController.text.trim();
}
if (input.contains('@')) {
userProfileEmail = input;
} else {
userProfilePhone = input;
}
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
shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
builder: (context) => Padding(
padding: EdgeInsets.only(
left: 24,
right: 24,
top: 24,
bottom: MediaQuery.of(context).viewInsets.bottom + 24,
),
child: Column(
mainAxisSize: MainAxisSize.min,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Row(
children: [
Icon(Icons.lock_outline, color: Color(0xFFE86B35)),
SizedBox(width: 8),
Text("Forgot Password", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
],
),
const SizedBox(height: 8),
const Text(
"Enter your registered Email ID or Phone Number to receive a 6-digit OTP verification code.",
style: TextStyle(color: Colors.grey, fontSize: 13),
),
const SizedBox(height: 16),
TextField(
controller: resetCtrl,
decoration: InputDecoration(
hintText: "Email or Phone Number",
prefixIcon: const Icon(Icons.verified_user_outlined),
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
Navigator.pop(context);
_showOtpVerificationDialog(resetCtrl.text);
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
void _showOtpVerificationDialog(String target) {
final otpCtrl = TextEditingController();
showDialog(
context: context,
builder: (c) => AlertDialog(
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
title: const Text("Enter 6-Digit OTP"),
content: Column(
mainAxisSize: MainAxisSize.min,
children: [
Text("OTP code sent to $target. Enter code (e.g. 123456):", style: const TextStyle(fontSize: 13, color: Colors.grey)),
const SizedBox(height: 14),
TextField(
controller: otpCtrl,
keyboardType: TextInputType.number,
maxLength: 6,
textAlign: TextAlign.center,
style: const TextStyle(letterSpacing: 6, fontWeight: FontWeight.bold, fontSize: 18),
decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "123456"),
),
],
),
actions: [
TextButton(onPressed: () => Navigator.pop(c), child: const Text("Cancel")),
ElevatedButton(
onPressed: () {
Navigator.pop(c);
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text("OTP Verified! You can now login.")),
);
},
style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE86B35)),
child: const Text("Verify & Reset", style: TextStyle(color: Colors.white)),
)
],
),
);
}
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFFFBF8F5),
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
BoxShadow(color: const Color(0xFFE86B35).withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 5)),
],
),
child: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 36),
),
const SizedBox(height: 14),
const Text("FASHION", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, letterSpacing: 2)),
Text(
isLogin ? "Welcome back! Login to explore trends" : "Create account to buy & track orders",
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
style: TextStyle(fontWeight: FontWeight.bold, color: isLogin ? const Color(0xFFE86B35) : Colors.black54),
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
style: TextStyle(fontWeight: FontWeight.bold, color: !isLogin ? const Color(0xFFE86B35) : Colors.black54),
),
),
),
),
),
],
),
),
const SizedBox(height: 14),
Row(
mainAxisAlignment: MainAxisAlignment.end,
children: [
TextButton.icon(
onPressed: () {
setState(() {
usePhoneAuth = !usePhoneAuth;
inputController.text = usePhoneAuth ? "9310758470" : "sunankumar77@gmail.com";
});
},
icon: Icon(usePhoneAuth ? Icons.email_outlined : Icons.phone_android, size: 16, color: const Color(0xFFE86B35)),
label: Text(
usePhoneAuth ? "Use Email ID" : "Use Phone Number",
style: const TextStyle(color: Color(0xFFE86B35), fontSize: 12, fontWeight: FontWeight.bold),
),
),
],
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
hintText: usePhoneAuth ? "Phone Number (e.g. 9310758470)" : "Email ID",
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
if (isLogin) ...[
Align(
alignment: Alignment.centerRight,
child: TextButton(
onPressed: _openForgotPassword,
child: const Text("Forgot Password?", style: TextStyle(color: Colors.grey, fontSize: 12)),
),
),
] else ...[
const SizedBox(height: 18),
],
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
],
),
),
),
),
);
}
}
// ================= MAIN NAVIGATION =================
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
const SavedScreen(),
CartScreen(onRefresh: () => setState(() {})),
ProfileSettingsScreen(onRefresh: () => setState(() {})),
];
return Scaffold(
body: pages[_currentIndex],
bottomNavigationBar: Container(
decoration: BoxDecoration(
color: Colors.white,
borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, spreadRadius: 2)],
),
child: BottomNavigationBar(
currentIndex: _currentIndex,
onTap: (index) => setState(() => _currentIndex = index),
backgroundColor: Colors.transparent,
elevation: 0,
selectedItemColor: const Color(0xFFE86B35),
unselectedItemColor: Colors.grey.shade400,
type: BottomNavigationBarType.fixed,
items: const [
BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Saved'),
BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Account'),
],
),
),
);
}
}
// ================= HOME SCREEN WITH SEARCH LENS =================
class HomeScreen extends StatefulWidget {
final VoidCallback onRefresh;
const HomeScreen({super.key, required this.onRefresh});
@override
State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
int selectedCategoryIndex = 0;
final List<String> categories = ["All", "Tops", "Footwear", "Accessories"];
void _openSearchLens() {
showModalBottomSheet(
context: context,
shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
builder: (context) => Padding(
padding: const EdgeInsets.all(22),
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
const Row(
children: [
Icon(Icons.center_focus_strong, color: Color(0xFFE86B35), size: 28),
SizedBox(width: 10),
Text("Search Lens - Visual Match", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
],
),
const SizedBox(height: 12),
const Text(
"Take a photo of any cloth, shoe or outfit from your camera or gallery to find matching items instantly.",
style: TextStyle(color: Colors.grey, fontSize: 13),
),
const SizedBox(height: 20),
Row(
children: [
Expanded(
child: ElevatedButton.icon(
onPressed: () {
Navigator.pop(context);
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text("Camera Lens opened! Matching visual outfits...")),
);
},
icon: const Icon(Icons.camera_alt, color: Colors.white),
label: const Text("Camera Lens", style: TextStyle(color: Colors.white)),
style: ElevatedButton.styleFrom(
backgroundColor: const Color(0xFFE86B35),
padding: const EdgeInsets.symmetric(vertical: 12),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
),
),
),
const SizedBox(width: 12),
Expanded(
child: OutlinedButton.icon(
onPressed: () {
Navigator.pop(context);
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text("Gallery Photo picked! 4 matches found.")),
);
},
icon: const Icon(Icons.photo_library, color: Color(0xFFE86B35)),
label: const Text("Gallery", style: TextStyle(color: Color(0xFFE86B35))),
style: OutlinedButton.styleFrom(
padding: const EdgeInsets.symmetric(vertical: 12),
side: const BorderSide(color: Color(0xFFE86B35)),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
),
),
),
],
)
],
),
),
);
}
@override
Widget build(BuildContext context) {
final filtered = selectedCategoryIndex == 0
? globalProducts
: globalProducts.where((p) => p.category == categories[selectedCategoryIndex]).toList();
return SafeArea(
child: SingleChildScrollView(
padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
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
decoration: BoxDecoration(color: const Color(0xFFE86B35), borderRadius: BorderRadius.circular(14)),
child: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
),
const SizedBox(width: 12),
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text("FASHION", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, letterSpacing: 1)),
Text("Deliver to: $userProfileName", style: const TextStyle(color: Colors.grey, fontSize: 11)),
],
),
],
),
IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_outlined)),
],
),
const SizedBox(height: 16),
// Search Bar with Lens
Container(
padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8)]),
child: Row(
children: [
const Icon(Icons.search, color: Colors.grey),
const SizedBox(width: 8),
const Expanded(
child: TextField(
decoration: InputDecoration(
border: InputBorder.none,
hintText: "Search shoes, hoodies, styles...",
hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
),
),
),
IconButton(
icon: const Icon(Icons.mic, color: Colors.grey, size: 20),
onPressed: () {},
),
IconButton(
icon: const Icon(Icons.center_focus_strong, color: Color(0xFFE86B35), size: 22),
tooltip: "Search Lens",
onPressed: _openSearchLens,
),
],
),
),
const SizedBox(height: 18),
// Category Chips
SizedBox(
height: 36,
child: ListView.separated(
scrollDirection: Axis.horizontal,
itemCount: categories.length,
separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
itemBuilder: (context, index) {
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
child: Text(categories[index], style: TextStyle(color: isSelected ? Colors.white : Colors.black87, fontWeight: FontWeight.w600, fontSize: 12)),
),
),
);
},
),
),
const SizedBox(height: 20),
// Products Grid
const Text("Trending Clothes & Shoes", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
const SizedBox(height: 12),
GridView.builder(
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
itemCount: filtered.length,
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
crossAxisSpacing: 14,
mainAxisSpacing: 14,
childAspectRatio: 0.72,
),
itemBuilder: (context, idx) {
final prod = filtered[idx];
return GestureDetector(
onTap: () async {
await Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product: prod)));
setState(() {});
},
child: Container(
padding: const EdgeInsets.all(12),
decoration: BoxDecoration(color: Colors.white, border
