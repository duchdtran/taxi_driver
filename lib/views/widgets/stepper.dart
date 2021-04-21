// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//   * mobile horizontal mode with adding/removing steps
//   * alternative labeling
//   * stepper feedback in the case of high-latency interactions

/// The state of a [CustomStep] which is used to control the style of the circle and
/// text.
///
/// See also:
///
///  * [CustomStep]
enum CustomStepState {
  /// A step that displays its index in its circle.
  indexed,

  /// A step that displays a pencil icon in its circle.
  editing,

  /// A step that displays a tick icon in its circle.
  complete,

  /// A step that is disabled and does not to react to taps.
  disabled,

  /// A step that is currently having an error. e.g. the user has submitted wrong
  /// input.
  error,
}

/// Defines the [CustomStepper]'s main axis.
enum StepperType {
  /// A vertical layout of the steps with their content in-between the titles.
  vertical,

  /// A horizontal layout of the steps with their content below the titles.
  horizontal,
}

const Color _kErrorLight = Colors.red;
final Color _kErrorDark = Colors.red.shade400;
const double _kStepSize = 8;
const double _kTriangleHeight =
    _kStepSize * 0.866025; // Triangle height. sqrt(3.0) / 2.0

/// A material step used in [CustomStepper]. The step can have a title and subtitle,
/// an icon within its circle, some content and a state that governs its
/// styling.
///
/// See also:
///
///  * [CustomStepper]
///  * <https://material.io/archive/guidelines/components/steppers.html>
@immutable
class CustomStep {
  /// Creates a step for a [CustomStepper].
  ///
  /// The [title], [content], and [state] arguments must not be null.
  const CustomStep({
    @required this.title,
    @required this.content,
    this.subtitle,
    this.state = CustomStepState.indexed,
    this.isActive = false,
  })  : assert(title != null),
        assert(content != null),
        assert(state != null);

  /// The title of the step that typically describes it.
  final Widget title;

  /// The subtitle of the step that appears below the title and has a smaller
  /// font size. It typically gives more details that complement the title.
  ///
  /// If null, the subtitle is not shown.
  final Widget subtitle;

  /// The content of the step that appears below the [title] and [subtitle].
  ///
  /// Below the content, every step has a 'continue' and 'cancel' button.
  final Widget content;

  /// The state of the step which determines the styling of its components
  /// and whether steps are interactive.
  final CustomStepState state;

  /// Whether or not the step is active. The flag only influences styling.
  final bool isActive;
}

/// A material stepper widget that displays progress through a sequence of
/// steps. Steppers are particularly useful in the case of forms where one step
/// requires the completion of another one, or where multiple steps need to be
/// completed in order to submit the whole form.
///
/// The widget is a flexible wrapper. A parent class should pass [currentStep]
/// to this widget based on some logic triggered by the three callbacks that it
/// provides.
///
/// {@tool sample --template=stateful_widget_scaffold_center}
///
/// ```dart
/// int _index = 0;
/// Widget build(BuildContext context) {
///   return Container(
///     height: 300,
///     width: 300,
///     child: Stepper(
///       currentStep: _index,
///       onStepCancel: () {
///         if (_index <= 0) {
///          return;
///         }
///         setState(() {
///           _index--;
///         });
///       },
///       onStepContinue: () {
///         if (_index >= 1) {
///          return;
///         }
///         setState(() {
///           _index++;
///         });
///       },
///       onStepTapped: (index) {
///         setState(() {
///           _index = index;
///         });
///       },
///       steps: [
///         Step(
///           title: Text("Step 1 title"),
///           content: Container(
///             alignment: Alignment.centerLeft,
///             child: Text("Content for Step 1")
///           ),
///         ),
///         Step(
///           title: Text("Step 2 title"),
///           content: Text("Content for Step 2"),
///         ),
///       ],
///     ),
///   );
/// }
/// ```
///
/// {@end-tool}
///
/// See also:
///
///  * [CustomStep]
///  * <https://material.io/archive/guidelines/components/steppers.html>
class CustomStepper extends StatefulWidget {
  /// Creates a stepper from a list of steps.
  ///
  /// This widget is not meant to be rebuilt with a different list of steps
  /// unless a key is provided in order to distinguish the old stepper from the
  /// new one.
  ///
  /// The [steps], [type], and [currentStep] arguments must not be null.
  const CustomStepper({
    @required this.steps,
    Key key,
    this.physics,
    this.styleTitle,
    this.styleContent,
    this.type = StepperType.vertical,
    this.currentStep = 0,
    this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
    this.controlsBuilder,
  })  : assert(steps != null),
        assert(type != null),
        assert(currentStep != null),
        assert(0 <= currentStep && currentStep < steps.length),
        super(key: key);

