// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `welcome`
  String get welcome {
    return Intl.message(
      'welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Hello, nice to meet you!`
  String get welcome_nice_to_meet_you {
    return Intl.message(
      'Hello, nice to meet you!',
      name: 'welcome_nice_to_meet_you',
      desc: '',
      args: [],
    );
  }

  /// `Get a new experience`
  String get welcome_get_a_new_exprience {
    return Intl.message(
      'Get a new experience',
      name: 'welcome_get_a_new_exprience',
      desc: '',
      args: [],
    );
  }

  /// `Or Create My Account`
  String get welcome_or_create_my_account {
    return Intl.message(
      'Or Create My Account',
      name: 'welcome_or_create_my_account',
      desc: '',
      args: [],
    );
  }

  /// `Login with Phone`
  String get welcome_login_with_phone {
    return Intl.message(
      'Login with Phone',
      name: 'welcome_login_with_phone',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!`
  String get sign_in_welcome_back {
    return Intl.message(
      'Welcome back!',
      name: 'sign_in_welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get sign_in_phone_number {
    return Intl.message(
      'Phone number',
      name: 'sign_in_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get sign_in_password {
    return Intl.message(
      'Password',
      name: 'sign_in_password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get sign_in_fotgot_password {
    return Intl.message(
      'Forgot password?',
      name: 'sign_in_fotgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Or Create My Account`
  String get sign_in_or_create_my_account {
    return Intl.message(
      'Or Create My Account',
      name: 'sign_in_or_create_my_account',
      desc: '',
      args: [],
    );
  }

  /// `Hello, nice to meet you`
  String get sign_up_nice_to_meet_you {
    return Intl.message(
      'Hello, nice to meet you',
      name: 'sign_up_nice_to_meet_you',
      desc: '',
      args: [],
    );
  }

  /// `Join our Company!`
  String get sign_up_join_our_company {
    return Intl.message(
      'Join our Company!',
      name: 'sign_up_join_our_company',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get sign_up_enter_your_phone_number {
    return Intl.message(
      'Enter your phone number',
      name: 'sign_up_enter_your_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to our`
  String get sign_up_by_creating_an_account {
    return Intl.message(
      'By creating an account, you agree to our',
      name: 'sign_up_by_creating_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get sign_up_terms_of_service {
    return Intl.message(
      'Terms of Service',
      name: 'sign_up_terms_of_service',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get sign_up_and {
    return Intl.message(
      'and',
      name: 'sign_up_and',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get sign_up_privacy_policy {
    return Intl.message(
      'Privacy policy',
      name: 'sign_up_privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get sign_up_continue {
    return Intl.message(
      'Continue',
      name: 'sign_up_continue',
      desc: '',
      args: [],
    );
  }

  /// `Phone Veritilication`
  String get sign_up_otp_phone_verilication {
    return Intl.message(
      'Phone Veritilication',
      name: 'sign_up_otp_phone_verilication',
      desc: '',
      args: [],
    );
  }

  /// `Enter your OTP code`
  String get sign_up_otp_enter_your_otp_code {
    return Intl.message(
      'Enter your OTP code',
      name: 'sign_up_otp_enter_your_otp_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 4-digit code sent to you at {phoneNumber}.`
  String sign_up_otp_enter_the_4_digit_code_sent_to_you_at(Object phoneNumber) {
    return Intl.message(
      'Enter the 4-digit code sent to you at $phoneNumber.',
      name: 'sign_up_otp_enter_the_4_digit_code_sent_to_you_at',
      desc: '',
      args: [phoneNumber],
    );
  }

  /// ` did you enter the correct number?`
  String get sign_up_otp_did_you_enter_the_correct_number {
    return Intl.message(
      ' did you enter the correct number?',
      name: 'sign_up_otp_did_you_enter_the_correct_number',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code in `
  String get sign_up_otp_resend_code_in {
    return Intl.message(
      'Resend Code in ',
      name: 'sign_up_otp_resend_code_in',
      desc: '',
      args: [],
    );
  }

  /// `{number} seconds`
  String sign_up_otp_number_second(Object number) {
    return Intl.message(
      '$number seconds',
      name: 'sign_up_otp_number_second',
      desc: '',
      args: [number],
    );
  }

  /// `Free`
  String get sign_up_personal_free {
    return Intl.message(
      'Free',
      name: 'sign_up_personal_free',
      desc: '',
      args: [],
    );
  }

  /// `Business`
  String get sign_up_personal_business {
    return Intl.message(
      'Business',
      name: 'sign_up_personal_business',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get sign_up_personal_first_name {
    return Intl.message(
      'First name',
      name: 'sign_up_personal_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get sign_up_personal_last_name {
    return Intl.message(
      'Last name',
      name: 'sign_up_personal_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Home address`
  String get sign_up_personal_home_address {
    return Intl.message(
      'Home address',
      name: 'sign_up_personal_home_address',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get sign_up_personal_password {
    return Intl.message(
      'Password',
      name: 'sign_up_personal_password',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get sign_up_personal_create_account {
    return Intl.message(
      'Create Account',
      name: 'sign_up_personal_create_account',
      desc: '',
      args: [],
    );
  }

  /// `MONTH/YEAR`
  String get sign_up_bank_card_month_year {
    return Intl.message(
      'MONTH/YEAR',
      name: 'sign_up_bank_card_month_year',
      desc: '',
      args: [],
    );
  }

  /// `CARD OWNER`
  String get sign_up_bank_card_card_owner {
    return Intl.message(
      'CARD OWNER',
      name: 'sign_up_bank_card_card_owner',
      desc: '',
      args: [],
    );
  }

  /// `CVC2/CVV2`
  String get sign_up_bank_card_cvc_cvv {
    return Intl.message(
      'CVC2/CVV2',
      name: 'sign_up_bank_card_cvc_cvv',
      desc: '',
      args: [],
    );
  }

  /// `By continuing, I confirm that I have read & agree to the`
  String get sign_up_bank_card_by_continue_i_comfirm {
    return Intl.message(
      'By continuing, I confirm that I have read & agree to the',
      name: 'sign_up_bank_card_by_continue_i_comfirm',
      desc: '',
      args: [],
    );
  }

  /// `Term of Service`
  String get sign_up_bank_card_term_of_service {
    return Intl.message(
      'Term of Service',
      name: 'sign_up_bank_card_term_of_service',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get sign_up_bank_card_and {
    return Intl.message(
      'and',
      name: 'sign_up_bank_card_and',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get sign_up_bank_card_privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'sign_up_bank_card_privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Scan Credit Card`
  String get sign_up_bank_card_scan_credit_card {
    return Intl.message(
      'Scan Credit Card',
      name: 'sign_up_bank_card_scan_credit_card',
      desc: '',
      args: [],
    );
  }

  /// `By continuing, I confirm that I have read & agree to the`
  String get sign_up_documents_by_continue_i_comfirm {
    return Intl.message(
      'By continuing, I confirm that I have read & agree to the',
      name: 'sign_up_documents_by_continue_i_comfirm',
      desc: '',
      args: [],
    );
  }

  /// `Term of Service`
  String get sign_up_documents_term_of_service {
    return Intl.message(
      'Term of Service',
      name: 'sign_up_documents_term_of_service',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get sign_up_documents_and {
    return Intl.message(
      'and',
      name: 'sign_up_documents_and',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get sign_up_documents_privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'sign_up_documents_privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get sign_up_documents_create_account {
    return Intl.message(
      'Create Account',
      name: 'sign_up_documents_create_account',
      desc: '',
      args: [],
    );
  }

  /// `Thank you`
  String get sign_up_thanks_thank_you {
    return Intl.message(
      'Thank you',
      name: 'sign_up_thanks_thank_you',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for registering with Company`
  String get sign_up_thank_you_for_registering_with_company {
    return Intl.message(
      'Thank you for registering with Company',
      name: 'sign_up_thank_you_for_registering_with_company',
      desc: '',
      args: [],
    );
  }

  /// `Please complete your registration and be activated by visiting our office.`
  String get sign_up_thanks_please_complete_your_registration {
    return Intl.message(
      'Please complete your registration and be activated by visiting our office.',
      name: 'sign_up_thanks_please_complete_your_registration',
      desc: '',
      args: [],
    );
  }

  /// `Go to Profile`
  String get sign_up_thanks_go_to_profile {
    return Intl.message(
      'Go to Profile',
      name: 'sign_up_thanks_go_to_profile',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}