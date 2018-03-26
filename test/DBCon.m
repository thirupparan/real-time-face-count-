function [ msg,msg2 ] = DBCon( root,psws )
%DB Service Port, Username, Password
host = 'localhost:3306';
user = 'root';
psw = '123';

%Database Name
dbname = 'test';

%JDBC Parameters
jdbcString = sprintf('jdbc:mysql://%s/%s', host, dbname);
jdbcDriver = 'com.mysql.jdbc.Driver';

%Path to mysql Connector
javaclasspath = ('mysql-connector-java-5.1.46-bin.jar');

%Now making DB connection Object
dbConn = database(dbname, user, psw, jdbcDriver, jdbcString);

%checking Connection Status
dbStatus = isopen(dbConn);
if (dbStatus==0)
    msg = sprintf('Error to estabilish the connection.\nReason: %s', dbConn.Message);
    passtolog = makelog('Connection failed',msg);
    msgbox(msg);
    msg=0;
    return
else
    msg=1;
end

msg2=dbConn;

end

