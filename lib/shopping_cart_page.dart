import 'package:flutter/material.dart';

//colors (purple & black theme)
const Color kPurple = Color(0xFF8B5CF6);
const Color kPurpleDark = Color(0xFF6D28D9);
const Color kPurpleTint = Color(0xFF2A1B4D);
const Color kPageBg = Color(0xFF0A0A0F);
const Color kCard = Color(0xFF16161D);
const Color kText = Colors.white;
const Color kGrey = Color(0xFFA1A1B5);
const Color kBorder = Color(0xFF2C2C3A);

//Static data
const String studentName = 'JM Neoda';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBg,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIntroSection(),
              const SizedBox(height: 10),
              _buildDeliveryCard(),
              const SizedBox(height: 12),
              _buildOrderItemsHeader(),
              const SizedBox(height: 8),
              const CartItemCard(
                name: 'Wireless Keyboard',
                price: 'PHP 4,500.00',
                quantity: 1,
                icon: Icons.keyboard_outlined,
              ),
              const SizedBox(height: 8),
              const CartItemCard(
                name: 'CPU Cooler',
                price: 'PHP 1,500.00',
                quantity: 1,
                icon: Icons.memory,
              ),
              const SizedBox(height: 8),
              const CartItemCard(
                name: 'Laptop Stand',
                price: 'PHP 850.00',
                quantity: 1,
                icon: Icons.laptop_mac,
              ),
              const SizedBox(height: 8),
              const CartItemCard(
                name: 'Wireless Mouse',
                price: 'PHP 450.00',
                quantity: 1,
                icon: Icons.mouse_outlined,
              ),
              const SizedBox(height: 10),
              _buildDiscountBanner(),
              const SizedBox(height: 10),
              _buildPaymentSummary(),
              const SizedBox(height: 10),
              _buildPlaceOrderButton(),
            ],
          ),
        ),
      ),
    );
  }

  //AppBar
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 52,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: kText),
        onPressed: () => debugPrint('Back clicked'),
      ),
      title: const Text(
        'My Cart',
        style: TextStyle(
          color: kText,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined,
                    color: kText, size: 26),
                onPressed: () => debugPrint('Cart clicked'),
              ),
              Positioned(
                top: 4,
                right: 2,
                child: Container(
                  width: 18,
                  height: 18,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: kPurple,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '4',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Introduction
  Widget _buildIntroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: kPurpleTint,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: kPurple.withOpacity(0.6)),
          ),
          child: const Text(
            'CAMPUS STORE',
            style: TextStyle(
              color: kPurple,
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Ready for checkout',
          style: TextStyle(
            color: kText,
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 2),
        const Text(
          'Review your items before placing your order.',
          style: TextStyle(color: kGrey, fontSize: 12),
        ),
      ],
    );
  }

  //Delivery card
  Widget _buildDeliveryCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: kPurpleTint,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.location_on, color: kPurple, size: 22),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deliver to $studentName',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kText,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'DDC, Davao City',
                  style: TextStyle(color: kGrey, fontSize: 12),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => debugPrint('Change delivery address clicked'),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: const Size(0, 32),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'Change',
              style: TextStyle(
                color: kPurple,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Order items header
  Widget _buildOrderItemsHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Order Items',
          style: TextStyle(
            color: kText,
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          '4 items',
          style: TextStyle(color: kGrey, fontSize: 12),
        ),
      ],
    );
  }

  //Discount banner
  Widget _buildDiscountBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: kPurpleTint,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kPurple.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.local_offer_outlined, color: kPurple, size: 24),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'STUDENT10 applied',
                  style: TextStyle(
                    color: kText,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  '15% discount on items',
                  style: TextStyle(color: kGrey, fontSize: 12),
                ),
              ],
            ),
          ),
          const Icon(Icons.check_circle, color: kPurple, size: 26),
        ],
      ),
    );
  }

  //Payment summary
  // Subtotal: 4,500 + 1,500 + 850 + 450 = 7,300
  // Discount 15%: 1,095  |  Delivery: 100  |  Total: 6,305
  Widget _buildPaymentSummary() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: _cardDecoration(),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: TextStyle(
              color: kText,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 8),
          SummaryRow(label: 'Subtotal', amount: 'PHP 7,300.00'),
          SizedBox(height: 4),
          SummaryRow(label: 'Discount (15%)', amount: '- PHP 1,095.00'),
          SizedBox(height: 4),
          SummaryRow(label: 'Delivery Fee', amount: 'PHP 100.00'),
          SizedBox(height: 8),
          Divider(color: kBorder, thickness: 1.5, height: 1),
          SizedBox(height: 8),
          SummaryRow(
            label: 'Total',
            amount: 'PHP 6,305.00',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  //Place order button
  Widget _buildPlaceOrderButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: () =>
            debugPrint('Place order clicked! Total: PHP 6305.00'),
        style: ElevatedButton.styleFrom(
          backgroundColor: kPurple,
          foregroundColor: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        icon: const Icon(Icons.lock, size: 20),
        label: const Text(
          'Place Order',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

//Shared card decoration
BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: kCard,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: kBorder),
  );
}

// Reusable widget: CartItemCard (compact)
class CartItemCard extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;
  final IconData icon;

  const CartItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          // Icon container
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: kPurpleTint,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: kPurple, size: 28),
          ),
          const SizedBox(width: 12),

          // Name, price, quantity controls
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: kText,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    // Delete button
                    SizedBox(
                      width: 28,
                      height: 24,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 22,
                        icon: const Icon(Icons.delete_outline, color: kGrey),
                        onPressed: () => debugPrint('Remove item: $name'),
                      ),
                    ),
                  ],
                ),
                Text(
                  price,
                  style: const TextStyle(
                    color: kPurple,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    _QtyButton(
                      icon: Icons.remove,
                      onPressed: () => debugPrint('Decrease quantity: $name'),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 40,
                      height: 28,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: kBorder),
                      ),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                          color: kText,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _QtyButton(
                      icon: Icons.add,
                      onPressed: () => debugPrint('Increase quantity: $name'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Small filled +/- button used inside CartItemCard
class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _QtyButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kPurpleDark,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 36,
          height: 28,
          child: Icon(icon, color: Colors.white, size: 18),
        ),
      ),
    );
  }
}

// Reusable widget: SummaryRow (label + aligned amount)
class SummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isTotal;

  const SummaryRow({
    super.key,
    required this.label,
    required this.amount,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle labelStyle = TextStyle(
      color: kText,
      fontSize: isTotal ? 18 : 14,
      fontWeight: isTotal ? FontWeight.w900 : FontWeight.w400,
    );
    final TextStyle amountStyle = labelStyle.copyWith(
      color: isTotal ? kPurple : kText,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(label, style: labelStyle)),
        Text(amount, style: amountStyle),
      ],
    );
  }
}