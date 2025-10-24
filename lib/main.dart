import 'package:flutter/material.dart';

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

  const OrderItemDisplay(this.notes, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$itemType sandwich: ${'🥪'} \nNotes: ${notes.isEmpty ? "(no note)" : notes}',
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
  final TextEditingController _noteController = TextEditingController();

  final List<String> _availableSizes = ['Footlong', '6-inch'];
  String _selectedSize = 'Footlong';

  void _increaseQuantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() {
        _quantity++;
        _notes.add(_noteController.text);
        _sizes.add(_selectedSize);
        _noteController.clear();
      });
    }
  }

  void _decreaseQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
        _sizes.removeLast();
        _notes.removeLast();
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
                      child: OrderItemDisplay(_notes[index], _sizes[index]),
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
