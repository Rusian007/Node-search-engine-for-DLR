from pyspark.sql import SparkSession
import sys

print("Import complete \n")

spark = SparkSession.builder.appName('test').getOrCreate()

print("APP creation complete")

df = spark.sparkContext.textFile("./twinkle.txt")

def printHello():
    print("Hello !")
    return "Hello From Python"
