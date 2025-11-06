Future<int> calculateTheAnswer() async {
  // Simulate a delay to mimic the delay in reading or writing a file
  await Future.delayed(const Duration(seconds: 2));
  return 42;
}

void main() async {
  print('Calculating...');
  int result = await calculateTheAnswer();
  print('The result is $result');
}
