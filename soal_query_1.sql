WITH T1 AS(
	SELECT MP.nama_pegawai AS "Employee",
	COUNT(DISTINCT TS.no_so) AS "Jumlah SO"
	FROM tr_so TS
	INNER JOIN master_pegawai MP 
		ON TS.kode_sales = MP.kode_pegawai
	GROUP BY "Employee"
	ORDER BY "Employee")
		SELECT MP.nama_pegawai AS "Employee", T1."Jumlah SO",
		CASE 
			WHEN T1."Jumlah SO" <= MP.target THEN 'ya'
			ELSE 'tidak'
		END AS "kurang dari target?"
		FROM T1
		INNER JOIN master_pegawai MP 
			ON T1."Employee" = MP.nama_pegawai;