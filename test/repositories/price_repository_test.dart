import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_2/repositories/price_repository.dart';

void main() {
  group('PriceRepository', () {
    test('initial quantity should be 0', () {
      final repository = PriceRepository();
      expect(repository.totalPrice, 0);
    });
    test('Price of 1 footlong', () {
      final repository = PriceRepository();
      repository.totalCost(1, 'footlong');
      expect(repository.totalPrice, 11);
    });
    test('Price of 2 six-inches', () {
      final repository = PriceRepository();
      repository.totalCost(2, 'six-inch');
      expect(repository.totalPrice, 14);
    });
  });
}
