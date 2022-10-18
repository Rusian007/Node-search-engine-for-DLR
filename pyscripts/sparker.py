from pyspark.sql import SparkSession

print("Import complete")

spark = SparkSession.builder.appName('test').getOrCreate()

print("APP creation complete")

df = spark.sparkContext.textFile("../twinkle.txt")
filtered = df.filter(lambda ele: "twinkle" in ele)
filter = filtered.collect()
print(filter)
