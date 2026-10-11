# Recovery Console

Web satu file (`index.html`) untuk memerintah recovery GDRE Tools dari HP.

Alur: pilih file game (pck, exe, apk, zip),
upload ke branch `pck-inbox`, tekan Jalankan recovery,
pantau status, download hasil dari Release `hasil-recovery`.
Mode link: tempel URL langsung ke file, runner yang download sendiri,
HP tidak perlu download game aslinya. Hasil zip langsung bisa dibuka
di Godot (Android) untuk cobain projectnya.

Semua jalan di repo ini sendiri (Actions repo fork dimatikan GitHub).
Token sudah tertanam di halaman (pemakaian pribadi, jangan disebar).

Buka: https://hazn75206-sketch.github.io/recovery-console/

Catatan:

- Token butuh akses contents dan actions ke repo ini.
- Key enkripsi tidak pernah disimpan, hanya dikirim sekali per run.
- Branch inbox hanya menyimpan satu file terakhir.
