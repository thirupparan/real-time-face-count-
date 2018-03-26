global conn;
conn = database('test','root','');
curs = exec(conn,'SELECT * FROM login');
curs = fetch(curs);
curs.Data