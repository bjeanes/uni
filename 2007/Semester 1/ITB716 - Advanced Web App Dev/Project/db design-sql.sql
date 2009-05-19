/* SQLEditor export export plugin = Generic SQL*/


CREATE TABLE 'units'
(
'unitID' INTEGER(11) NOT NULL AUTO_INCREMENT ,
'unitCode' VARCHAR(6) UNIQUE ,
'name' VARCHAR,
PRIMARY KEY ('unitID')
);



CREATE TABLE 'users'
(
'userID' INTEGER(11) NOT NULL AUTO_INCREMENT ,
'username' VARCHAR(15) UNIQUE ,
'password' CHAR(32),
'realName' VARCHAR,
PRIMARY KEY ('userID')
);



CREATE TABLE 'folders'
(
'folderID' INTEGER(11) NOT NULL AUTO_INCREMENT ,
'parentFolderID' INTEGER(11) NOT NULL,
'ownerUserID' INTEGER(11),
'name' VARCHAR,
PRIMARY KEY ('folderID')
);



CREATE TABLE 'notes'
(
'noteID' INTEGER(11) NOT NULL AUTO_INCREMENT ,
'userID' INTEGER(11),
'folderID' INTEGER(11),
'title' VARCHAR DEFAULT 'Untitled',
'note' TEXT,
'creationDate' DATETIME,
'modificationTime' DATETIME,
PRIMARY KEY ('noteID')
);



CREATE TABLE 'users_units'
(
'userID' INTEGER(11),
'unitID' INTEGER(11),
PRIMARY KEY ('userID','unitID')
);


CREATE INDEX 'users_userID_idx' ON 'users'('userID');
;
ALTER TABLE 'folders' ADD FOREIGN KEY ('parentFolderID') REFERENCES 'folders'('folderID');
;
ALTER TABLE 'folders' ADD FOREIGN KEY ('ownerUserID') REFERENCES 'users'('userID');
;
ALTER TABLE 'notes' ADD FOREIGN KEY ('userID') REFERENCES 'users'('userID');
;
ALTER TABLE 'notes' ADD FOREIGN KEY ('folderID') REFERENCES 'folders'('folderID');
;
ALTER TABLE 'users_units' ADD FOREIGN KEY ('userID') REFERENCES 'users'('userID');
;
ALTER TABLE 'users_units' ADD FOREIGN KEY ('unitID') REFERENCES 'units'('unitID');
