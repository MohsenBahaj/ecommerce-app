import 'package:get/get_navigation/get_navigation.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // Arabic Translations
        "ar": {
          // General
          "1": "اختر اللغه",
          "2": "عربي",
          "3": "انجليزي",
          "skip": "تخطي",
          "welcome_text": "مرحبا بعودتك",
          "or_text": "أو",
          "submit_button": "إرسال",
          "alert_title": "تأكيد الخروج",
          "alert_description": "هل أنت متأكد أنك تريد الخروج من التطبيق؟",
          "alert_confirmButton": "تأكيد",
          "alert_cancelButton": "إلغاء",

          // Onboarding Page
          "onboarding.choose_product_title": "اختر المنتج",
          "onboarding.choose_product_body":
              "لدينا أكثر من 100 ألف منتج. اختر\nمنتجك من متجرنا الإلكتروني.",
          "onboarding.easy_payment_title": "دفع سهل وآمن",
          "onboarding.easy_payment_body":
              "عملية الدفع سهلة وآمنة.\nموثوقة من عملائنا\nفي جميع أنحاء العالم.",
          "onboarding.fast_delivery_title": "تتبع طلبك",
          "onboarding.fast_delivery_body":
              "يمكنك تتبع طلبك في كل\nمرحلة. يمكنك أيضًا مراقبة التوصيل\nعلى الخريطة لتحديثات\nفورية.",
          "onboarding.button_text": "استمر",

          // Login Page
          "login_page_title": "تسجيل الدخول",
          "login_instruction":
              "قم بتسجيل الدخول باستخدام بريدك الإلكتروني وكلمة المرور أو وسائل التواصل الاجتماعي",
          "email_label": "البريد الإلكتروني",
          "email_hint": "أدخل بريدك الإلكتروني",
          "password_label": "كلمة المرور",
          "password_hint": "أدخل كلمة المرور الخاصة بك",
          "sign_in_button": "تسجيل الدخول",
          "social_media_text": "سجل باستخدام وسائل التواصل الاجتماعي",
          "google_sign_in_text": "سجل الدخول باستخدام حساب جوجل",
          'dont_have_account': " ليس لديك حساب؟",
          'sign_up': 'إنشاء حساب',
          'sign_up_button': 'إنشاء حساب',
          'forget_password': 'نسيت كلمة المرور',
          "remember_me": "تذكرني",
          "sign_up_with": "سجل باستخدام",

          // Sign-Up Page
          "i_agree_to": "أوافق على ", // Arabic
          "privacy_policy": "سياسة الخصوصية ", // Arabic
          "terms_of_use": "شروط الاستخدام ", // Arabic
          "and": "و ", // Arabic
          "first_name": "الاسم الأول", // Arabic
          "resend_email": "إعادة إرسال البريد الإلكتروني", // Arabic

          "last_name": "الاسم الأخير", // Arabic

          'signup_instruction':
              "قم بالتسجيل باستخدام بريدك الإلكتروني وكلمة المرور أو وسائل التواصل الاجتماعي أو حساب جوجل",
          'already_have_account': ' هل لديك حساب بالفعل؟',
          'username': 'اسم المستخدم',
          'phone_number': 'رقم الهاتف',
          'enter_username': 'أدخل اسم المستخدم',
          'enter_phone_number': 'أدخل رقم الهاتف',

          // Forget Password Page
          'forget_password_instruction':
              "أدخل بريدك الإلكتروني لتلقي رابط إعادة تعيين كلمة المرور.",
          'forget_password_title': "نسيت كلمة المرور",
          'check_email_button': "تحقق من البريد الإلكتروني",
          "password_reset_instruction":
              "تم إرسال بريد إلكتروني إلى عنوانك. يرجى الذهاب إلى بريدك الإلكتروني لتغيير كلمة المرور من خلال الرابط المرفق.", // Arabic
          // Verification Page
          'verification_instruction': "يرجى التحقق من رمز التحقق المرسل إلى: ",
          'verify_button': "تحقق",
          'verification_title': "تحقق من حسابك",
          'check_code': "تحقق من الرمز",

          // Reset Password Page
          'reset_password_title': "إعادة تعيين كلمة المرور",
          'reset_password_subtitle': "أدخل كلمة المرور الجديدة أدناه.",
          'reset_password_instruction':
              "يجب أن تكون كلمة المرور الجديدة مكونة من 5 أحرف.",
          'reset_button': "إعادة تعيين كلمة المرور",
          're_password_hint': "أعد إدخال كلمة المرور",
          're_password_label': "تأكيد كلمة المرور",

          // OTP Page
          'check_email_title': "تحقق من بريدك الإلكتروني",
          'check_email_subtitle':
              "لقد أرسلنا لك رمز التحقق لتأكيد عنوان بريدك الإلكتروني.",
          'check_email_instruction':
              "أدخل رمز التحقق المرسل إلى بريدك الإلكتروني.",
          'otp_field_label': "رمز التحقق",
          'otp_field_hint': "أدخل رمز التحقق",

          // Success Pages
          'verification_success_title': "تم التحقق بنجاح",
          'verification_success_subtitle':
              "تم التحقق من بريدك الإلكتروني بنجاح.",
          'reset_success_title': "تم إعادة تعيين كلمة المرور بنجاح",
          'reset_success_message':
              "تم إعادة تعيين كلمة المرور الخاصة بك بنجاح. يمكنك الآن تسجيل الدخول باستخدام كلمة المرور الجديدة.",
          'signup_success_title': "تهانينا!",
          'signup_success_message':
              "لقد قمت بالتسجيل بنجاح.\nالآن، يمكنك المتابعة لتسجيل الدخول.",
          'go_to_login': "اذهب إلى تسجيل الدخول",

          // Validation Errors
          'validation.username_invalid': 'اسم المستخدم غير صالح',
          'validation.email_invalid': 'البريد الإلكتروني غير صالح',
          'validation.value_too_large': "القيمة لا يمكن أن تكون أكبر من",
          'validation.value_too_small': "القيمة لا يمكن أن تكون أقل من",
          'validation.field_empty': 'هذا الحقل لا يمكن أن يكون فارغًا',
          'validation.phone_invalid': 'رقم الهاتف غير صالح',
        },

        // English Translations
        "en": {
          // General
          "1": "Choose Your Language",
          "2": "Arabic",
          "3": "English",
          "skip": "Skip",
          "welcome_text": "Welcome Back!",
          "or_text": "Or",
          "submit_button": "Submit",
          "alert_title": "Exit Confirmation",
          "alert_description": "Are you sure you want to exit the app?",
          "alert_confirmButton": "Confirm",
          "alert_cancelButton": "Cancel",

          // Onboarding Page
          "onboarding.choose_product_title": "Choose Product",
          "onboarding.choose_product_body":
              "We Have a 100k+ Products. Choose\nYour Product From Our\nE-commerce shop.",
          "onboarding.easy_payment_title": "Easy & Safe Payment",
          "onboarding.easy_payment_body":
              "Easy Checkout & Safe Payment\nmethod. Trusted by our Customers\nfrom all over the world.",
          "onboarding.fast_delivery_title": "Track Your Delivery",
          "onboarding.fast_delivery_body":
              "You can track your delivery. at\neach step. Also, you can monitor the\ndelivery on the map for real-time\n updates",
          "onboarding.button_text": "Continue",

          // Login Page
          "login_page_title": "Sign In",
          "login_instruction":
              "Sign in with your email and password or social media or Google account",
          "email_label": "Email",
          "email_hint": "Enter your email",
          "password_label": "Password",
          "password_hint": "Enter your password",
          "sign_in_button": "Sign In",
          "social_media_text": "Sign in using social media",
          "google_sign_in_text": "Sign in with Google Account",
          'dont_have_account': "Don't have an account? ",
          'sign_up': 'Let\'s Create Your Account',
          'sign_up_button': 'Create Account',

          'forget_password': 'Forget Password',
          "remember_me": "Remember Me",
          "sign_up_with": "Sign Up with",

          // Sign-Up Page
          "resend_email": "Resend Email", // English
          "i_agree_to": "I agree to ", // English

          "privacy_policy": "Privacy Policy", // English

          "terms_of_use": "Terms of Use", // English

          "and": " and ", // English
          "first_name": "First Name", // English
          "last_name": "Last Name",
          'signup_instruction':
              "Sign up with your email and password or social media or Google account",
          'already_have_account': 'Already have an account? ',
          'username': 'Username',
          'phone_number': 'Phone Number',
          'enter_username': 'Enter Username',
          'enter_phone_number': 'Enter Phone Number',

          // Forget Password Page
          'forget_password_instruction':
              "Enter your email to receive a password reset link.",
          'forget_password_title': "Forget Password",
          'check_email_button': "Check Email",
          "password_reset_instruction":
              "An email has been sent to your address. Please check your email and change your password through the provided link.", // English

          // Verification Page
          'verification_instruction': "Please verify the OTP sent to: ",
          'verify_button': "Verify",
          'verification_title': "Verify Your Account",
          'check_code': "Check Code",

          // Reset Password Page
          'reset_password_title': "Reset Password",
          'reset_password_subtitle': "Enter your new password below.",
          'reset_password_instruction':
              "Your new password must be at least 5 digits.",
          'reset_button': "Reset Password",
          're_password_hint': "Re-enter your password",
          're_password_label': "Confirm Password",

          // OTP Page
          'check_email_title': "Check Your Email",
          'check_email_subtitle':
              "We’ve sent you an OTP to verify your email address.",
          'check_email_instruction':
              "Enter the OTP from the email we sent to your inbox.",
          'otp_field_label': "OTP",
          'otp_field_hint': "Enter the OTP",

          // Success Pages
          'verification_success_title': "Verification Successful",
          'verification_success_subtitle':
              "Your email has been successfully verified.",
          'reset_success_title': "Password Reset Successful",
          'reset_success_message':
              "Your password has been successfully reset. You can now log in with your new password.",
          'signup_success_title': "Congratulations!",
          'signup_success_message':
              "You have successfully signed up.\nNow, you can proceed to log in.",
          'go_to_login': "Go to Login",

          // Validation Errors
          'validation.username_invalid': 'Username is not valid',
          'validation.email_invalid': 'Email is not valid',
          'validation.value_too_large': "Value can't be greater than",
          'validation.value_too_small': "Value can't be less than",
          'validation.field_empty': 'This field cannot be empty',
          'validation.phone_invalid': 'Phone number is not valid',
        }
      };
}
