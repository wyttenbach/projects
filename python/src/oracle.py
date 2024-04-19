import cx_Oracle
 
sql = """
    select
        attribute_1_char
    from
        sot01.fnd_valid_code_child"""
 


with cx_Oracle.connect('queryall', 'XXXXX', 'OPSDD') as db:
    cursor = db.cursor()
    cursor.prepare(sql)
    vcs = [vc for vc in cursor.execute(None)]
 
len(vcs)