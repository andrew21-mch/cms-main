CREATE SCHEMA cms;

CREATE TABLE cms.wtaxy_chat ( 
	chat_sender_id       int UNSIGNED NOT NULL    ,
	chat_reciever_id     int UNSIGNED NOT NULL    ,
	chat_message         varchar(512)      ,
	CONSTRAINT unq_wtaxy_chat_chat_sender_id UNIQUE ( chat_sender_id ) ,
	CONSTRAINT unq_wtaxy_chat_chat_reciever_id UNIQUE ( chat_reciever_id ) 
 ) engine=InnoDB;

CREATE TABLE cms.wtaxy_grade ( 
	submission_id        int UNSIGNED NOT NULL    ,
	judge_id             int UNSIGNED NOT NULL    ,
	grade_value          double   DEFAULT 0   ,
	CONSTRAINT pk_wtaxy_grade PRIMARY KEY ( submission_id, judge_id ),
	CONSTRAINT unq_wtaxy_grade_submission_id UNIQUE ( submission_id ) ,
	CONSTRAINT unq_wtaxy_grade_judge_id UNIQUE ( judge_id ) 
 ) engine=InnoDB;

CREATE TABLE cms.wtaxy_user ( 
	user_id              int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	user_name            varchar(32)  NOT NULL    ,
	user_email           varchar(32)  NOT NULL    ,
	user_pass            varchar(128)  NOT NULL    ,
	user_first_name      varchar(32)  NOT NULL    ,
	user_last_name       varchar(32)  NOT NULL    ,
	user_gender          varchar(1)      ,
	user_dob             date   DEFAULT CURRENT_DATE   ,
	user_verified        boolean  NOT NULL DEFAULT false   
 ) engine=InnoDB;

CREATE TABLE cms.wtaxy_address ( 
	address_id           int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	address_line_one     varchar(64)      ,
	address_line_two     varchar(64)      ,
	address_region       varchar(32)      ,
	address_country      char(2)      ,
	user_id              int UNSIGNED NOT NULL    
 ) engine=InnoDB;

CREATE TABLE cms.wtaxy_admin ( 
	admin_id             int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	admin_level          int UNSIGNED NOT NULL DEFAULT 404   ,
	user_id              int UNSIGNED NOT NULL    
 ) engine=InnoDB;

CREATE TABLE cms.wtaxy_contestant ( 
	contestant_id        int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	user_id              int UNSIGNED NOT NULL    ,
	contestant_image_dir varchar(128)      
 ) engine=InnoDB;

CREATE TABLE cms.wtaxy_judge ( 
	judge_id             int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	judge_level          int UNSIGNED NOT NULL DEFAULT 404   ,
	user_id              int UNSIGNED NOT NULL    
 ) engine=InnoDB;

CREATE TABLE cms.wtaxy_submission ( 
	submission_id        int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	submission_date      date  NOT NULL DEFAULT CURRENT_DATE   ,
	submission_file_dir_en varchar(128)  NOT NULL    ,
	submission_file_dir_kom varchar(128)  NOT NULL    ,
	contestant_id        int UNSIGNED NOT NULL    ,
	submission_final_grade double   DEFAULT 0   
 ) engine=InnoDB;

ALTER TABLE cms.wtaxy_address ADD CONSTRAINT fk_address_wtaxy_user FOREIGN KEY ( user_id ) REFERENCES cms.wtaxy_user( user_id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE cms.wtaxy_admin ADD CONSTRAINT fk_wtaxy_admin_wtaxy_user FOREIGN KEY ( user_id ) REFERENCES cms.wtaxy_user( user_id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE cms.wtaxy_contestant ADD CONSTRAINT fk_wtaxy_contestant_wtaxy_user FOREIGN KEY ( user_id ) REFERENCES cms.wtaxy_user( user_id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE cms.wtaxy_judge ADD CONSTRAINT fk_wtaxy_judge_wtaxy_user FOREIGN KEY ( user_id ) REFERENCES cms.wtaxy_user( user_id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE cms.wtaxy_judge ADD CONSTRAINT fk_wtaxy_judge_wtaxy_grade FOREIGN KEY ( judge_id ) REFERENCES cms.wtaxy_grade( judge_id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE cms.wtaxy_judge ADD CONSTRAINT fk_wtaxy_judge_wtaxy_chat FOREIGN KEY ( judge_id ) REFERENCES cms.wtaxy_chat( chat_sender_id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE cms.wtaxy_judge ADD CONSTRAINT fk_wtaxy_judge_wtaxy_chat_0 FOREIGN KEY ( judge_id ) REFERENCES cms.wtaxy_chat( chat_reciever_id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE cms.wtaxy_submission ADD CONSTRAINT fk_wtaxy_submission FOREIGN KEY ( contestant_id ) REFERENCES cms.wtaxy_contestant( contestant_id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE cms.wtaxy_submission ADD CONSTRAINT fk_wtaxy_submission_wtaxy_grade FOREIGN KEY ( submission_id ) REFERENCES cms.wtaxy_grade( submission_id ) ON DELETE CASCADE ON UPDATE CASCADE;
