CREATE TABLE Event_Type 
(
	Event_Type_code char(3) NOT NULL,
	Event_Type_Desc varchar(25) NOT NULL,
	PRIMARY KEY (Event_Type_code)
);

CREATE TABLE Hero 
(
	Hero_id int NOT NULL,
	Hero_Name varchar(80) NOT NULL,
	Gender_Code char(1) NOT NULL,
	PRIMARY KEY (Hero_id)

);

CREATE TABLE Person 
(
	Person_id int NOT NULL,
	First_Name varchar(40) DEFAULT NULL,
	Last_Name varchar(40) NOT NULL,
	PRIMARY KEY (Person_id)
);

CREATE TABLE Place 
(
	Place_id int NOT NULL,
	Place_Name varchar(100) NOT NULL,
	Place_Type_Desc varchar(25) NOT NULL,
	city_name varchar(40) NOT NULL,
	State_code char(2) NOT NULL,
	PRIMARY KEY (Place_id)

);

CREATE TABLE Life_Event 
(
	LE_Sequence_Nbr int NOT NULL,
	Year int NOT NULL,
	LE_Comment_Text varchar(100) DEFAULT NULL,
	Hero_id int NOT NULL,
	Place_id int NOT NULL,
	Event_Type_code char(3) NOT NULL,
	PRIMARY KEY (LE_Sequence_Nbr,Hero_id),
	--KEY fk_Life_Event_Hero_idx (Hero_id),
	--KEY fk_Life_Event_Place1_idx (Place_id),
	--KEY fk_Life_Event_Event_Type1_idx (Event_Type_code),
	CONSTRAINT fk_Life_Event_Event_Type1 FOREIGN KEY (Event_Type_code) REFERENCES event_type (Event_Type_code),
	CONSTRAINT fk_Life_Event_Hero FOREIGN KEY (Hero_id) REFERENCES hero (Hero_id),
	CONSTRAINT fk_Life_Event_Place1 FOREIGN KEY (Place_id) REFERENCES place (Place_id)
);

CREATE TABLE Interaction (
Interaction_Type_Name VARCHAR(20) NOT NULL,
Interaction_Detail_Text VARCHAR(100) DEFAULT NULL,
LE_Sequence_Nbr int NOT NULL,
Hero_id int NOT NULL,
Place_id int NOT NULL,
CONSTRAINT fk_Interaction_Sequence FOREIGN KEY (LE_Sequence_Nbr,Hero_id) REFERENCES life_event (LE_Sequence_Nbr,Hero_id),
CONSTRAINT fk_Interaction_Hero FOREIGN KEY (Hero_id) REFERENCES hero (Hero_id),
CONSTRAINT fk_Interaction_Place FOREIGN KEY (Place_id) REFERENCES place (Place_id)
);
