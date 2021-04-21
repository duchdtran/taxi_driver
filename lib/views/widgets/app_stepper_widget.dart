import 'package:flutter/material.dart';
import '../resources/style.dart';

import 'stepper.dart';

class AppStepperWidget extends StatefulWidget {
  @override
  _AppStepperWidgetState createState() => _AppStepperWidgetState();
}

class _AppStepperWidgetState extends State<AppStepperWidget> {
  int _currentStep = 4;

  @override
  Widget build(BuildContext context) {
    return CustomStepper(
      styleTitle: AppStyles.stylePoppinsLight12,
      styleContent: AppStyles.stylePoppinsBold16,
      currentStep: _currentStep,
      onStepTapped: (step) => setState(() => _currentStep = step),
      steps: <CustomStep>[
        CustomStep(
          title: const Text('Birth Certificate'),
          content: const Text('Vehicle Registration'),
          isActive: _currentStep >= 0,
          state:  _getStepState(0),
        ),
        CustomStep(
          title: const Text('Driving Licence'),
          content: const Text('A driving license is an offi…'),
          isActive: _currentStep >= 0,
          state:  _getStepState(1),
        ),
        CustomStep(
          title: const Text('Passport'),
          content: const Text('A passport is a travel do…'),
          isActive: _currentStep >= 0,
          state:  _getStepState(2),
        ),
        CustomStep(
          title: const Text('Election Card'),
          content: const Text('Incorrect document type'),
          isActive: _currentStep >= 0,
          state:  _getStepState(3),
        ),
        CustomStep(
          title: const Text('Insurance policy'),
          content: const Text('A driving license is an offi…'),
          isActive: _currentStep >= 0,
          state: _getStepState(4),
        ),
      ],
    );
  }

  CustomStepState _getStepState(int _index) {
    if (_currentStep > _index) {
      return CustomStepState.complete;
    } else if (_currentStep == _index) {
      return CustomStepState.editing;
    }
    return CustomStepState.disabled;
  }
}
