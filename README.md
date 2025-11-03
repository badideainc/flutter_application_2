```markdown
# Sandwich Shop — Flutter Application 2

A simple cross-platform Flutter app for a sandwich shop: browse menu, customize sandwiches, place orders, and view order history. Built as a starter template you can extend with real backend, payments, and push notifications.

## Key features
- Menu browsing with categories
- Sandwich customization (ingredients, size)
- Add to cart and place orders (local/mock)
- Order history and simple state management

## Installation & setup (brief)
Prereqs:
- macOS / Linux / Windows
- Flutter SDK (stable) — https://docs.flutter.dev/get-started/install
- Android Studio or Xcode (for emulators)

Clone and install:
git clone https://github.com/badideainc/flutter_application_2.git
cd flutter_application_2
flutter pub get

Run:
flutter run
flutter devices      # list devices
flutter run -d <id>  # run on specific device

## Usage (brief)
- Launch app → Home/Menu screen.
- Tap a sandwich to customize ingredients/size → Add to cart.
- Open Cart → Checkout to place an order.
- Orders saved locally (view in Order History).

Run tests:
flutter test

Add screenshots to docs/screenshots/ and reference them here:
![Home Screen](docs/screenshots/home.png)

## Project structure & tech
- lib/ — app code
  - main.dart — entry & routes
  - screens/ — UI screens
  - widgets/ — reusable widgets
  - models/, services/ — data and logic
- pubspec.yaml — deps and assets

Tech: Flutter, Dart. Optional packages: provider/riverpod, http/dio.

## Known limitations & contributions
- Currently uses local/mock order storage — no backend or payments.
- Missing features: auth, real payments, push notifications, CI.
Contributions: fork, create branch feature/xxx, open PR.

## Contact
Maintainer: badideainc — https://github.com/badideainc
(Include email or additional links as desired.)
```