  /// The steps of the stepper whose titles, subtitles, icons always get shown.
  ///
  /// The length of [steps] must not change.
  final List<CustomStep> steps;

  final TextStyle styleTitle;

  final TextStyle styleContent;

  /// How the stepper's scroll view should respond to user input.
  ///
  /// For example, determines how the scroll view continues to
  /// animate after the user stops dragging the scroll view.
  ///
  /// If the stepper is contained within another scrollable it
  /// can be helpful to set this property to [ClampingScrollPhysics].
  final ScrollPhysics physics;

  /// The type of stepper that determines the layout. In the case of
  /// [StepperType.horizontal], the content of the current step is displayed
  /// underneath as opposed to the [StepperType.vertical] case where it is
  /// displayed in-between.
  final StepperType type;

  /// The index into [steps] of the current step whose content is displayed.
  final int currentStep;

  /// The callback called when a step is tapped, with its index passed as
  /// an argument.
  final ValueChanged<int> onStepTapped;

  /// The callback called when the 'continue' button is tapped.
  ///
  /// If null, the 'continue' button will be disabled.
  final VoidCallback onStepContinue;

  /// The callback called when the 'cancel' button is tapped.
  ///
  /// If null, the 'cancel' button will be disabled.
  final VoidCallback onStepCancel;

  /// The callback for creating custom controls.
  ///
  /// If null, the default controls from the current theme will be used.
  ///
  /// This callback which takes in a context and two functions: [onStepContinue]
  /// and [onStepCancel]. These can be used to control the stepper.
  /// For example, keeping track of the [currentStep] within the callback can
  /// change the text of the continue or cancel button depending on which step users are at.
  ///
  /// {@tool dartpad --template=stateless_widget_scaffold}
  /// Creates a stepper control with custom buttons.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Stepper(
  ///     controlsBuilder:
  ///       (BuildContext context, { VoidCallback? onStepContinue, VoidCallback? onStepCancel }) {
  ///          return Row(
  ///            children: <Widget>[
  ///              TextButton(
  ///                onPressed: onStepContinue,
  ///                child: const Text('NEXT'),
  ///              ),
  ///              TextButton(
  ///                onPressed: onStepCancel,
  ///                child: const Text('CANCEL'),
  ///              ),
  ///            ],
  ///          );
  ///       },
  ///     steps: const <Step>[
  ///       Step(
  ///         title: Text('A'),
  ///         content: SizedBox(
  ///           width: 100.0,
  ///           height: 100.0,
  ///         ),
  ///       ),
  ///       Step(
  ///         title: Text('B'),
  ///         content: SizedBox(
  ///           width: 100.0,
  ///           height: 100.0,
  ///         ),
  ///       ),
  ///     ],
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  final ControlsWidgetBuilder controlsBuilder;

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper>
    with TickerProviderStateMixin {
  List<GlobalKey> _keys;
  final Map<int, CustomStepState> _oldStates = <int, CustomStepState>{};

  @override
  void initState() {
    super.initState();
    _keys = List<GlobalKey>.generate(
      widget.steps.length,
      (i) => GlobalKey(),
    );

    for (var i = 0; i < widget.steps.length; i += 1) {
      _oldStates[i] = widget.steps[i].state;
    }
  }

  @override
  void didUpdateWidget(CustomStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(widget.steps.length == oldWidget.steps.length);

    for (var i = 0; i < oldWidget.steps.length; i += 1) {
      _oldStates[i] = oldWidget.steps[i].state;
    }
  }

  // ignore: unused_element
  bool _isFirst(int index) {
    return index == 0;
  }

  bool _isLast(int index) {
    return widget.steps.length - 1 == index;
  }

  // ignore: unused_element
  bool _isCurrent(int index) {
    return widget.currentStep == index;
  }

  bool _isDark() {
    return Theme.of(context).brightness == Brightness.dark;
  }

  Widget _buildLine(bool visible) {
    return CustomPaint(
      size: Size(visible ? 1.0 : 0.0, 40),
      painter: DashedLineVerticalPainter(),
    );
  }

  Color _circleColor(int index, bool oldState) {
    final state = oldState ? _oldStates[index] : widget.steps[index].state;
    assert(state != null, 'State must not null');
    switch (state) {
      case CustomStepState.indexed:
      case CustomStepState.disabled:
        return const Color(0xFFBDBDBD);
      case CustomStepState.editing:
        return const Color(0xFFFFCE00);
      case CustomStepState.complete:
        return const Color(0xFF2DBB54);
      case CustomStepState.error:
        return const Color(0xFFFE0000);
    }
    return Colors.green;
  }

  Widget _buildCircle(int index, bool oldState) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: _kStepSize,
      height: _kStepSize,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        decoration: BoxDecoration(
          color: _circleColor(index, oldState),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildTriangle(int index, bool oldState) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: _kStepSize,
      height: _kStepSize,
      child: Center(
        child: SizedBox(
          width: _kStepSize,
          height:
              _kTriangleHeight, // Height of 24dp-long-sided equilateral triangle.
          child: CustomPaint(
            painter: _TrianglePainter(
              color: _isDark() ? _kErrorDark : _kErrorLight,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(int index) {
    if (widget.steps[index].state != _oldStates[index]) {
      return AnimatedCrossFade(
        firstChild: _buildCircle(index, true),
        secondChild: _buildTriangle(index, true),
        firstCurve: const Interval(0, 0.6, curve: Curves.fastOutSlowIn),
        secondCurve: const Interval(0.4, 1, curve: Curves.fastOutSlowIn),
        sizeCurve: Curves.fastOutSlowIn,
        crossFadeState: widget.steps[index].state == CustomStepState.error
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      );
    } else {
      if (widget.steps[index].state != CustomStepState.error) {
        return _buildCircle(index, false);
      } else {
        return _buildTriangle(index, false);
      }
    }
  }

  Widget _buildVerticalControls() {
    if (widget.controlsBuilder != null) {
      return widget.controlsBuilder(context,
          onStepContinue: widget.onStepContinue,
          onStepCancel: widget.onStepCancel);
    }

    Color cancelColor;
    switch (Theme.of(context).brightness) {
      case Brightness.light:
        cancelColor = Colors.black54;
        break;
      case Brightness.dark:
        cancelColor = Colors.white70;
        break;
    }

    final themeData = Theme.of(context);
    final  colorScheme = themeData.colorScheme;
    final  localizations =
        MaterialLocalizations.of(context);

    const OutlinedBorder buttonShape = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)));
    const  buttonPadding = EdgeInsets.symmetric(horizontal: 16);

    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 48),
        child: Row(
          // The Material spec no longer includes a Stepper widget. The continue
          // and cancel button styles have been configured to match the original
          // version of this widget.
          children: <Widget>[
            TextButton(
              onPressed: widget.onStepContinue,
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith<Color>(
                    ( states) {
                  return states.contains(MaterialState.disabled)
                      ? null
                      : (_isDark()
                          ? colorScheme.onSurface
                          : colorScheme.onPrimary);
                }),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    ( states) {
                  return _isDark() || states.contains(MaterialState.disabled)
                      ? null
                      : colorScheme.primary;
                }),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    buttonPadding),
                shape: MaterialStateProperty.all<OutlinedBorder>(buttonShape),
              ),
              child: Text(localizations.continueButtonLabel),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(start: 8),
              child: TextButton(
                onPressed: widget.onStepCancel,
                style: TextButton.styleFrom(
                  primary: cancelColor,
                  padding: buttonPadding,
                  shape: buttonShape,
                ),
                child: Text(localizations.cancelButtonLabel),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderText(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedDefaultTextStyle(
          style: widget.styleTitle ?? Theme.of(context).textTheme,
          duration: kThemeAnimationDuration,
          curve: Curves.fastOutSlowIn,
          child: widget.steps[index].title,
        ),
        if (widget.steps[index].subtitle != null)
          Container(
            margin: const EdgeInsets.only(top: 2),
            child: AnimatedDefaultTextStyle(
                style: widget.styleContent ?? Theme.of(context).textTheme,
                duration: kThemeAnimationDuration,
                curve: Curves.fastOutSlowIn,
                child: widget.steps[index].subtitle),
          ),
      ],
    );
  }

  Widget _buildVerticalHeader(int index) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            // Line parts are always added in order for the ink splash to
            // flood the tips of the connector lines.
            _buildIcon(index),
          ],
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsetsDirectional.only(start: 20),
            child: _buildHeaderText(index),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(bool visible) {
    return Container(
      width: double.infinity,
      height: 1,
      color: const Color(0xFFF6F6F6),
    );
  }

  Widget _buildVerticalBody(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: <Widget>[
          _buildLine(!_isLast(index)),
          Expanded(
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => widget.onStepTapped(index),
                    child: AnimatedDefaultTextStyle(
                      style: widget.styleContent,
                      duration: kThemeAnimationDuration,
                      curve: Curves.fastOutSlowIn,
                      child: widget.steps[index].content,
                    ),
                  ),
                  const SizedBox(
                    height: 13
                  ),
                  _buildDivider(!_isLast(index)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVertical() {
    return ListView(
      padding: const EdgeInsets.all(22),
      shrinkWrap: true,
      physics: widget.physics,
      children: <Widget>[
        for (int i = 0; i < widget.steps.length; i += 1)
          Column(
            key: _keys[i],
            children: <Widget>[
              _buildVerticalHeader(i),
              _buildVerticalBody(i),
            ],
          ),
      ],
    );
  }

  Widget _buildHorizontal() {
    final children = <Widget>[
      for (int i = 0; i < widget.steps.length; i += 1) ...<Widget>[
        InkResponse(
          onTap: widget.steps[i].state != CustomStepState.disabled
              ? () {
                  if (widget.onStepTapped != null) {
                    widget.onStepTapped(i);
                  }
                }
              : null,
          canRequestFocus: widget.steps[i].state != CustomStepState.disabled,
          child: Row(
            children: <Widget>[
              Container(
                height: 72,
                child: Center(
                  child: _buildIcon(i),
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(start: 12),
                child: _buildHeaderText(i),
              ),
            ],
          ),
        ),
        if (!_isLast(i))
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 1,
              color: Colors.grey.shade400,
            ),
          ),
      ],
    ];

    return Column(
      children: <Widget>[
        Material(
          elevation: 2,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: children,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            physics: widget.physics,
            padding: const EdgeInsets.all(24),
            children: <Widget>[
              AnimatedSize(
                curve: Curves.fastOutSlowIn,
                duration: kThemeAnimationDuration,
                vsync: this,
                child: widget.steps[widget.currentStep].content,
              ),
              _buildVerticalControls(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    assert(() {
      if (context.findAncestorWidgetOfExactType<CustomStepper>() != null) {
        throw FlutterError('Steppers must not be nested.\n'
            'The material specification advises that one should avoid embedding '
            'steppers within steppers. '
            'https://material.io/archive/guidelines/components/steppers.html#steppers-usage');
      }
      return true;
    }());
    assert(widget.type != null);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            offset: const Offset(0, 5),
            color: const Color(0xFF303030).withOpacity(0.1),
          )
        ],
      ),
      child: Builder(
        builder: (_) {
          switch (widget.type) {
            case StepperType.vertical:
              return _buildVertical();
            case StepperType.horizontal:
              return _buildHorizontal();
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const dashHeight = 5, dashSpace = 6;
    // ignore: omit_local_variable_types
    double startY = 0;
    final paint = Paint()
      ..color = size.width > 0 ? Colors.grey[300] : Colors.transparent
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawCircle(Offset(0, startY), 1.5, paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Paints a triangle whose base is the bottom of the bounding rectangle and its
// top vertex the middle of its top.
class _TrianglePainter extends CustomPainter {
  _TrianglePainter({
    @required this.color,
  });

  final Color color;

  @override
  bool hitTest(Offset point) => true; // Hitting the rectangle is fine enough.

  @override
  bool shouldRepaint(_TrianglePainter oldPainter) {
    return oldPainter.color != color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final base = size.width;
    final halfBase = size.width / 2.0;
    final height = size.height;
    final points = <Offset>[
      Offset(0, height),
      Offset(base, height),
      Offset(halfBase, 0),
    ];

    canvas.drawPath(
      Path()..addPolygon(points, true),
      Paint()..color = color,
    );
  }
}
