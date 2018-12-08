# Sqoop imports

# Table from Mysql
sqoop import \
--connect jdbc:mysql://localhost:3306/nseProd \
--username=qt \
--password=password \
--table=tradingDays \
--target-dir /mysql/nseProd \
--m 1

# Query from Mysql
sqoop import \
--connect jdbc:mysql://localhost:3306/nseProd \
--username=qt \
--password=password \
--query 'select year, month, day from tradingDays where year=2016 and $CONDITIONS' \
--target-dir /mysql/queryResult \
--m 1


# Table from Mysql to Hive
sqoop import \
--connect jdbc:mysql://localhost:3306/nseProd \
--username=qt \
--password=password \
--table=tradingDays \
--hive-import \
--hive-table=tradingDays \
--target-dir /mysql/table/tradingDays2 \
--m 1

# Incremental Import from Mysql
sqoop job 
--create myjob
--import \
--connect jdbc:mysql://localhost:3306/nseProd \
--username=qt \
--password=password \
--table=tradingDays \
--target-dir /mysql/nseProd \
--m 1
--incremental lastmodified
--check-column ts

