const List<SettingTile> settingsTiles = [
  SettingTile(
    isCheckbox: true,
    title: "ابي المنبه يشتغل",
    setting: Setting.switchAlarm,
  ),
  SettingTile(
    isCheckbox: false,
    title: "تعديل وقت المنبه",
    setting: Setting.editVariation,
  ),
  SettingTile(
    isCheckbox: false,
    title: "تغيير الموقع",
    setting: Setting.changeLocation,
  ),
  // SettingTile(
  //   isCheckbox: false,
  //   title: "تغيير الصوت",
  //   setting: Setting.changeSound,
  // ),
];

enum Setting {
  switchAlarm,
  editVariation,
  changeLocation,
  changeSound,
}

class SettingTile {
  final bool isCheckbox;
  final String title;
  final Setting setting;
  const SettingTile({
    required this.isCheckbox,
    required this.title,
    required this.setting,
  });
}
