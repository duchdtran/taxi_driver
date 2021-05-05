class AppImages {
  // bg
  static const bgWelcome = 'assets/images/bg/bg_welcome.png';
  static const bg = 'assets/images/bg/bg.png';

  // icons
  static const icAvatarNone = 'assets/images/icons/avatar_none.png';
  static const icCamera = 'assets/images/icons/camera.png';
  static const icView = 'assets/images/icons/view.png';
  static const icMasterCard = 'assets/images/icons/master_card.png';
  static const icArrawDown = 'assets/images/icons/arrow_down.png';

  static String getImgPath(String name,
      {String folder = '', String format = 'png', bool needDark = true}) {
    String finalImagePath;
    if (needDark) {
      finalImagePath = 'assets/images/${folder}_dark/$name.$format';
    } else {
      finalImagePath = 'assets/images/$folder/$name.$format';
    }
    return finalImagePath;
  }
}
