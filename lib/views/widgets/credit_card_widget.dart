import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/credit_card_number_input_formatter.dart';

import '../resources/color.dart';
import '../resources/images.dart';
import '../resources/style.dart';

class CreditCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 27, right: 35),
      decoration: BoxDecoration(
        color: AppColors.colorNightRider,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            offset: const Offset(0, 5),
            color: AppColors.colorNightRider.withOpacity(0.1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 19),
          _buildImageCard(context),
          const SizedBox(height: 15),
          _buildCardNumber(context),
          const SizedBox(height: 19),
          Table(
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
              2: IntrinsicColumnWidth(),
            },
            children: <TableRow>[
              TableRow(children: <Widget>[
                _buildTitle(context, label: 'MONTH/YEAR'),
                const SizedBox(),
                _buildTitle(context, label: 'CVC2/CVV2'),
              ]),
              TableRow(children: <Widget>[
                _buildDateCardCreated(context),
                const SizedBox(),
                _buildCvcCvv(context),
              ]),
            ],
          ),
          const SizedBox(height: 16),
          _buildCardOwner(context),
          const SizedBox(height: 18),
        ],
      ),
    );
  }

  Widget _buildImageCard(BuildContext context) {
    return Image.asset(
      AppImages.icMasterCard,
      width: 31,
      height: 19,
    );
  }

  Widget _buildCardNumber(BuildContext context) {
    return _CardFormField(
      hintText: 'XXXX XXXX XXXX XXXX',
      inputFormatters: [CreditCardNumberInputFormatter()],
      keyboardType: TextInputType.number,
      textStyle: AppStyles.stylePoppinsBoldWhite22,
    );
  }

  Widget _buildTitle(BuildContext context, {@required String label}) {
    return Text(
      label,
      style: AppStyles.stylePoppinsRegularwhite9,
    );
  }

  Widget _buildDateCardCreated(BuildContext context) {
    return _CardFormField(
      hintText: 'XX/XX',
      keyboardType: TextInputType.number,
      textStyle:
          AppStyles.stylePoppinsMedium13.copyWith(color: AppColors.colorWhite),
    );
  }

  Widget _buildCvcCvv(BuildContext context) {
    return _CardFormField(
      hintText: 'XXX',
      keyboardType: TextInputType.number,
      textStyle: AppStyles.stylePoppinsMedium13.copyWith(
        color: AppColors.colorWhite,
      ),
    );
  }

  Widget _buildCardOwner(BuildContext context) {
    return _CardFormField(
      hintText: 'CARD OWNER',
      textCapitalization: TextCapitalization.characters,
      textStyle: AppStyles.stylePoppinsMedium13.copyWith(
        color: AppColors.colorWhite,
      ),
    );
  }
}

class _CardFormField extends StatelessWidget {
  const _CardFormField({
    Key key,
    this.hintText,
    this.inputFormatters,
    this.keyboardType,
    this.textStyle,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);
  final String hintText;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final TextStyle textStyle;
  final TextCapitalization textCapitalization;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.colorWhite,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: true,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        hintText: hintText,
        hintStyle: textStyle,
      ),
      style: textStyle,
    );
  }
}
