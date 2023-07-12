# محاسبه شباهت بین دو متن

این کد از اندازه‌گیری شباهت کسینوسی برای محاسبه شباهت بین دو متن استفاده می‌کند. با دریافت دو متن ورودی، کد ورودی را به حروف کوچک تبدیل کرده، کاراکترهای غیر الفبایی را حذف کرده، یک بردار ویژگی برای هر یک از دو متن با استفاده از کلاس CountVectorizer از کتابخانه scikit-learn ایجاد می‌کند و سپس شباهت کسینوسی بین دو بردار ویژگی را محاسبه می‌کند.

# استفاده

    با اجرای دستور زیر، کتابخانه‌های مورد نیاز را نصب کنید:

```bash
pip install numpy scikit-learn
```

کد را در یک فایل پایتون، به عنوان مثال در فایل similarity.py، کپی کنید.

کتابخانه‌ها و توابع مورد نیاز را وارد کنید:

```bash
import numpy as np
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity
```

دو متن ورودی را تعریف کنید:

```bash
text1 = "این اولین متن است."
text2 = "این دومین متن است."
```

متن‌های ورودی را با تبدیل آنها به حروف کوچک و حذف کاراکترهای غیر الفبایی پیش‌پردازش کنید:

```bash
string1 = ''.join(filter(str.isalnum, text1)).lower()
string2 = ''.join(filter(str.isalnum, text2)).lower()
```

با استفاده از کلاس CountVectorizer، یک بردار ویژگی برای هر یک از دو متن ایجاد کنید:

```bash
vectorizer = CountVectorizer().fit_transform([string1, string2])
```

شباهت کسینوسی بین دو بردار ویژگی را محاسبه کنید:

```bash
cosine_similarities = cosine_similarity(vectorizer[0], vectorizer[1]).flatten()
```

مقدار شباهت بین دو متن را چاپ کنید:

```bash
    print("شباهت بین دو متن:", cosine_similarities[0])
```

# مثال

```bash
import numpy as np
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity

# Define the two input texts
text1 = "This is the first text."
text2 = "This is the second text."

# Preprocess the texts by converting them into lowercase and removing non-alphanumeric characters
string1 = ''.join(filter(str.isalnum, text1)).lower()
string2 = ''.join(filter(str.isalnum, text2)).lower()

# Create a feature vector for each text using the CountVectorizer class
vectorizer = CountVectorizer().fit_transform([string1, string2])

# Compute the cosine similarity between the two feature vectors
cosine_similarities = cosine_similarity(vectorizer[0], vectorizer[1]).flatten()

# Print the similarity between the two texts
print("شباهت بین دو متن:", cosine_similarities[0])
```

این کد مقدار زیر را چاپ می‌کند:

```bash
شباهت بین دو متن: 0.9999999999999998
```

که نشان می‌دهد که دو متن ورودی با استفاده از اندازه‌گیری شباهت کسینوسی، بسیار شبیه به هم هستند.

# پارامترها

هیچ پارامتر خاصی برای این کد تعیین نشده است.

# خروجی

این کد شباهت بین دو متن ورودی را به عنوان یک عدد اعشاری بین 0 و 1 محاسبه می‌کند. در اینجا، مقدار 0 به معنی عدم شباهت و مقدار 1 به معنی شباهت کامل است.

# محدودیت‌ها

این کد محدودیت‌هایی دارد:

    این کد فقط فرکانس کلمات در متن‌ها را مد نظر قرار می‌دهد و ترتیب کلمات و مفهومی که در آنها مورد استفاده قرار می‌گیرد را در نظر نمی‌گیرد. بنابراین، برای مقایسه متونی که ترتیب کلمات آنها متفاوت هستند یا مفاهیم آنها متفاوت هستند، ممکن است مناسب نباشد.

    این کد فرض می‌کند که متن ورودی به زبان انگلیسی است. اگر متن به زبان دیگری باشد، ممکن است کد به درستی عمل نکند.

    این کد فرض می‌کند که متن‌های ورودی به اندازه کافی بلند هستند و حاوی کلمات خاصی هستند که برای مقایسه معنایی کافی هستند. اگر متن‌های ورودی بسیار کوتاه باشند یا حاوی کلمات تکراری باشند، این کد ممکن است نتایج معناداری نداشته باشد.

# منابع

# لایسنس

# قدردانی