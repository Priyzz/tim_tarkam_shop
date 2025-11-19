Nama: Priyanggara Zuhaynanda Zavana
NPM: 2406359241
Kelas: PBP F

TUGAS 7
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree di Flutter itu bisa diibaratkan seperti pohon keluarga dari tampilan aplikasi. Setiap bagian UInya seperti teks, tombol, atau gambar adalah sebuah widget yang menempati posisi tertentu dalam pohon tersebut. Jadi, Flutter menyusun tampilan dengan cara membuat struktur hierarki widget yang saling berkaitan dari atas ke bawah. Dalam struktur itu, ada hubungan parent-child antar widget. Widget yang menjadi parent berfungsi mengatur bagaimana child ditampilkan, seperti posisi, ukuran, atau gaya tampilannya. Setiap perubahan pada widget bisa menyebabkan bagian tertentu dari pohon ini dibangun ulang (rebuild). Itulah sebabnya Flutter terasa cepat dan responsif, karena hanya bagian yang berubah saja yang diperbarui, bukan seluruh tampilan.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
Widget yang saya gunakan:
- MaterialApp
Widget utama yang mengatur konfigurasi aplikasi Flutter.
- Scaffold
Struktur dasar halaman Material Design.
- AppBar
Bilangan atas (header) halaman.
- Text
Digunakan untuk menampilkan judul di AppBar.
- Padding
Memberikan jarak (padding) di sekitar child-nya.
- Column
Menyusun widget secara vertikal.
- Container
Widget serba guna untuk mendekorasi dan mengatur tata letak.
- Center
Memusatkan child-nya secara horizontal dan vertikal.
- Icon
Menampilkan ikon sepak bola dan ikon di tombol.
- SizedBox
Digunakan untuk memberi jarak antar widget.
- ElevatedButton.icon
Digunakan untuk membuat tombol dengan ikon di sebelah kiri teks.
- Spacer
Mendorong elemen di bawahnya ke bagian bawah layar.
- SnackBar
Digunakan untuk memberi umpan balik saat tombol ditekan.
- ScaffoldMessenger
Menampilkan dan menyembunyikan SnackBar.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
MaterialApp adalah salah satu widget paling penting dalam Flutter karena berfungsi sebagai pembungkus utama (root) yang menyediakan struktur dan gaya Material Design untuk seluruh aplikasi.Secara sederhana, MaterialApp bisa diibaratkan seperti “kerangka besar” tempat seluruh tampilan aplikasi kita dibangun. Widget ini mengatur banyak hal mendasar, seperti:
- Judul aplikasi (title) yang ditampilkan pada task switcher.
- Tema visual (theme) termasuk warna utama, gaya teks, dan ikon.
- Navigasi (routes, navigator) untuk berpindah antar halaman.
- Halaman awal (home) yang ditampilkan pertama kali saat aplikasi dijalankan.

Widget ini sering dijadikan widget root karena Flutter menggunakan prinsip “semua adalah widget”, dan MaterialApp memberikan fondasi agar widget lain dapat tampil sesuai standar desain Android modern. Tanpa MaterialApp, widget seperti Scaffold, AppBar, atau SnackBar tidak akan bisa berfungsi dengan benar, karena mereka membutuhkan konteks dari Material Design environment yang disediakan oleh MaterialApp.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
Menurut saya, perbedaan utama antara StatelessWidget dan StatefulWidget terletak pada apakah tampilan widget tersebut bisa berubah atau tidak selama aplikasi berjalan. StatelessWidget digunakan untuk tampilan yang bersifat tetap. Artinya, data atau tampilannya tidak akan berubah kecuali dibangun ulang oleh parent widget. Contohnya adalah teks statis, ikon, atau judul halaman yang tidak interaktif. Sementara itu, StatefulWidget digunakan ketika tampilan perlu menyesuaikan diri dengan interaksi pengguna atau perubahan data, misalnya saat menekan tombol, mengisi formulir, atau mengambil data dari internet. Widget ini memiliki objek State yang menyimpan data dan dapat memanggil setState() untuk memperbarui tampilan. Saya akan memilih StatelessWidget jika elemen UI tidak perlu berubah, sedangkan StatefulWidget saya gunakan ketika ingin menampilkan sesuatu yang dinamis dan responsif terhadap aksi pengguna.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah objek yang mewakili posisi atau lokasi sebuah widget di dalam widget tree aplikasi Flutter. Setiap widget yang dibangun di Flutter selalu memiliki konteks sendiri, dan konteks ini berisi informasi tentang lingkungan widget tersebut, seperti tema (Theme), ukuran layar, atau hubungan antar widget lain.

