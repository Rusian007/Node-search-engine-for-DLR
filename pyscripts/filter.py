import sparker

def FilterText():
    filtered = sparker.df.filter(lambda ele: "twinkle" in ele)
    filter = filtered.collect()
    return filter
