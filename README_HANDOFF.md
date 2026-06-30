# skai_data_mobile — исходники для Widgetbook-каталога

Это разовая передача исходников UI-кита для задачи **«Widgetbook — каталог UI-кита»**.
Тебе НЕ нужен VPN и доступ к основному репо — собираешь каталог в своём публичном репо `skai-widgetbook`.

## Что внутри

```
lib/core/theme/         — дизайн-токены (AppColors, AppSpacing, AppTypography, AppTheme, ProgressBarColors)
lib/core/extensions/    — context_extension (context.colorScheme/textTheme/l10n/progressBarColors), datetime_extension
lib/feature/common/widget/ — сами компоненты для каталога (AppButton, AppCard, AppGlassCard,
                             AppTextField/AppPasswordField, AppDateRangePicker, AppConfirmCard,
                             AppErrorWidget, AppLoading, AppSwitcher, AppRadialProgressChart, CustomAppBar,
                             flush_bar_builder, radial_progress_painter)
lib/feature/_extra/     — точечные зависимости, которые тянут некоторые виджеты:
                             company_analytics_entity.dart (модель для AppRadialProgressChart),
                             app_type_drop_down.dart, assets.gen.dart (пути к ассетам)
```

## Внешние пакеты — добавь в pubspec.yaml своего репо

```yaml
dependencies:
  flutter_svg: ^2.0.0
  intl: ^0.20.0
  google_fonts: ^6.0.0
  glassmorphism: ^3.0.0
  another_flushbar: ^1.12.30
  mask_text_input_formatter: ^2.9.0
  auto_route: ^10.0.0   # нужен только custom_app_bar — можно выкинуть виджет, если мешает
dev_dependencies:
  widgetbook: ^3.0.0
  widgetbook_annotation: ^3.0.0
  widgetbook_generator: ^3.0.0   # если возьмёшь annotation-режим
```
Версии подгони под актуальные на pub.dev — это ориентир, не догма.

## Известные места, где нужен «стаб» (это часть задачи, не баг)

1. **l10n / `context.l10n`** — `context_extension.dart` импортирует `package:skai_widgetbook/l10n/generated/l10n.dart`,
   которого тут НЕТ (это сгенерённые корп-строки). Варианты:
   - проще всего: в каталоге замени вызовы `context.l10n.xxx` на обычные строки-плейсхолдеры
     («Заголовок», «Применить» и т.п.) — для витрины этого достаточно;
   - либо сделай минимальный фейковый `Localization` с нужными геттерами.
2. **`assets.gen.dart` / SVG-иконки** — если виджет тянет иконку из ассетов, положи любой свой SVG/PNG
   и поправь путь, или замени на `Icon(Icons.*)`. Реальные ассеты не передаю.
3. **`auto_route`** — нужен только `custom_app_bar.dart`. Если возни много — исключи этот виджет из каталога
   (в DoD ≥10 компонентов, их хватает и без него).

## Подсказки по сборке каталога

- Тема: используй `AppTheme.light` / `AppTheme.dark` как `themes` в Widgetbook + аддон переключения темы.
- Не забудь зарегистрировать `ProgressBarColors` как ThemeExtension (см. `app_theme.dart`) — иначе
  `context.progressBarColors` упадёт на force-unwrap.
- Golden-тесты: начни с самых стабильных — `AppButton`, `AppCard`, `AppGlassCard`, `AppSwitcher` (light+dark).

Вопросы по конкретному виджету — пиши в карточку, добавлю недостающий файл.