BuildContext sangat penting karena digunakan Flutter untuk mengetahui di mana sebuah widget berada dalam hierarki tampilan dan bagaimana ia harus berinteraksi dengan widget lain di sekitarnya. Misalnya, ketika kita ingin menampilkan SnackBar dengan ScaffoldMessenger.of(context), Flutter perlu tahu konteks dari widget yang sedang aktif agar tahu di Scaffold mana snack bar itu harus muncul.

Dalam metode build(), BuildContext digunakan sebagai parameter, contohnya:

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Contoh BuildContext')),
    body: Center(
      child: Text(
        'Halo, Flutter!',
        style: Theme.of(context).textTheme.headline6,
      ),
    ),
  );
}


Pada contoh ini, context membantu widget Text mengakses tema yang sedang digunakan oleh aplikasi (Theme.of(context)), dan juga memungkinkan Scaffold mengetahui bagaimana menyusun tampilan. Jadi, singkatnya, BuildContext adalah “identitas lokasi” sebuah widget di pohon Flutter, yang memungkinkan komunikasi dan akses ke properti antar widget di atasnya membuat UI Flutter menjadi dinamis dan terstruktur dengan baik.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot reload di Flutter adalah fitur yang memungkinkan kita melihat hasil perubahan kode secara langsung dan cepat tanpa kehilangan state (keadaan) dari aplikasi yang sedang berjalan. Jadi, ketika saya mengubah bagian tampilan atau logika kecil dalam file Dart dan menekan tombol hot reload, Flutter akan menyuntikkan perubahan kode baru ke dalam Dart Virtual Machine (VM), lalu membangun ulang widget tree yang terpengaruh tanpa menjalankan ulang fungsi main() atau me-reset aplikasi. Karena state tidak hilang, ini sangat berguna untuk eksperimen desain atau penyesuaian tampilan secara cepat.

Sedangkan hot restart juga memperbarui kode ke versi terbaru, tapi dengan mengulang seluruh aplikasi dari awal. Artinya, Flutter akan menjalankan ulang fungsi main() dan menghapus semua state yang tersimpan sebelumnya. Perbedaan utamanya terletak pada apakah state dipertahankan atau tidak yang dimana hot reload mempertahankan state, sementara hot restart menghapusnya.

TUGAS 8
1. Dalam pengalaman saya mengembangkan aplikasi Football Shop, saya melihat bahwa perbedaan utama antara Navigator.push() dan Navigator.pushReplacement() terletak pada cara mereka mengelola tumpukan (stack) halaman. Saat saya menggunakan Navigator.push(), halaman baru akan ditambahkan di atas halaman sebelumnya, sehingga pengguna masih bisa kembali ke halaman sebelumnya dengan tombol back. Sementara itu, Navigator.pushReplacement() menggantikan halaman yang sedang aktif dengan halaman baru, jadi halaman sebelumnya akan dihapus dari tumpukan dan tidak bisa dikembalikan lagi. Dalam konteks aplikasi Football Shop, saya biasanya menggunakan Navigator.push() untuk navigasi yang bersifat eksploratif, seperti ketika pengguna berpindah dari halaman utama ke halaman detail produk. Namun, saya lebih memilih Navigator.pushReplacement() setelah proses tertentu selesai, misalnya setelah pengguna berhasil login, agar halaman login tidak bisa diakses kembali dengan tombol back.

2. Dalam membangun aplikasi Football Shop, saya memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk menjaga konsistensi tampilan dan navigasi di setiap halaman. Scaffold saya gunakan sebagai kerangka utama karena menyediakan struktur dasar seperti area untuk AppBar, body, dan Drawer. Melalui AppBar, saya menampilkan judul halaman, ikon keranjang, atau tombol pencarian agar pengguna selalu tahu konteks halaman yang sedang dibuka. Sedangkan Drawer saya manfaatkan untuk menampung menu navigasi utama, seperti akses cepat ke halaman beranda, katalog produk, profil, dan pengaturan. Dengan pola ini, setiap halaman di aplikasi memiliki tata letak yang seragam dan pengalaman pengguna menjadi lebih intuitif serta mudah dipahami.

