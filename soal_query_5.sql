SELECT MV.vendor,
(TS.qty*MK."Qty"*MP.harga_satuan*1.1+MC.ongkos_kirim)::float8::numeric::money AS "Amount"
FROM master_vendor MV
INNER JOIN master_product MP
	ON MV.kode_vendor = MP.kode_vendor
INNER JOIN tr_so TS
	ON TS.kode_barang = MP.kode_produk
INNER JOIN master_customer MC
	ON MC.kode_customer = TS.kode_customer
INNER JOIN master_konversi MK
	ON MK."Satuan" = TS.satuan	
INNER JOIN tr_do TD
	ON TD.no_entry_so = TS.no_entry_so
INNER JOIN tr_inv TI
	ON TI.no_entry_do = TD.no_entry_do;