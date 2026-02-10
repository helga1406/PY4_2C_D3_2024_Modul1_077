# logbook_app_077

Bagaimana prinsip SRP membantu kalian saat harus menambah fitur History Logger
tadi?

Penerapan SRP sangat membantu saya menjaga kerapian kode saat menambahkan fitur History Logger. Tanpa SRP, logika yang cukup kompleks seperti mengambil waktu saat ini (Datetime.now), memformat jam, hingga membatasi list agar maksimal 5 item (removelast) pasti akan menumpuk di dalam UI dan membuat method build jadi berantakan. Dengan memisahkan "otak" di Controller dan "tampilan" di View, kode UI saya tetap bersih karena hanya bertugas menampilkan data yang sudah diolah. Selain itu, pemisahan ini membuat fitur jadi lebih mudah dikelola, misalnya jika nanti saya ingin mengubah batas history dari 5 menjadi 10, saya cukup mengedit logika di Controller tanpa perlu khawatir merusak desain atau widget di View.
