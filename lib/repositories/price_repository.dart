class PriceRepository {
  int totalPrice = 0;

  void totalCost(int newQuantity, String size) {
    totalPrice = newQuantity * (size == 'footlong' ? 11 : 7);
  }
}
