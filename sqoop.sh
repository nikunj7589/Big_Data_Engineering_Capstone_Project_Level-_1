mkdir schema
cd schema
sqoop import-all-tables --m 1 --connect jdbc:mysql://ip-10-1-1-204.ap-south-1.compute.internal:3306/anabig114246 --username anabig114246 --password Bigdata123 --compression-codec=snappy --as-avrodatafile --warehouse-dir '/user/anabig114246/exl_bootcamp/' --driver com.mysql.jdbc.Driver