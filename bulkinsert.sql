create or replace PROCEDURE BUlk_USER_INSERT
is
x number:=1;
begin
while(x<=1000)
loop
insert into USER_MASTER values(ATS_USER_SEQ.nextval,'Y',
 SYSTIMESTAMP,'16-06-98','Rituraj@gmail.com','Amit',
'MALE','Gupta','12345678',7987989899,'USER','UNLOCK',SYSTIMESTAMP,
'234-56-7700');
commit;
x:=x+1;
end loop;
end;
/


EXECUTE BUlk_USER_INSERT;

create or replace PROCEDURE BUlk_TAG_INSERT
is
x number:=1;
i number:=1;
begin
while(x<=1000)
loop
insert into tag_master values(TAGGEN_SEQ.nextval,
SYSTIMESTAMP - INTERVAL '1' minute,5000.00,'20-NOV-2022','20-NOV-2019',
SYSTIMESTAMP - INTERVAL '1' minute,
'SD54WVD','4-WHEELER',101+i);
commit;
x:=x+1;
i:=i+1;
end loop;
end;
/

EXECUTE BULK_TAG_INSERT;