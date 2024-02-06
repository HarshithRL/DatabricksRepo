-- Databricks notebook source
-- MAGIC %python
-- MAGIC dbutils.widgets.help()

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # "Run Acessed Command" will not work in SQL notebook its only for Python Notebook

-- COMMAND ----------

-- MAGIC %fs ls dbfs:/databricks-datasets/flights/

-- COMMAND ----------

create or REPLACE temporary view demo_flights using csv options ('path'"dbfs:/databricks-datasets/flights/departuredelays.csv",'header''true','inferSchema''true')

-- COMMAND ----------

select * from  demo_flights

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Creating Widgets Using Sql 

-- COMMAND ----------

-- MAGIC %python
-- MAGIC #to create Widgets in Python notebook
-- MAGIC #we use 'dbutils' to make a widgets 

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.widgets.dropdown("database", "default", [database[0] for database in spark.catalog.listDatabases()])

-- COMMAND ----------

create database dbooo

-- COMMAND ----------

-- DBTITLE 1,Dropdown
create widget dropdown drop_down default "MSY" choices select distinct destination from demo_flights

-- COMMAND ----------

-- DBTITLE 1,Combobox
create widget combobox combo_box default "MSY" choices select distinct destination from demo_flights

-- COMMAND ----------

-- DBTITLE 1,Multi select 
create widget multiselect multi_box default "MSY" choices select distinct destination from demo_flights

-- COMMAND ----------

-- DBTITLE 1,Text field
create widget text text_field default "MSY" 

-- COMMAND ----------

-- DBTITLE 1,Acessing The Widgets value
select "${text_field}"

-- COMMAND ----------

-- DBTITLE 1,Applying Widget value to Query
select * from  demo_flights where destination = getargument('text_field')

-- COMMAND ----------


