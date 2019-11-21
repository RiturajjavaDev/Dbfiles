 
    
    drop table tag_master cascade constraints;
    drop table tag_tx_dtl cascade constraints;
    drop table user_master cascade constraints;
    drop sequence ats_user_seq;
    drop sequence tag_gen_seq;
    drop sequence txn_no_seq;

 create sequence ats_user_seq start with 101 increment by  1;
 create sequence tag_gen_seq start with 1 increment by  1;
 create sequence txn_no_seq start with 10000001 increment by  1;
 
    create table tag_master (
       tag_id number(19,0) not null,
        create_dt timestamp,
        tag_bal double precision,
        tag_expiry_dt date,
        tag_start_dt date,
        update_dt timestamp,
        vhcl_reg_num varchar2(7 char),
        vehicle_type varchar2(15 char),
        user_id number(10,0),
        primary key (tag_id)
    );
    
    create table tag_tx_dtl (
       tx_id number(19,0) not null,
        create_dt timestamp,
        toll_amt double precision,
        toll_plaza_id varchar2(255 char),
        tx_failure_rsn varchar2(255 char),
        tx_status varchar2(255 char),
        update_dt timestamp,
        vhcl_reg_num varchar2(7 char),
        tag_id number(19,0),
        primary key (tx_id)
    );
 
    
    create table user_master (
       user_id number(10,0) not null,
        active_sw char(1 char),
        create_dt timestamp,
        dob date,
        email varchar2(50 char),
        first_name varchar2(30 char),
        gender varchar2(10 char),
        last_name varchar2(30 char),
        password varchar2(200 char),
        phno number(19,0),
        role_name varchar2(10 char),
        acc_status varchar2(8 char),
        update_dt timestamp,
        ssn_id varchar2(11 char),
        primary key (user_id)
    );
 
    
    alter table tag_master 
       add constraint FK72i9783u3t3v3ym944pyiqmyb 
       foreign key (user_id) 
       references user_master;
 
    
    alter table tag_tx_dtl 
       add constraint FKc7vjnioqcv65otkg2b656xtwp 
       foreign key (tag_id) 
       references tag_master;