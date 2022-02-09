SELECT MP.nama_product,
SUM(MK."Qty"*TS.qty) AS "Quantity"
FROM master_product MP
INNER JOIN tr_so TS
	ON TS.kode_barang = MP.kode_produk
INNER JOIN master_konversi MK
	ON MK."Satuan" = TS.satuan
GROUP BY MP.nama_product;
