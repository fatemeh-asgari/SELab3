# تبدیل نیاز‌مندی‌ها به موارد آزمون با استفاده از روش ایجاد مبتنی بر رفتار (BDD)
## مسئله‌ی اول
### جمع دو عدد
ابتدا مطابق با مستند ارائه شده برای مسئله‌ی اول، یک پروژه می‌سازیم و dependencyهای مورد نیاز را به فایل pom.xml آن اضافه می‌کنیم. سپس از منوی maven تست را اجرا می‌کنیم و
این کار با موفقیت انجام می‌شود و در نهایت می‌توان پیغام BUILD SUCCESS را مشاهده کرد:

<img width="1440" alt="Screenshot 1402-05-13 at 12 29 43" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/b003ad0d-7616-4a73-9fe3-7fb06fe3cbaa">

پس از آن در پکیج test پروژه یک پکیج به نام resources می‌سازیم و آن را به عنوان test resources root انتخاب می‌کنیم:
<img width="1440" alt="Screenshot 1402-05-13 at 12 33 27" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/72a1fea3-8dcf-4fb4-9f80-f1a9c0249b74">

سپس فایل caculator.feature را در دایرکتوری feature می‌سازیم و سناریوی جمع آن دو عدد را به آن اضافه می‌کنیم:

<img width="1440" alt="Screenshot 1402-05-13 at 12 38 00" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/d31e9f61-b093-47e2-be36-5ed196fd6ee1">

همانطور که دیده می‌شود در زیر این نوشته‌ها خطوط زردرنگ کشیده شده است چراکه به زبان Gerkin است و باید مشخص کنیم این خطوط چگونه باید تفسیر شوند.
به همین خاطر یک فایل جهت تعیین مراحل و stepهای اجرای سناریو باید ایجاد شود.
این کار با ایجاد کردن یک دایرکتوری به نام calculator در مسیر test/java و سپس ساختن فایل MyStepDefs.java در این مسیر انجام می‌شود. 
ابتدا متدها به شکل بدون بدنه در فایل MyStepDefs نوشته می‌شوند و سپس بدنه‌ی متدها نوشته می‌شود:

<img width="1440" alt="Screenshot 1402-05-13 at 12 45 00" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/89868fb6-ca50-428f-a595-eaf6a5e2f8fa">

این فایل پس از ذخیره شدن به اررور می‌خورد چرا که هنوز Calculator نوشته نشده است.
بنابراین در این مرحله داخل دایرکتوری calculator یک کلاس جاوای Calculator می‌نویسیم که دارای متد add است:

<img width="1440" alt="Screenshot 1402-05-13 at 12 46 28" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/167e62a0-ec1a-4acf-ab80-6a9576898589">

در این مرحله دوباره گزینه‌ی Maven test را می‌زنیم و سپس روی فایل calculator.feature کلیک راست می‌کنیم و گزینه‌ی Run را می‌زنیم تا اجرا شود.
نتیجه همانطور که در شکل زیر دیده می‌شود موفقیت‌آمیز است و نشان می‌دهد یک سناریو با موفقیت گذرانده شده است:

<img width="1440" alt="Screenshot 1402-05-13 at 12 51 41" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/f0637b6d-a958-4df9-8820-b72aff6a09c0">
<img width="1431" alt="Screenshot 1402-05-13 at 12 52 23" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/a0f08618-4495-4706-8e1e-a06663efecb4">

برای مشاهده‌ی جزئیات از طریق Junit، ابتدا یک کلاس RunnerTest در مسیر test/java/calculator می‌سازیم و بدنه‌ی آن را به این شکل پر می‌کنیم که بالای سر امضای متد عبارت زیر را قرار می‌دهیم:
```Java
@RunWith(Cucumber.class)
```

با اجرای این فایل به یک خطا برمی‌خوریم چرا که این فایل نمی‌تواند فایل feature را پیدا کند:

<img width="1434" alt="Screenshot 1402-05-13 at 12 58 10" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/ee9f1460-2e11-48ac-9faa-c68f11900b37">

به همین دلیل مسیر در فایل را در ابتدای RunnerTest مشخص می‌کنیم:

<img width="1067" alt="Screenshot 1402-05-13 at 13 00 23" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/b7a95bab-2185-43a9-996e-cdf4c2d7a928">

با اجرای مجدد RunnerTest تست‌ها با موفقیت پاس می‌شوند.
به طور مثال اگر الان به جای result برابر 3 عدد 3000 را قرار دهیم با خطا در اجرای تست مواجه خواهیم شد:

<img width="1440" alt="Screenshot 1402-05-13 at 13 08 18" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/6e97d6f4-76d7-455b-90e3-c71e205c02d1">

در گام بعد باید نوع دیگری از سناریو یعنی scenario outline را اضافه کنیم که آن را در ادامه‌ی فایل feature به شکل زیر می‌نویسیم:

<img width="1070" alt="Screenshot 1402-05-13 at 13 09 42" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/9ff359ee-39cc-4873-8d16-b0cd4bf48fde">

