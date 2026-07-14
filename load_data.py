import pandas as pd
import psycopg2

df = pd.read_csv("postings.csv")

print(df.columns)

'''conn = psycopg2.connect(
    database="jobs",
    user="postgres",
    password="password"
)

cur = conn.cursor()
for _, row in df.iterrows():
    cur.execute("""
        INSERT INTO Job(title,salary)
        VALUES(%s,%s)
    """,(row['title'],row['salary']))
conn.commit()'''