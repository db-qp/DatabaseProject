-- tables

-- Table: Users

CREATE TABLE Users (
	User_ID TEXT,
	Name TEXT,
	Yelping_since TIMESTAMP,
	PRIMARY KEY (User_ID)
);

-- Table: Business

CREATE TABLE Business (
	Business_ID TEXT,
	Title TEXT,
	PRIMARY KEY (Business_ID)
);

-- Table: Review

CREATE TABLE Review (
	Rating INTEGER,
	Description TEXT,
	Date TIMESTAMP,
	User_ID TEXT,
	Business_ID TEXT,
	PRIMARY KEY (User_ID, Business_ID),
	FOREIGN KEY (User_ID) REFERENCES Users,
	FOREIGN KEY (Business_ID) REFERENCES Business
);

-- Table: Tip

CREATE TABLE Tip (
	Tip_ID TEXT,
	Tip_content TEXT,
	Date TIMESTAMP,
	User_ID TEXT,
    Business_ID TEXT,
	PRIMARY KEY (User_ID, Business_ID, Tip_ID),
	FOREIGN KEY (User_ID) REFERENCES Users ON DELETE NO ACTION,
    FOREIGN KEY (Business_ID) REFERENCES Business ON DELETE NO ACTION
);

-- Table: Photo

CREATE TABLE Photo (
	Photo_ID TEXT,
	Caption TEXT,
	Business_ID TEXT,
	PRIMARY KEY (Business_ID, Photo_ID),
	FOREIGN KEY (Business_ID) REFERENCES Business
);

-- Table: Category

CREATE TABLE Category (
	Category_ID TEXT,
	Name TEXT,
	PRIMARY KEY (Category_ID)
);

-- Table: HasACategory

CREATE TABLE HasACategory (
	Category_ID TEXT,
	Business_ID TEXT,
	PRIMARY KEY (Business_ID, Category_ID),
	FOREIGN KEY (Business_ID) REFERENCES Business,
	FOREIGN KEY (Category_ID) REFERENCES Category
);
