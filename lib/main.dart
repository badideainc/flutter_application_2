import 'package:flutter/material.dart';

enum BreadType { Wheat, White, Multigrain }

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sandwich Shop App',
      home: OrderScreen(maxQuantity: 5),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  //final int quantity;
  final String itemType;
  final String notes;
  final BreadType breadType;

  const OrderItemDisplay(
    this.notes,
    this.itemType,
    this.breadType, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${breadType.name} $itemType sandwich: ${'🥪'} \nNotes: ${notes.isEmpty ? "(no note)" : notes}',
    );
  }
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

// ...existing code...
class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;
  final List<String> _notes = [];
  final List<String> _sizes = [];
  final List<BreadType> _breadTypes = [];
  final TextEditingController _noteController = TextEditingController();

  final List<String> _availableSizes = ['Footlong', '6-inch'];
  String _selectedSize = 'Footlong';

  BreadType _selectedBread = BreadType.Wheat;

  void _increaseQuantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() {
        _quantity++;
        _notes.add(_noteController.text);
        _sizes.add(_selectedSize);
        _breadTypes.add(_selectedBread);
        _noteController.clear();
      });
    }
  }

  void _decreaseQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
        _notes.removeLast();
        _sizes.removeLast();
        _breadTypes.removeLast();
      });
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    _sizes.removeLast();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sandwich Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_notes.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _notes.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: OrderItemDisplay(
                        _notes[index],
                        _sizes[index],
                        _breadTypes[index],
                      ),
                    );
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 8.0,
              ),
              child: TextField(
                controller: _noteController,
                decoration: const InputDecoration(
                  labelText: 'Add a note (e.g., "no onions", "extra pickles")',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            DropdownButton<String>(
              value: _selectedSize,
              items: _availableSizes.map((String size) {
                return DropdownMenuItem<String>(value: size, child: Text(size));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSize = newValue!;
                });
              },
            ),
            SegmentedButton<BreadType>(
              segments: BreadType.values
                  .map(
                    (b) =>
                        ButtonSegment<BreadType>(value: b, label: Text(b.name)),
                  )
                  .toList(),
              selected: <BreadType>{_selectedBread},
              onSelectionChanged: (Set<BreadType> newSelection) {
                setState(() {
                  _selectedBread = newSelection.first;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _quantity < widget.maxQuantity
                      ? _increaseQuantity
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    surfaceTintColor: Colors.redAccent,
                  ),
                  child: const Text('+ Add'),
                ),
                ElevatedButton(
                  onPressed: _quantity > 0 ? _decreaseQuantity : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    surfaceTintColor: Colors.redAccent,
                  ),
                  child: const Text('- Remove'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
