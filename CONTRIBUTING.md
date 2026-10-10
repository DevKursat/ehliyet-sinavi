# Katkıda Bulun 🤝

Bu projeye katkıda bulunmak istediğin için teşekkürler. Bu repo **tek bir dosyadan** (`index.html`) oluşur ve katkı süreci kasıtlı olarak basit tutulmuştur.

## Katkı türleri

| Katkı | Zorluk | Açıklama |
|---|---|---|
| 🐛 **Hata bildirimi** | Kolay | Yanlış bilgi, kırık özellik, çökme |
| ➕ **Yeni soru** | Kolay | Çıkmış tarzı soru + açıklaması |
| 📖 **İçerik düzeltme** | Kolay | Hatalı veya eksik bilgi |
| 🎨 **Özellik** | Orta | Yeni sekme, test modu, görsel iyileştirme |
| 🔧 **Kod** | Zor | Refactor, performans, erişilebilirlik |

---

## 🐛 Hata bildirme

[Issues](https://github.com/DevKursat/ehliyet-sinavi/issues) sekmesinden yeni issue aç.

Şunları belirt:
- Hangi tarayıcı/cihaz kullandın
- Ne yapmaya çalıştın
- Ne oldu, ne olmasını bekliyordun
- Mümkünse ekran görüntüsü

---

## ➕ Yeni soru ekleme (en sık katkı)

### 1. Soru dizisini bul

`index.html` dosyasında şu satırı ara:

```javascript
const SORULAR=[
```

### 2. Doğru ders bloğuna ekle

Dört ders bloğu var: `/* TRAFİK */`, `/* İLK YARDIM */`, `/* MOTOR */`, `/* TRAFİK ADABI */`

Satırın sonuna virgülle yeni nesne ekle:

```javascript
{d:"trafik",y:2025,s:"Soru metni buraya?",o:["A şıkkı","B şıkkı","C şıkkı","D şıkkı"],c:1,a:"Bu cevabın neden doğru olduğunun açıklaması."},
```

### 3. Alan açıklamaları

| Alan | Zorunlu | Açıklama |
|:---:|:---:|---|
| `d` | ✅ | Ders: `trafik`, `ilkyardim`, `motor`, `adap` |
| `y` | ✅ | Yıl veya kaynak etiketi (ör. `2025`) |
| `s` | ✅ | Soru metni |
| `o` | ✅ | **Tam 4 şık** (dizgi içinde) |
| `c` | ✅ | Doğru şıkkın indeksi: **0**=A, **1**=B, **2**=C, **3**=D |
| `a` | ✅ | Açıklama — neden bu cevap doğru? |

### ⚠️ Önemli kurallar

1. **Her sorunun tam 4 şıkkı olmalı.** Az şıklı sorular testte kırılır.
2. **`c` değeri 0-3 arasında olmalı.**
3. **Açıklama zorunlu.** Kullanıcı neden o cevabı seçtiğini anlamalı.
4. **Çeldiriciler zor olsun ama yanlış olsun.** Mekanikçiler sıkıntı çekmemeli.
5. **Mevzuata uygun ol.** Güncel mevzuatı esas al; tarihsel soru değilse eski kural yazma.

### Kontrol listesi (PR'dan önce)

```bash
# Diziyi doğrula: her soru 4 şık + geçerli c değeri
node -e "
const fs=require('fs');
const h=fs.readFileSync('index.html','utf8');
const s=h.match(/const SORULAR=\[([\s\S]*?)\n\];/);
const a=eval('['+s[1]+']');
console.log('Toplam:',a.length);
const b=a.filter(q=>!q.s||q.o.length!==4||q.c<0||q.c>3||!q.a);
console.log(b.length?('BOZUK: '+JSON.stringify(b,null,2)):'Tüm sorular geçerli ✓');
"
```

Sonra tarayıcıda `index.html` dosyasını aç ve testleri çöz.

---

## 🔧 Yeni özellik ekleme

1. `index.html` dosyasını düzenle
2. Değişikliğin çalıştığını tarayıcıda doğrula
3. Konsolu kontrol et (F12 → Console) — hata olmamalı
4. PR'ı aç ve ne yaptığını kısaca açıkla

**Kod stili:**
- Değişken adları: `camelCase`
- Fonksiyon adları: `camelCase`
- Kısa yorumlar satır içi (`//`) — kod açıklaması satırlarıyla boğulmasın
- Yeni bağımlılık ekleme — proje sıfır bağımlılıkla çalışacak şekilde tasarlandı

---

## 📝 Pull Request

PR açarken:
- **Başlık:** ne yaptığını açıkça yaz (ör. "İlk yardım soruları +12")
- **Gövde:** neden bu değişiklik gerekiyor
- İlgili issue numarasını yaz (`Closes #12`)

---

## 📄 Yasal / Kaynak

Sorular kamuya açık çıkmış sınav sorularından ve aşağıdaki kaynaklardan derlenmiştir:

- MEB 2026 MTSK e-Sınav Kılavuzu
- Özel Motorlu Taşıt Sürücüleri Kursu Yönetmeliği
- Direksiyon Eğitimi Sınav Değerlendirme Formu (EK-4)
- Karayolları Trafik Kanunu ve Yönetmeliği

**Bu repo resmi bir MEB ürünü değildir.** Katkı verirken mevzuata uygunluğundan emin ol.

---

## ❓ Sorun mu var?

[Discussions](https://github.com/DevKursat/ehliyet-sinavi/discussions) sekmesinden soru sorabilirsin.

Bir kez daha: ⭐ **Bu proje işine yaradıysa yıldız bırakman çok yardımcı olur.** ⭐