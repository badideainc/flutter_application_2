class PriceRepository {
  final int quantity;
  final String size;

  PriceRepository({required this.quantity, required this.size});

  int TotalCost() => quantity * (size == 'footlong' ? 11 : 7);
}
