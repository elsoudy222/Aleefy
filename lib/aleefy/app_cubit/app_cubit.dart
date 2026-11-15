import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// الحالة هنا هي اللغة نفسها، و null معناها "لغة النظام"
class AppCubit extends Cubit<Locale?> {
  AppCubit() : super(null);

  // بتقرأ اللغة المحفوظة أول ما التطبيق يفتح
  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString('locale_code');
    if (code == null) return;
    emit(Locale(code));
  }

  // بتغيّر اللغة وبتحفظها، وبعدين بتنبه الواجهة بالتغيير
  Future<void> changeLocale(Locale? locale) async {
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.remove('locale_code');
    } else {
      await prefs.setString('locale_code', locale.languageCode);
    }
    emit(locale);
  }
}
