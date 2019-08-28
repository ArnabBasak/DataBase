import pymysql

"""Open a database connection"""
db = pymysql.connect("localhost","root","library123","employee")

"""prepare the cursor object"""
cursor = db.cursor()

"""execute sql query using execute"""
cursor.execute("select version()")

"""fetching the data"""
data = cursor.fetchone()
print("database version is",data)

"""check if the departments table is present or not"""
cursor.execute("show tables like 'departments'")
department_table = cursor.fetchall()
if not department_table:
    print("The department tables doesn't exist creating one")
    create_table_department = """CREATE TABLE Departments (
    Code INTEGER PRIMARY KEY NOT NULL,
    Name TEXT NOT NULL ,
    Budget REAL NOT NULL 
    );"""
    cursor.execute(create_table_department)
else:
    print("Departments table already exists")
    
    
"""check if the employees table is present or not"""
cursor.execute("show tables like 'employees'")
employee_table = cursor.fetchall()
if not employee_table:
    print("The employees table doesn't exist creating one")
    create_table_employees = """CREATE TABLE Employees (
   SSN INTEGER PRIMARY KEY NOT NULL,
   Name TEXT NOT NULL ,
   LastName TEXT NOT NULL ,
   Department INTEGER NOT NULL , 
   CONSTRAINT fk_Departments_Code FOREIGN KEY(Department) 
   REFERENCES Departments(Code)
 );"""
    cursor.execute(create_table_employees)
    
else:
    print("employees table already exists")
    
"""INSERTING DATA IN THE DEPARTMENTS TABLE"""
cursor.execute("INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000)")
cursor.execute("INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000)")
cursor.execute("INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000)")
cursor.execute("INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000)")
db.commit()
cursor.execute("select count(*) from Departments")
department_count = cursor.fetchone()
if int(department_count[0]) > 1:
    print("values inserted in departments table")
else:
    print("data not inserted")
db.close()