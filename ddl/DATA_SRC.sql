CREATE TABLE DATA_SRC
(
    DataSrc_ID      CHAR(6) NOT NULL PRIMARY KEY,
    Authors         VARCHAR(255),
    Title           VARCHAR(255) NOT NULL,
    Year            CHAR(4),
    Journal         VARCHAR(135),
    Vol_City        CHAR(16),
    Issue_State     CHAR(5),
    Start_Page      CHAR(5),
    End_Page        CHAR(5)
)    