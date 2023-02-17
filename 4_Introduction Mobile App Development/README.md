# (4) Introduction Mobile App Development
Muhamad Ikhsan F

Flutter - Kelas D

## Software
### Pengertian
Software merupakan perangkat lunak yang tersimpan dan dapat dikendalikan pada sistem komputer. Software tersebut terbentuk dari perintah-perintah atau instruksi yang terorganisir agar software dapat berfungsi sesuai dengan pembuatnya. Software juga tidak memiliki bentuk fisik.

### Jenis Software
#### Website
Website seperti youtube.com, kompas.com, merupakan sebuah halaman yang menyediakan informasi seperti gambar, video, audio dan tulisan yang bisa kita akses menggunakan browser seperti chrome, firefox, safari, edge dan lain-lain. Jumlah website yang ada pada tahun 2021 sebanyak 1.83 milyar website.
+ Dapat diakses menggunakan web browser
+ Memerlukan internet untuk membukanya

#### Desktop
Contoh aplikasi desktop yaitu microsoft office, adobe ilustrator, photoshop dan lain-lain.
+ Berjalan pada perangkat desktop
+ Umumnya perlu langkah instalasi
+ Dapat dibuka tanpa memerlukan internet (Conditional)

#### Mobile
+ Berjalan pada perangkat mobile (smartphone atau tablet)
+ Umumnya perlu langkah instalasi
+ Instalasi dapat dilakukan melalui store penyedia aplikasi (Google playstore, Apple Appstore)
+ dapat dibuka tanpa memerlukan internet (Conditional)

## Pengembangan Software
Software merupakan kumpulan perintah-perintah yang ditulis oleh pengembang menggunakan bahasa pemrograman. Apa itu bahasa pemrograman?

### Bahasa Pemrograman
Bahasa pemrograman merupakan rangkaian teks yang digunakan untuk memberi perintah kepada komputer. Jumlah bahasa pemrograman yang ada sekarang lebih dari 300 bahasa. Bahasa pemrograman yang populer contohnya seperti python, javascript, C++, C#, Ruby, Java dan masih banyak lagi. 

Ada banyak bahasa yang tersedia sesuai dengan platformnya masing-masing. Contohnya Game Dev menggunakan C++ / C#, Web Dev menggunakan HTML, CSS, Javascript, PHP untuk membuat website, Mobile Dev menggunakan Java / Kotlin untuk membuat aplikasi android dan Swift atau Objective C untuk IOS, Data Scientist menggunakan python untuk analisis data dari data set, Desktop Dev menggunakan C++, Java dan C# untuk membuat aplikasi dekstop dan Multiplatform App Dev menggunakan Dart untuk membuat aplikasi mobile, web, desktop dan embedded software.

### Compiler
Bahasa pemrograman yang telah dibuat (Source Code) perlu diterjemahkan ke bahasa mesin agar dapat dijalankan oleh komputer. Proses tersebut dinakaman Compile. Compiler merupakan software yang digunakan untuk membaca perintah-perintah dalam bahasa pemrograman dan mengubahnya ke bahasa lain, biasanya ke dalam bentuk yang dikenali oleh komputer seperti machine code.

#### Cara Kerja Compiler
1. Bahasa pemrograman di-compile menggunakan compiler dan menghasilkan aplikasi output yang dapat dijalankan
2. Aplikasi output dapat dijalankan oleh perangkat dan dapat menampilkan sesuai dengan instruksi-instruksi yang telah dibuat.

![compiler](https://hpc-wiki.info/mediawiki/hpc_images/thumb/8/8a/Compiler_Shematic.png/1000px-Compiler_Shematic.png)

### Interpreter
Selain compiler, ada juga interpreter. Interpreter merupakan software yang digunakan untuk membaca perintah-perintah dalam bahasa pemrograman dan menjalankan langsung perintah-perintah tersebut.
###Cara Kerja Interpreter
1. Source code di-duplicate
2. Hasil duplicate akan diterjemahkan oleh interpreter
3. Interpreter akan menghasilkan output yang sesuai dengan source code

![interpreter](https://media.geeksforgeeks.org/wp-content/uploads/20200530152827/223-1.png)

### Compiler vs Interpreter
| Compiler  | Interpreter |
| --- | --- |
| Mengubah kode menjadi file yang dapat dijalankan  | Membaca kode tanpa mengubah ke bentuk lain  |
| Prosesnya lebih panjang  | Prosesnya lebih singkat  |
| Program dapat dijalankan dengan cepat setelah di-compile karena tidak membaca ulang kode | Seringkali lebih lambat karena harus membaca ulang keseluruhan kode |

## Mobile App Development
Merupakan sebuah proses pengembangkan aplikasi untuk perangkat mobile

### iOS
+ Berjalan pada sistem operasi iOS
+ Perangkat hanya dikembangkan oleh Apple
+ Bahasa pemrograman native iOS yaitu Swift dan Objective C

### Android
+ Berjalan pada sistem operasi Android
+ Perangkat berkembang luas karena open source
+ Bahasa pemrograman native untuk android yaitu Java dan Kotlin

### Tahapan
Kita bisa menggunakan bahasa pemrograman Dart untuk pengembangkan aplikasi iOS dan Android dengan single code base. Dimana kita hanya membuat kode sebanyak satu kali dan kode tersebut dapat berjalan di beberapa platform.
1. Bahasa dan framework (Dart + Flutter)
2. Compiler (Android/iOS SDK)
3. Machine code (.apk/.ipa)

Kemudian hasilnya dapat langsung di-install pada perangkat
1. Machine code (.apk/.ipa)
2. Output aplikasi
