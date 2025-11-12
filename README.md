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