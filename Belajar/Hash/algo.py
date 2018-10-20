def algo1(data):
    data_length = len(data)
    chunks_length = 1
    for i in data: 
        if i in [" ", ""]: chunks_length += 1

    chunks = []
    for i in range(data_length):
        temp = []
        try:
            for j in range(i, chunks_length + i):
                temp.append(data[j])
        except:
            return chunks
        chunks.append(temp)

    return chunks

