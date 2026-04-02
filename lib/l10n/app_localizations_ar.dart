// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'تتبع المالية';

  @override
  String get welcomeBack => 'أهلاً بعودتك';

  @override
  String get startTrackingToday => 'ابدأ التتبع اليوم';

  @override
  String get takeControlOfFinances => 'تحكم في أموالك.';

  @override
  String get signUp => 'التسجيل';

  @override
  String get continueWith => 'أو متابعة مع';

  @override
  String get forgotPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get forgotPasswordDescription =>
      'لا تقلق، يحدث هذا. يرجى إدخال عنوان البريد الإلكتروني المرتبط بحسابك.';

  @override
  String get resetLinkSent =>
      'تم إرسال رابط إعادة التعيين! يرجى التحقق من بريدك الإلكتروني.';

  @override
  String get totalBalance => 'الرصيد الإجمالي';

  @override
  String get totalSpentThisWeek => 'إجمالي الإنفاق هذا الأسبوع';

  @override
  String vsLastMonth(Object percentage) {
    return '$percentage% مقارنة بالشهر الماضي';
  }

  @override
  String get somethingWentWrong => 'حدث خطأ ما. يرجى المحاولة مرة أخرى.';

  @override
  String get recentTransactions => 'المعاملات الأخيرة';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get addAccount => 'إضافة حساب';

  @override
  String get accountType => 'نوع الحساب';

  @override
  String get accountName => 'اسم الحساب';

  @override
  String get accountBalance => 'رصيد الحساب';

  @override
  String get includeInNetWorth => 'شمول في القيمة الصافية';

  @override
  String get selectAccount => 'اختر حسابًا';

  @override
  String get addTransaction => 'إضافة معاملة';

  @override
  String get amount => 'المبلغ';

  @override
  String get category => 'الفئة';

  @override
  String get note => 'ملاحظة';

  @override
  String get date => 'التاريخ';

  @override
  String get expense => 'نفقة';

  @override
  String get income => 'الدخل';

  @override
  String get addBudget => 'إضافة ميزانية';

  @override
  String get budgetName => 'اسم الميزانية';

  @override
  String get budgetNameHint => 'مثل البقالة الشهرية';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get settings => 'الإعدادات';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get language => 'اللغة';

  @override
  String get english => 'الإنجليزية';

  @override
  String get arabic => 'العربية';

  @override
  String get theme => 'المظهر';

  @override
  String get light => 'فاتح';

  @override
  String get dark => 'داكن';

  @override
  String get currency => 'العملة';

  @override
  String get password => 'كلمة المرور';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get emailHint => 'john@example.com';

  @override
  String get passwordHint => '••••••••';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get fullNameHint => 'جون دو';

  @override
  String get save => 'حفظ';

  @override
  String get cancel => 'إلغاء';

  @override
  String get delete => 'حذف';

  @override
  String get edit => 'تعديل';

  @override
  String get back => 'رجوع';

  @override
  String get next => 'التالي';

  @override
  String get skip => 'تخطي';

  @override
  String get done => 'تم';

  @override
  String get loading => 'جاري التحميل...';

  @override
  String get errorEmailRequired => 'البريد الإلكتروني مطلوب!';

  @override
  String get errorInvalidEmail => 'عنوان بريد إلكتروني غير صحيح!';

  @override
  String get errorPasswordRequired => 'كلمة المرور مطلوبة!';

  @override
  String get errorPasswordTooShort =>
      'يجب أن تكون كلمة المرور بطول 6 أحرف على الأقل!';

  @override
  String get errorConfirmPasswordRequired => 'يرجى تأكيد كلمة المرور!';

  @override
  String get errorPasswordMismatch => 'كلمات المرور غير متطابقة!';

  @override
  String get errorNameRequired => 'الاسم مطلوب!';

  @override
  String get debitCard => 'بطاقة الخصم';

  @override
  String get creditCard => 'بطاقة الائتمان';

  @override
  String get savingsAccount => 'حساب التوفير';

  @override
  String get checkingAccount => 'حساب جاري';

  @override
  String get investmentAccount => 'حساب الاستثمار';

  @override
  String get food => 'الطعام';

  @override
  String get shopping => 'التسوق';

  @override
  String get utilities => 'المرافق';

  @override
  String get entertainment => 'الترفيه';

  @override
  String get transportation => 'النقل';

  @override
  String get healthcare => 'الرعاية الصحية';

  @override
  String get education => 'التعليم';

  @override
  String get other => 'أخرى';

  @override
  String get monthly => 'شهري';

  @override
  String get weekly => 'أسبوعي';

  @override
  String get yearly => 'سنوي';

  @override
  String get recurrenceDuration => 'مدة التكرار';

  @override
  String get failedToAddTransaction => 'فشل في إضافة المعاملة';

  @override
  String get failedToCreateBudget => 'فشل في إنشاء الميزانية';

  @override
  String get failedToCreateAccount => 'فشل في إنشاء الحساب';

  @override
  String get continueWithGoogle => 'متابعة مع جوجل';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get categories => 'الفئات';

  @override
  String get getStarted => 'ابدأ الآن';

  @override
  String get chooseTheme => 'اختر المظهر';

  @override
  String get customizeAppearance =>
      'خصص مظهر متتبعك المالي اختر موضوعًا لمعاينة كيفية ظهور لوحة المعلومات والمعاملات.';

  @override
  String get appPreferences => 'تفضيلات التطبيق';

  @override
  String get allTransactions => 'جميع المعاملات';

  @override
  String get noTransactionsYet =>
      'لا توجد معاملات حتى الآن. ابدأ بإضافة معاملتك الأولى!';

  @override
  String get spending => 'نفقة';

  @override
  String get updatePasswordTitle => 'تحديث كلمة المرور';

  @override
  String get updatePasswordDescription => 'يرجى إدخال كلمة المرور الجديدة.';

  @override
  String get enterNewPassword => 'أدخل كلمة المرور الجديدة';

  @override
  String get sendResetLink => 'إرسال رابط إعادة التعيين';

  @override
  String get loginSubtitle =>
      'تتبع أموالك بأمان.\n يرجى تسجيل الدخول إلى حسابك.';

  @override
  String get noAccountFoundWithEmail => 'لا يوجد حساب بهذا البريد الإلكتروني';

  @override
  String get passwordIncorrect => 'كلمة المرور غير صحيحة';

  @override
  String get incorrectPassword => 'كلمة المرور خاطئة';

  @override
  String get home => 'الرئيسية';

  @override
  String get wallet => 'المحفظة';

  @override
  String get budgets => 'الميزانيات';

  @override
  String get cleanAndBright => 'نظيف ومشرق';

  @override
  String get easyOnEyes => 'مريح للعين';

  @override
  String get leftToSpend => 'المتبقي للإنفاق';

  @override
  String get totalSpent => 'إجمالي المصروف';

  @override
  String get remaining => 'متبقي';

  @override
  String get balanceAffectsTotalAssets => 'الرصيد يؤثر على إجمالي الأصول';

  @override
  String get noAccountsFoundAddFirst =>
      'لم يتم العثور على حسابات. يرجى إضافة حساب أولاً.\n';

  @override
  String get goToAccounts => 'الانتقال إلى الحسابات';

  @override
  String get accountNameHintPersonal => 'مثال: مدخراتي';

  @override
  String get errorAccountNameRequired => 'اسم الحساب مطلوب';

  @override
  String get errorAccountBalanceRequired => 'رصيد الحساب مطلوب';

  @override
  String get errorValidNumber => 'يرجى إدخال رقم صحيح';

  @override
  String get masterYourMoney => 'تحكم في أموالك';

  @override
  String get onboardingTitleFreedom => 'حرية مالية';

  @override
  String get onboardingSubtitleFreedom =>
      'تتبع مصروفاتك، وادخر أكثر، وحقق الحرية المالية.';

  @override
  String get onboardingTitleSmartCategorization => 'تصنيف ذكي';

  @override
  String get onboardingSubtitleSmartCategorization =>
      'تصنيف معاملاتك تلقائيًا لتتبع أسهل.';

  @override
  String get onboardingTitleBudgetMaster => 'اتقن ميزانيتك الشهرية';

  @override
  String get onboardingSubtitleBudgetMaster =>
      'ضع ميزانيتك الأولى وابدأ الادخار اليوم! تتبع كل مصروف وشاهد مدخراتك تنمو.';

  @override
  String get addBudgetPrompt => 'اضغط زر + بالأعلى لإضافة ميزانية.';

  @override
  String get addTransactionPrompt => 'اضغط زر + بالأسفل لإضافة معاملة.';

  @override
  String amountWithCurrency(Object currencyCode) {
    return 'المبلغ ($currencyCode)';
  }

  @override
  String get weeklyResetInfo =>
      'ستتم إعادة تعيين الميزانية تلقائيًا كل يوم اثنين من كل أسبوع.';

  @override
  String get monthlyResetInfo =>
      'ستتم إعادة تعيين الميزانية تلقائيًا في اليوم الأول من كل شهر.';

  @override
  String get yearlyResetInfo =>
      'ستتم إعادة تعيين الميزانية تلقائيًا في 1 يناير من كل عام.';

  @override
  String get mondayShort => 'الإثنين';

  @override
  String get tuesdayShort => 'الثلاثاء';

  @override
  String get wednesdayShort => 'الأربعاء';

  @override
  String get thursdayShort => 'الخميس';

  @override
  String get fridayShort => 'الجمعة';

  @override
  String get saturdayShort => 'السبت';

  @override
  String get sundayShort => 'الأحد';

  @override
  String get transport => 'المواصلات';

  @override
  String get bills => 'الفواتير';

  @override
  String get salary => 'الراتب';

  @override
  String get freelance => 'عمل حر';

  @override
  String get housing => 'السكن';

  @override
  String get health => 'الصحة';

  @override
  String get gifts => 'الهدايا';

  @override
  String get others => 'أخرى';

  @override
  String get cashWallet => 'محفظة نقدية';

  @override
  String get investment => 'استثمار';

  @override
  String get selectAccountToContinue => 'اختر حسابًا';

  @override
  String get unnamedBudget => 'ميزانية بدون اسم';
}
