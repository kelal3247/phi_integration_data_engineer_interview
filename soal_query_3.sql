SELECT MC.nama_customer as customer,
TD.no_do,
TD.tgl_do,
(TS.qty*MK."Qty") AS qty,
DATE_PART('day', AGE('2018-02-01', to_date(TI.tgl_inv, 'MM/DD/YY'))) AS "umur hutang"
FROM tr_so TS
INNER JOIN master_konversi MK
	ON TS.satuan = MK."Satuan"
INNER JOIN master_product MP
	ON TS.kode_barang = MP.kode_produk
INNER JOIN master_customer MC
	ON TS.kode_customer = MC.kode_customer
INNER JOIN tr_do TD
	ON TS.no_entry_so = TD.no_entry_so
INNER JOIN tr_inv TI
	ON TD.no_entry_do = TI.no_entry_do;