3. Dalam mendesain antarmuka aplikasi Football Shop, saya menggunakan berbagai layout widget seperti Padding, SingleChildScrollView, dan ListView karena masing-masing memiliki kelebihan yang mendukung tampilan form agar lebih rapi dan nyaman digunakan. Widget Padding saya gunakan untuk memberi jarak antar elemen input agar tampilan tidak terlihat menumpuk atau terlalu rapat, sehingga pengguna bisa fokus pada setiap bagian form tanpa merasa sesak. Kemudian, SingleChildScrollView saya gunakan agar halaman form bisa digulir ke bawah, terutama ketika form memiliki banyak elemen input atau ketika layar perangkat lebih kecil. Ini mencegah elemen form tertutup oleh keyboard dan memastikan semua bagian form tetap bisa diakses. Sementara itu, ListView saya manfaatkan untuk menampilkan kumpulan elemen input dengan struktur yang fleksibel dan responsif, karena ListView secara otomatis bisa menyesuaikan tinggi konten tanpa harus menentukan ukurannya secara manual. Dalam aplikasi saya, kombinasi ketiga widget ini digunakan di halaman Tambah Produk, di mana setiap input seperti Name, Price, Description, dan Category ditata dengan rapi serta tetap mudah digulir oleh pengguna.

4. Untuk menjaga identitas visual aplikasi Football Shop agar konsisten dengan brand toko, saya menyesuaikan warna tema utama (primary color) dan elemen pendukungnya seperti tombol, AppBar, dan ikon dengan warna yang identik dengan suasana olahraga dan sepak bola. Saya memilih warna hijau tua dan putih sebagai warna dominan karena hijau melambangkan lapangan sepak bola serta memberi kesan energik dan profesional, sementara putih memberikan kontras yang bersih dan mudah dibaca. Warna tersebut saya terapkan secara konsisten di seluruh aplikasi melalui ThemeData, termasuk pada tombol “Tambah Produk”, AppBar, dan latar belakang halaman utama. Dengan begitu, pengguna bisa langsung mengenali nuansa khas Football Shop hanya dari tampilannya, sehingga tercipta pengalaman visual yang harmonis dan mudah diingat.

TUGAS 9
1. Menurut saya, membuat model Dart saat mengambil atau mengirim data JSON penting karena membantu memastikan struktur dan tipe data tetap konsisten. Dengan model, saya bisa memanfaatkan fitur null-safety, sehingga setiap field memiliki tipe yang jelas dan aman dari error null. Selain itu, model memudahkan proses serialisasi dan deserialisasi data, membuat kode lebih rapi serta mudah dipahami oleh pengembang lain.

Jika saya langsung memetakan JSON ke Map<String, dynamic>, konsekuensinya adalah hilangnya validasi tipe data dan keamanan null-safety. Saya harus memeriksa tipe dan nilai setiap field secara manual, yang rentan menyebabkan bug. Selain itu, kode menjadi sulit dirawat karena tidak ada struktur yang jelas, apalagi jika data JSON sering berubah. Dengan kata lain, model membuat aplikasi lebih aman, stabil, dan mudah dikelola dalam jangka panjang.

2. Package http berfungsi sebagai alat dasar untuk melakukan komunikasi antara aplikasi Dart atau Flutter dengan server. Melalui package ini, saya bisa melakukan permintaan seperti GET, POST, PUT, atau DELETE untuk mengambil atau mengirim data dalam format JSON. Namun, http hanya mengirimkan permintaan satu kali tanpa menyimpan status login atau sesi pengguna — artinya setiap permintaan bersifat independen dan tidak “mengingat” interaksi sebelumnya.

Sementara itu, CookieRequest berperan lebih lanjut karena menyimpan cookie dari server, yang biasanya digunakan untuk menjaga session atau status autentikasi pengguna. Jadi, jika saya login ke server menggunakan CookieRequest, maka cookie login akan otomatis disertakan pada permintaan berikutnya tanpa harus mengirim ulang data login. Dengan kata lain, http cocok untuk permintaan stateless umum, sedangkan CookieRequest digunakan ketika aplikasi memerlukan autentikasi berkelanjutan atau interaksi dengan server yang membutuhkan sesi login yang tetap aktif.

3. Instance CookieRequest perlu dibagikan ke semua komponen dalam aplikasi Flutter karena objek ini menyimpan status autentikasi dan cookie sesi pengguna. Dengan berbagi instance yang sama, setiap halaman atau komponen aplikasi dapat mengakses informasi login yang konsisten tanpa perlu melakukan autentikasi ulang. Misalnya, setelah saya login, semua halaman lain bisa langsung menggunakan instance tersebut untuk mengirim permintaan ke server dengan cookie yang sudah tersimpan memastikan pengguna tetap dalam keadaan “login” di seluruh bagian aplikasi.

Jika setiap komponen membuat instance CookieRequest baru, maka data sesi dan cookie tidak akan terbagi, sehingga pengguna akan dianggap belum login di halaman lain. Hal ini tentu akan menyebabkan pengalaman pengguna tidak mulus dan menyulitkan manajemen status aplikasi. Dengan satu instance bersama, komunikasi antara frontend dan backend menjadi lebih efisien, konsisten, dan aman.

