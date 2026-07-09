import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:skai_widgetbook/feature/common/widget/app_glass_card.dart';

final appGlassCardComponent = WidgetbookComponent(
  name: 'AppGlassCard',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final title = context.knobs.string(
          label: 'Title',
          initialValue: 'Default Glass Card',
        );
        final blur = context.knobs.double.slider(
          label: 'Blur',
          initialValue: 24,
          min: 0,
          max: 40,
          divisions: 20,
        );
        final topHighlight = context.knobs.boolean(
          label: 'Top highlight',
          initialValue: true,
        );

        return Center(
          child: SizedBox(
            width: 320,
            child: AppGlassCard(
              sigmaXBlur: blur,
              sigmaYBlur: blur,
              showTopHighlight: topHighlight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(title),
              ),
            ),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Clickable',
      builder: (context) => const _ClickableGlassCard(),
    ),
    WidgetbookUseCase(
      name: 'Circular',
      builder: (context) => const Center(
        child: SizedBox(
          width: 160,
          height: 160,
          child: AppGlassCard(
            width: 160,
            height: 160,
            isCircular: true,
            child: Center(
              child: Icon(Icons.person),
            ),
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Custom Content',
      builder: (context) => Center(
        child: SizedBox(
          width: 320,
          child: AppGlassCard(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Glass Card',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Example content displayed inside the component.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  ],
);

class _ClickableGlassCard extends StatefulWidget {
  const _ClickableGlassCard();

  @override
  State<_ClickableGlassCard> createState() => _ClickableGlassCardState();
}

class _ClickableGlassCardState extends State<_ClickableGlassCard> {
  bool _tapped = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 320,
        child: AppGlassCard(
          onTap: () {
            setState(() {
              _tapped = !_tapped;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _tapped ? Icons.check_circle : Icons.touch_app,
                ),
                const SizedBox(width: 8),
                Text(
                  _tapped ? 'Tapped!' : 'Tap to interact',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
