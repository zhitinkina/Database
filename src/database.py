from configparser import ConfigParser
import psycopg2


def config(filename="database.ini", section="postgresql"):
    parser = ConfigParser()
    parser.read(filename)

    db = {}
    if parser.has_section(section):
        params = parser.items(section)
        for param in params:
            db[param[0]] = param[1]
    else:
        raise Exception(f"Section {section} not found in the {filename} file")
    return db


def db_fetch_all(sql, params=None):
    conn = None
    try:
        conn = psycopg2.connect(**config())
        cur = conn.cursor()
        cur.execute(sql, params)
        result = cur.fetchall()
        conn.commit()
        cur.close()
        return result
    except BaseException as ex:
        print(ex)
    finally:
        if conn is not None:
            conn.close()


def db_execute(sql, params):
    conn = None
    try:
        conn = psycopg2.connect(**config())
        cur = conn.cursor()
        cur.execute(sql, params)
        conn.commit()
        cur.close()
    except BaseException as ex:
        print(ex)
        raise
    finally:
        if conn is not None:
            conn.close()
