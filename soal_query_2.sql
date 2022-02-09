WITH T0 AS
	(SELECT TS.no_entry_so,
	(TS.qty*MK."Qty") AS qty_satuan,
	(TS.qty*MK."Qty"*MP.harga_satuan*1.1+MC.ongkos_kirim) AS amount
	FROM tr_so TS
	INNER JOIN master_konversi MK
		ON TS.satuan = MK."Satuan"
	INNER JOIN master_product MP
		ON TS.kode_barang = MP.kode_produk
	INNER JOIN master_customer MC
		ON TS.kode_customer = MC.kode_customer 
	ORDER BY TS.no_entry_so)
		SELECT TD.no_do, 
		TD.tgl_do, 
		T0.qty_satuan AS qty,
		T0.amount
		FROM T0
		JOIN tr_do TD
			ON T0.no_entry_so = TD.no_entry_so;