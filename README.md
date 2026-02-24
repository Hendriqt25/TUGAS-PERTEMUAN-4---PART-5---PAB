# Mini E-Commerce Shopping app

## Deskripsi Singkat

Proyek ini merupakan pengembangan aplikasi Mini E-Commerce Shopping Cart berbasis Flutter yang memanfaatkan Provider sebagai pendekatan dalam pengelolaan state. Aplikasi dirancang untuk mengimplementasikan konsep manajemen state global melalui ChangeNotifier sekaligus mensimulasikan mekanisme dasar sistem keranjang belanja pada platform mobile.

Aplikasi ini menyediakan beberapa fitur sebagai berikut
1. Menampilkan daftar produk
2. Menambahkan produk ke keranjang
3. Mengatur jumlah item
4. Menambahkan dan menghapus item
5. Menghiitung total harga
6. Melakukan Checkout
7. Search products 
8. Filter products berdasarkan category

# Struktur Project

```bash
lib/
 ├── models/
 │    ├── cartproduct.dart
 │    ├── item.dart
 │    └── model.dart
 ├── pages/
 │    ├── listproduct.dart
 │    └── cart_page.dart
 └── main.dart
```

# Tampilan Project

## Dashboard

<img width="700" height="900" alt="image" src="https://github.com/user-attachments/assets/e215a364-6d99-4ded-a466-a4ccaab06f85" />

Pada tampilan Dashboard akan menampilkann daftar product, Search product yang ingin dicari, filter product berdasarkan category dan bisa checkout product yang diinginkan.

Search product
<img width="964" height="1079" alt="image" src="https://github.com/user-attachments/assets/77e4c543-16e5-4ba7-bc52-34d17bc8a735" />

Filter product berdasarkan category

<img width="953" height="1079" alt="image" src="https://github.com/user-attachments/assets/9af3f31a-52d4-48de-b0d1-c1217373b020" />

## Checkout

<img width="700" height="900" alt="image" src="https://github.com/user-attachments/assets/c3845932-5817-40ed-97e6-6b13510ad7fc" />

Pada tampilan checkout akan menampilkan product apa yang ingin di pesan, ada jumlah productnya dan harga productnya. Jika membatalkan pemesanan product, tinggal klik icon sampah dan akan menghapus dari daftar checkout dan jika menambahkan jumlah productnya misal beli 2 product otomatis akan bertambah jumlah total harganya.

Update quantity (+/-)
<img width="700" height="900" alt="image" src="https://github.com/user-attachments/assets/c8119d40-9a44-418b-b55c-b8ea9b6fb2a4" />

Tampilkan harga total 
<img width="700" height="900" alt="image" src="https://github.com/user-attachments/assets/b7280d35-a92a-4325-a39d-920c3a4a7197" />

Jika belum ada product yang ingin dicheckout.
<img width="700" height="900" alt="image" src="https://github.com/user-attachments/assets/c44d1790-5205-436a-8c51-3bbe14870d9f" />


## Form Checkout

<img width="700" height="900" alt="image" src="https://github.com/user-attachments/assets/1e57f06a-048f-46e8-9a1b-5314d371beeb" />

langkah terakhir yaitu mengisi form ketika mau ngecheckout product.