4. Agar Flutter dapat berkomunikasi dengan Django, perlu dilakukan beberapa konfigurasi penting. Di sisi Django, kita harus menambahkan 10.0.2.2 ke ALLOWED_HOSTS karena alamat ini digunakan emulator Android untuk mengakses server lokal di komputer pengembang. Selain itu, kita perlu mengaktifkan CORS agar Django mengizinkan permintaan dari domain atau port berbeda, serta mengatur SameSite dan cookie supaya sesi login dapat dipertahankan saat Flutter mengirim permintaan lintas domain. Di sisi Flutter, kita juga harus menambahkan izin akses internet (android.permission.INTERNET) agar aplikasi bisa terhubung ke server.

Jika konfigurasi tersebut tidak dilakukan dengan benar, aplikasi Flutter bisa gagal mengakses Django. Permintaan mungkin ditolak karena masalah CORS, sesi login tidak dikenali karena cookie tidak dikirim, atau koneksi ke server gagal total akibat tidak ada izin internet. Akibatnya, fitur seperti login dan pengambilan data tidak akan berfungsi sebagaimana mestinya.

5. Mekanisme pengiriman data dari input hingga dapat ditampilkan di Flutter berjalan melalui beberapa tahap yang saling terhubung. Pertama, pengguna mengisi data melalui form input di Flutter, kemudian data tersebut dikirim ke server menggunakan HTTP request atau CookieRequest (jika membutuhkan autentikasi). Data dikirim dalam format JSON ke endpoint Django yang sudah disiapkan. Di sisi Django, server akan menerima data tersebut, memprosesnya (misalnya menyimpan ke database melalui model), lalu mengirimkan response JSON kembali ke aplikasi Flutter.

Setelah Flutter menerima response dari Django, data JSON tersebut diubah menjadi model Dart agar memiliki struktur dan tipe data yang konsisten. Model ini lalu digunakan untuk menampilkan data di UI menggunakan widget seperti ListView, FutureBuilder, atau Text. Dengan alur ini, proses pertukaran data antara frontend (Flutter) dan backend (Django) menjadi efisien, terstruktur, dan mudah dipelihara.

6. Saat saya melakukan register di aplikasi Flutter, pertama saya memasukkan data akun seperti username, email, dan password. Data ini kemudian dikirim lewat HTTP request ke backend Django. Di Django, server menerima data tersebut, memvalidasi input, dan menyimpan akun baru di database setelah password di-hash. Saat login, saya memasukkan username dan password, Flutter mengirimkannya ke Django, lalu Django memeriksa kecocokan dengan data yang tersimpan. Jika cocok, Django membuat token atau sesi dan mengirimkannya kembali ke Flutter sebagai bukti autentikasi. Flutter menyimpan token ini dan menampilkan menu yang sesuai, misalnya halaman profil atau dashboard. Saat logout, Flutter menghapus token lokal dan memberi tahu Django untuk menghapus sesi, sehingga saya harus login lagi untuk mengakses menu yang dilindungi.

7. Untuk mengimplementasikan checklist ini secara teknis, pertama saya memastikan proyek Django sudah dideploy di server atau localhost, lalu menguji endpoint JSON menggunakan Postman untuk memastikan response menampilkan data item yang lengkap. Kedua, di Flutter saya membuat form registrasi dengan TextFormField untuk username, email, dan password, lalu mengirim data tersebut menggunakan http.post ke endpoint Django /register/, menangani response dan menampilkan notifikasi sukses atau error. Ketiga, halaman login dibuat serupa, menggunakan http.post ke endpoint /login/, lalu menyimpan token JWT atau session cookie di SharedPreferences untuk autentikasi selanjutnya.
Keempat, di Django saya membuat model kustom Item dengan field seperti name, price, description, thumbnail, category, dan is_featured, lalu membuat serializer untuk mengubah data menjadi JSON. Kelima, di Flutter saya membuat halaman daftar item menggunakan FutureBuilder untuk fetch data dari endpoint JSON, lalu menampilkan atribut di masing-masing card dengan widget ListView.builder. Keenam, saya membuat halaman detail item yang menerima data item melalui navigator arguments, menampilkan semua field dengan Text dan Image.network, serta menambahkan tombol Back dengan Navigator.pop(). Terakhir, untuk filter berdasarkan user login, saya menambahkan parameter user pada endpoint Django (request.user) dan memanggil endpoint dengan token autentikasi di header Flutter, sehingga hanya item milik user yang muncul di daftar.