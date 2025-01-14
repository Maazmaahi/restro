part of '../widgets.dart';

class CartButton extends StatelessWidget {
  final DishModel dish;
  final String label;
  final Size? minimumSize;

  const CartButton({
    super.key,
    required this.dish,
    this.label = "ADD",
    this.minimumSize,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final translate = context.translate;
    final colorScheme = context.theme.colorScheme;
    return dish.outOfStock
        ? Text(
            translate?.outOfStock ?? "Out of Stock",
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.red),
          )
        : cartProvider.dishes.contains(dish)
            ? Row(
                children: [
                  _buildCartUpdateButton(
                    colorScheme: colorScheme,
                    label: "-",
                    onTap: () =>
                        cartProvider.increaseOrDecreaseQuantity(item: dish),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    "${dish.orderedQuantity}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 16),
                  _buildCartUpdateButton(
                    colorScheme: colorScheme,
                    label: "+",
                    onTap: () => cartProvider.increaseOrDecreaseQuantity(
                        item: dish, increase: true),
                  ),
                ],
              )
            : PrimaryButton(
                minimumSize: minimumSize,
                text: label,
                onPressed: () => cartProvider.addOrRemoveCart(item: dish),
              );
  }

  Widget _buildCartUpdateButton({
    required ColorScheme colorScheme,
    required String label,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
