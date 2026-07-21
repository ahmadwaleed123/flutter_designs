# Flutter Designs World

## Code Showcase

Alongside the static mockups below, this repo now has an actual runnable Flutter app (`lib/`) built with the same
architecture used across my production apps (health_care_app, physiomobile, groovy, bagtalk, city_explorer):

- Named routes via a `RouteGenerator` switch in `utils/routes.dart`
- `ChangeNotifier` providers wired through `MultiProvider`
- A `theme_constants.dart` design system: `AppColors`, `AppTextStyle`, `AppSpacing`, `AppRoundBorder`
- A shared `common_widgets` library: `AppCard`, `RoundActionButton`, `CustomAppbar`, `AppIconButton`, `ProfileAvatarWidget`

The app opens on a **design gallery** (`screens/design_gallery`) — a single home screen listing each app design as a
card. Tapping a live entry opens that design's own mini Flutter flow; the rest are listed as "Coming Soon" placeholders
for designs I plan to add next.

Live so far:

- **Finly Wallet** (`screens/finance_design`) — onboarding, login/signup, a 4-tab bottom nav (Home with balance card
  and weekly spend chart, Cards, Activity, Profile), a transaction detail screen, a full send-money flow (recipient →
  amount → review → success), and an add-card screen.
- **Health Care App** (`screens/healthcare_design`) — home screen with a "Find Best Specialists" hero, a Book
  Appointment screen with search + a doctor grid, and a doctor detail screen. Mirrors the `HealthCare App Design`
  screenshot below, rebuilt as real, running code instead of a static mockup.

It runs entirely on mock data (no backend required):

```bash
flutter pub get
flutter run -d chrome   # or any connected device/simulator
```

## Ai Health App Design

<img src="screenshots/alkhamy.jpeg"  width="1080"/>

## Eye-Guard Application Design

<img src="screenshots/eye_guard.jpeg"  width="1080"/>

## HealthCare App Design

<img src="screenshots/health_care.jpeg"  width="1080"/>

## Sigma Sold App Design

<img src="screenshots/sigma_sold.jpeg"  width="1080"/>

## Smart Solar Application Design

<img src="screenshots/smart_solar.jpeg"  width="1080"/>

## Student Plan

<img src="screenshots/student_plan.jpeg"  width="1080"/>