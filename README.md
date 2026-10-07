# Recovery Console

Web satu file (`index.html`) untuk memerintah recovery GDRE Tools dari HP.

Alur: tempel token GitHub, pilih file game (pck, exe, apk, zip),
upload ke branch `pck-inbox` di repo `gdsdecomp`, tekan Jalankan recovery,
pantau status, download hasil dari Release `hasil-recovery`.

Buka: https://hazn75206-sketch.github.io/recovery-console/

Catatan:

- Token butuh akses contents dan actions ke repo `gdsdecomp`.
- Key enkripsi tidak pernah disimpan, hanya dikirim sekali per run.
- Branch inbox hanya menyimpan satu file terakhir.
