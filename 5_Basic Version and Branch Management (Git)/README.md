# (5) Basic Version and Branch Management (Git)

## Apa itu versioning?
Versioning yaitu melakukan sebuah pengaturan versi atau pelacakan perubahan dari setiap code program yang dibuat. Ketika ingin merevisi sebuah code tetapi ingin melacak revisi atau perubahan, maka bisa menggunakan versioning tersebut. Dalam project management wajib untuk menggunakan version control system agar setiap perubahan pada project dapat diketahui. Pada sebuah project sekalipun perusahaan ternama pasti tidak ada project yang sempurna, pasti ada update yang harus dilakukan agar project yang dihasilkan semakin optimal. Update yang terjadwal (diluar masalah bug) biasanya dilakukan setiap minggu, setiap bulan atau bahkan setiap tahun.


## Tools Versioning
Tools untuk melakukan pelacakan revisi atau versioning ada 3, yaitu Version Control System (VCS), Source Code Manager (SCM) dan Revision Control System (RCS). 

### Sejarah Version Control System
#### Single User
+ SCCS - 1997 Unix only
+ RCS - 1982 Cross platform, text only

#### Centralized
+ CVS - 1986 File focus
+ Perforce - 1995
+ Subversion - 2000 - track directory structure
+ Microsoft Team Foundation Server - 2005

#### Distributed
+ Git - 2005
+ Mercurial - 2005
+ Bazaar - 2005

## Git
Git merupakan salah satu Version Control System populer yang digunakan para developer sampai saat ini untuk mengembangkan software secara bersama-sama. Git menggunakan sistem terdistribusi bukan tersentralisasi. Git dibuat oleh Linus Torvalds pada 2005 yang juga merupakan seorang penemu sistem operasi linux.

### Repository
Pada git terdapat repository untuk setiap project yang dikerjakan. Repository dapat berisi sekumpulan folder dan file yang dibutuhkan untuk menyelesaikan project. Setiap perubahan pada file di repository dapat dilacak dan dapat melakukan undo atau kembali ke posisi file yang diinginkan.

Cukup rumit untuk membuat server git, maka dari itu dapat menggunakan service yang sudah tersedia, yaitu github.com

### Bagaimana cara untuk menginstall Git pada sistem operasi Windows?
Tahapan untuk menginstall git yaitu sebagai berikut:
1. Download versi terbaru Git for Windows
2. Install sesuai instruksi penginstalan
3. Setelah di-install, git dapat dijalankan melalui Command Prompt atau Git Bash

### Setting Up
Git config
```sh
git config --global user.name "John Doe"
git config --global user.email "johndoe@email.com"
```

git init
```sh
git init
git remote add <remote_name> <remote_repo_url>
git push -u <remote_name> <local_branch_name>
```

Memulai dengan project yang sudah tersedia
```sh
git clone ssh://john@example.com/path/to/my-project.git
cd my-project
```

### Menyimpan Perubahan
Pada git, terdapat staging area. Staging area berisi:
+ Working directory (git add)
+ Staging area (git commit)
+ repository

Command untuk melihat status yaitu:
```sh
git status
```

Commands untuk menyimpan perubahan yaitu
```sh
git add <directory>
```
atau
```sh
git add hello.py
```
atau
```sh
git add .
```
untuk melakukan commit perubahan yaitu:
```sh
git commit -m "your messages here"
```

### File .gitignore
Git ignore merupakan file yang berisi nama file yang akan di-exclude oleh git ketika ada perubahan.
| Pattern | Example Matches | Explanation* |
| --- | --- | --- |
| *.log | Debug.log | tanda bintang pada pola artinya zero or more characters |
| logs | logs/debug.log | seluruh folder atau file yang bernama logs akan dimasukan |
