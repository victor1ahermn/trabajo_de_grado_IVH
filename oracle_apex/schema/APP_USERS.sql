CREATE TABLE "APP_USERS" (
    "USERNAME" VARCHAR2 (50 CHAR) NOT NULL ENABLE,
    "PASSWORD_HASH" VARCHAR2 (256 CHAR) NOT NULL ENABLE,
    "USER_ROLE" VARCHAR2 (10 CHAR) NOT NULL ENABLE,
    "FIRST_NAME" VARCHAR2 (50 CHAR) NOT NULL ENABLE,
    "LAST_NAME" VARCHAR2 (50 CHAR) NOT NULL ENABLE,
    "SEMESTER" VARCHAR2 (6 CHAR),
    CONSTRAINT "APP_USERS_PK" PRIMARY KEY ("USERNAME") USING INDEX ENABLE,
    CONSTRAINT "APP_USERS_ROLE_CHK" CHECK (
        user_role IN (
            'STUDENT',
            'PROFESSOR',
            'DEBUG'
        )
    ) ENABLE
);

CREATE OR REPLACE EDITIONABLE TRIGGER "APP_USERS_HASH_PASSWORD_TRG" 
before insert or update of password_hash on app_users
for each row
declare
  l_hash varchar2(2000);
begin
  if :new.password_hash is not null then
    select standard_hash(:new.password_hash, 'SHA256')
      into l_hash
      from dual;

    :new.password_hash := l_hash;
  end if;
end;
/
ALTER TRIGGER "APP_USERS_HASH_PASSWORD_TRG" ENABLE;

CREATE OR REPLACE EDITIONABLE TRIGGER "APP_USERS_UPPER_USERNAME_TRG" 
before insert or update of username on app_users
for each row
begin
  :new.username := upper(:new.username);
end;
/
ALTER TRIGGER "APP_USERS_UPPER_USERNAME_TRG" ENABLE;