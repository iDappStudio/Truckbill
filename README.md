# 🚛 Truckbill  

## 📌 Opis aplikacji  
**Truckbill** to nowoczesna aplikacja mobilna stworzona we **Flutterze**, wykorzystująca **Supabase** jako backend.  
Umożliwia łatwe śledzenie i zarządzanie listami przewozowymi, a także generowanie raportów.  

## ✨ Kluczowe funkcjonalności  

### 📝 Dodawanie listu przewozowego  
- 📌 **Numer listu przewozowego**  
- 📍 **Miejsce załadunku**  
- 📅 **Data załadunku**  
- 🏁 **Miejsce rozładunku**  
- 📆 **Data rozładunku**  
- 💰 **Kwota**  
- 📷 **Skanowanie stron dokumentu i ich dołączanie**  

### 🔍 Przeglądanie i edycja listów przewozowych  
- 📄 **Lista wszystkich dodanych listów przewozowych**  
- ✏ **Możliwość edycji i aktualizacji danych**  

### 📊 Generowanie raportów  
- 📂 **Eksport listów przewozowych do pliku Excel (XLSX)**  
- 📅 **Eksport danych dla wybranego miesiąca**  

## 🛠 Technologie  
- **Frontend:** Flutter  
- **Backend:** Supabase (autoryzacja, baza danych, przechowywanie plików)  
- **Format eksportu:** Pliki Excel (XLSX)  

## 🔄 Proces działania  
1️⃣ 🚀 Użytkownik uruchamia aplikację i loguje się.  
2️⃣ 📝 Wypełnia formularz i skanuje dokumenty, aby dodać nowy list przewozowy.  
3️⃣ 📡 Lista przewozowa zostaje zapisana w bazie danych Supabase.  
4️⃣ 🔍 Użytkownik może przeglądać i edytować swoje listy przewozowe.  
5️⃣ 📊 Może wygenerować raport w Excelu dla wszystkich danych lub wybranego miesiąca.  

## 💡 Autor  
📌 **iDappStudio**  

## 📂 Repozytorium  
🔗 GitHub - **Truckbill**  

---

# 🛠 Instalacja i wymagania  

## 1. **Wymagania**  
Aby uruchomić projekt, upewnij się, że masz zainstalowane poniższe narzędzia:

- 📦 **Flutter 3.29.0** (zalecane zarządzanie wersją przez **fvm**)  
- 🌐 **Dart**  
- 🛠 **Melos** (do obsługi monorepo)  

## 2. **Instalacja**  

### 🔧 **Ustawienie wersji Fluttera**  
Zaleca się zarządzanie wersjami Fluttera za pomocą **fvm** (Flutter Version Manager). Aby ustawić odpowiednią wersję Fluttera, uruchom:  

```bash
fvm use
