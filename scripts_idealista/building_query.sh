# Query to obtain data from different houses
VIVEROS="39.47964093,-0.36964822"
FRANCIA="39.45752246,-0.34266034"
BOULEVAR_SUR="39.45039601,-0.39633756"
UNIVERSIDAD_POLITECNICA="39.47964450,-0.33740066"
MOLI_DEL_SOL="39.48110609,-0.40879332"
PISTA_DE_SILLA="39.45806095,-0.37664394"

CENTER=([0]=$VIVEROS [1]=$FRANCIA [2]=$BOULEVAR_SUR [3]=$UNIVERSIDAD_POLITECNICA [4]=$MOLI_DEL_SOL [5]=$PISTA_DE_SILLA)

TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJyZWFkIl0sImV4cCI6MTUxMjY0MDQ4OCwiYXV0aG9yaXRpZXMiOlsiUk9MRV9QVUJMSUMiXSwianRpIjoiYTUyOTI1NTktNjFlYS00YTFhLWEzN2YtNjMzZmViYjczZGY4IiwiY2xpZW50X2lkIjoicThzamU2anA4OG8zd3kwcGpwdjRvZWJweDg0djVzZ2sifQ.vbg8eLDWB2z8SkjGAK9q1J6OHMzhw8WtgZ2at55H80c

for NUM_PAGE in `seq 1 7`; do

  for i in `seq 0 5`; do
    echo CENTER[$i]: ${CENTER[i]}. PAGE: $NUM_PAGE

    curl \
    -X POST \
    -H "Authorization: Bearer $TOKEN" \
    -H "Content-Type: multipart/form-data;" \
    -F "center=${CENTER[i]}" \
    -F "propertyType=homes" \
    -F "distance=945" \
    -F "operation=sale" "https://api.idealista.com/3.5/es/search" \
    -F "maxItems=50" \
    -F "numPage=$NUM_PAGE" \
    -F "order=distance" \
    -F "sort=asc" \
    > ../data_idealista/point-$i-page-$NUM_PAGE.json
  done

done