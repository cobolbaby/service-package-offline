REVOKE CONNECT ON DATABASE template1 FROM PUBLIC;

-- 创建用户，数据库
CREATE USER grafana WITH LOGIN PASSWORD '******'; 
CREATE DATABASE grafana OWNER grafana;

CREATE USER insightalarm WITH LOGIN PASSWORD '******'; 
CREATE DATABASE msgcenter OWNER insightalarm;
