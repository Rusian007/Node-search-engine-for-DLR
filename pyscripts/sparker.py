from pyspark.sql import SparkSession
import sys

def Initialize():
    global df
    print("Import complete \n")

    spark = SparkSession.builder.appName('test').getOrCreate()

    print("APP creation complete")

    df = spark.sparkContext.textFile("./twinkle.txt")
    return 0

