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
این کار با ایجاد کردن یک دایرکتوری به نام calculator در مسیر test/java و سپس ساختن فایل MyStepdefs.java در این مسیر انجام می‌شود. 
ابتدا متدها به شکل بدون بدنه در فایل MyStepdefs نوشته می‌شوند و سپس بدنه‌ی متدها نوشته می‌شود:

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

با اجرای دوباره‌ی RunnerTest می‌بینیم که مثال دوم از سناریوی دوم یعنی scenario outline به مشکل undefined می‌خورد:

<img width="1440" alt="Screenshot 1402-05-13 at 13 31 47" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/ef4d1f6f-0f29-4042-a831-21e61630c52a">

این امر به این خاطر است که در این مثال سعی شده است یک عدد منفی با یک عدد مثبت جمع شود اما در تعریفی که در فایل MyStepdefs برای عمل جمع شده است، رجکس اعداد به گونه‌ای نوشته شده است که تنها اعداد مثبت را می‌تواند بشناسد. یعنی رجکس به شکل \\\d+ است که تنها یک تا چند رقم 0 تا 9 را می‌تواند بشناسد. به همین خاطر وقتی در مثال دوم یک عدد منفی به عنوان value1 داده شده است شناخته نشده است:

<img width="997" alt="Screenshot 1402-05-13 at 13 34 46" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/a1b18291-399d-419a-a6a1-9c4237815e7d">

برای اصلاح این مشکل، رجکس را به گونه‌ای تغییر می‌دهیم که پذیرنده‌ی اعداد منفی هم باشد. این رجکس به این معنی است که ابتدا صفر یا یک عدد علامت منفی بیاید و پس از آن تعدادی رقم 0 تا 9 بیاید. در این صورت رجکس هم اعداد منفی را می‌شناسد هم مثبت را:

<img width="998" alt="Screenshot 1402-05-13 at 13 35 30" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/04545699-6289-4c56-a06d-cdf1fce9e0da">

حال دوباره RunnerTest را اجرا می‌کنیم و مشاهده می‌کنیم که تمامی تست‌ها بدون مشکل پاس می‌شوند:

<img width="1440" alt="Screenshot 1402-05-13 at 13 38 02" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/a8ee3084-1630-4f1c-9e2c-1395d16b4199">

## مسئله‌ی دوم
حال مشابه مسئله‌ی قبل، عملیات‌های ضرب و تقسیم و توان را هم برای ماشین‌حساب پیاده‌سازی می‌کنیم. توجه شود که در اینجا کدهای مربوط به مسئله‌ی قبلی یعنی جمع دو عدد کامنت شده است.
### ضرب دو عدد
برای پیاده‌سازی جمع دو عدد ابتدا سناریو‌های تست را در فایل calculator.feature می‌نویسیم. یک سناریوی ضرب دو عدد را می‌نویسیم و سپس به دلیل آنکه در ادامه قرار است عملیات‌های دیگر هم اضافه شود، سناریوی outlineمان را به شکلی می‌نویسیم که operation را هم بگیرد. هم‌چنین examples را هم می‌نویسیم:

<img width="1440" alt="Screenshot 1402-05-13 at 18 24 20" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/6cec3fff-1ad3-42d7-b633-f1153ddd28cc">

حال باید step definitionها را در فایل MyStepdefs بنویسیم که به شکل زیر خواهند بود:

<img width="1440" alt="Screenshot 1402-05-13 at 18 24 14" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/ccaed5e6-f4a8-4ec5-9674-6590a39e25da">

همانطور که دیده می‌شود، در این فایل خطا داریم چرا که متد multiply هنوز پیاده‌سازی نشده است. اگر RunnerTest را اجرا کنیم با خطا مواجه خواهیم شد:

<img width="1403" alt="Screenshot 1402-05-13 at 18 24 45" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/c021694c-9fd0-4bb2-bfb9-6a86e4678879">

در این مرحله متد multiply را در کلاس Calculator پیاده‌سازی می‌کنیم:

<img width="1100" alt="Screenshot 1402-05-13 at 18 25 34" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/2ac9ddd5-f4f7-44c1-91cb-c09fc8682e6c">

حال اگر RunnerTest را اجرا کنیم مشاهده می‌کنیم که همه‌ی سناریوی تست‌ها با موفقیت پاس می‌شوند:

<img width="1440" alt="Screenshot 1402-05-13 at 18 25 58" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/19401870-ff72-44cf-ab7c-96a4b9641b44">

### تقسیم دو عدد
برای پیاده‌سازی عملیات تقسیم در این پروژه به این شکل عمل کرده‌ایم که حاصل تقسیم دو عدد همواره برابر عددی صحیح است و در صورتی که در عدد بر یکدیگر بخش‌پذیر نباشند، کف حاصل تقسیم به عنوان نتیجه بازگردانده می‌شود.
ابتدا در فایل calculator.feature سناریویی برای تقسیم می‌نویسیم و یک سناریو هم برای حالتی می‌نویسیم که یک عدد بر صفر تقسیم می‌شود. سناریوی outline تغییر نمی‌کند و تنها examples آپدیت می‌شود:

<img width="967" alt="Screenshot 1402-05-13 at 19 46 33" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/ddb43e7e-d231-4753-8527-0350899bc748">

حال step definitionها را هم تعریف می‌کنیم:

<img width="944" alt="Screenshot 1402-05-13 at 19 46 46" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/d3e51c93-df06-4f56-8087-0cd873e05776">

با اجرای RunnerTest با خطا مواجه می‌شویم چراکه متد divide هنوز پیاده‌سازی نشده است:

<img width="1327" alt="Screenshot 1402-05-13 at 19 47 20" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/f8614de4-35c9-41c5-b4e0-569d50204c27">

حال متد divide را در کلاس Calculator پیاده‌سازی می‌کنیم:

<img width="935" alt="Screenshot 1402-05-13 at 19 49 43" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/2a20b9d7-82d2-4c2c-abee-80458af6059d">

در این مرحله دوباره RunnerTest را اجرا می‌کنیم و مشاهده می‌کنیم که تمامی تست‌ها با موفقیت پاس می‌شوند:

<img width="1360" alt="Screenshot 1402-05-13 at 19 50 25" src="https://github.com/fatemeh-asgari/SELab3/assets/59364998/cedec52b-d8f5-41ad-bfb9-30bf34f071d7">

### توان
برای پیاده‌سازی عملیات توان در این پروژه اینگونه در نظر گرفته‌‌ایم که اعداد صحیح را تنها می‌توان به توان اعداد مثبت رساند و در صورتی که توان عدد منفی باشد یا اینکه پایه و توان هر دو برابر صفر باشد exception ایجاد خواهد شد. هم‌چنین حاصل هر عددی به توان صفر برابر یک است. سناریوها به شکل زیر است و برای توان منفی یک حالت سناریوی جداگانه تعریف می‌شود:
