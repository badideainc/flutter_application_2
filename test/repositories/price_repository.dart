import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_2/repositories/price_repository.dart';

void main() {
  group('PriceRepository', () {
    test('initial quantity should be 0', () {
      final repository = PriceRepository(quantity: 0, size: 'footlong');
      expect(repository.TotalCost(), 0);
    });
    test('Price of 1 footlong', () {
      final repository = PriceRepository(quantity: 1, size: 'footlong');
      expect(repository.TotalCost(), 11);
    });
    test('Price of 2 six-inches', () {
      final repository = PriceRepository(quantity: 2, size: 'six-inch');
      expect(repository.TotalCost(), 14);
    });
  });
}
