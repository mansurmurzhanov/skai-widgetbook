# Skai Widgetbook

Live UI-kit catalog for Skai Flutter components.

GitHub Pages: https://mansurmurzhanov.github.io/skai-widgetbook/

## What's Included

- Widgetbook catalog with Light/Dark theme switching via `AppTheme.light` and `AppTheme.dark`.
- 11 components: `AppButton`, `AppCard`, `AppGlassCard`, `AppTextField`, `AppPasswordField`, `AppDateRangePicker`, `AppConfirmCard`, `AppErrorWidget`, `AppLoading`, `AppSwitcher`, `AppRadialProgressChart`.
- Multiple states per component: default, disabled, loading, error, destructive, bounded ranges, long text, and custom variants.
- Knobs for key parameters on buttons, cards, glass cards, fields, errors, loading color, switchers, charts, confirmations, and date ranges.
- Golden tests for 5 stable components in light and dark themes.

## Run Locally

```sh
flutter pub get
flutter run -d chrome
```

Useful checks:

```sh
flutter analyze
flutter test
flutter build web --release
```

The GitHub Pages workflow runs `flutter test --exclude-tags golden` because pixel goldens are platform-sensitive between macOS and Linux runners.

Regenerate goldens after intentional visual changes:

```sh
flutter test --update-goldens
```

Golden snapshots live in `test/goldens/`.

## Add A Component

1. Add or adapt the component under `lib/feature/common/widget/`.
2. Create `lib/widgetbook/<component_name>/<component_name>_use_case.dart`.
3. Export a `WidgetbookComponent` with at least two `WidgetbookUseCase`s.
4. Add knobs with `context.knobs.*` for the parameters people need to inspect.
5. Register the component in `lib/widgetbook/widgetbook.dart`.
6. Add a golden test in `test/golden_test.dart` when the component is visually stable.

## GitHub Pages

The workflow in `.github/workflows/pages.yml` builds the web catalog with:

```sh
flutter build web --release --base-href /skai-widgetbook/
```

It publishes `build/web` to the `gh-pages` branch. In repository settings, set Pages source to `Deploy from a branch`, branch `gh-pages`, folder `/root`.
