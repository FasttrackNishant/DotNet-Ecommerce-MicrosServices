DROP TABLE IF EXISTS "Users";

CREATE TABLE "Users" (
    "UserID" UUID PRIMARY KEY,
    "Email" VARCHAR(100),
    "Password" VARCHAR(100),
    "PersonName" VARCHAR(100),
    "Gender" VARCHAR(10)
);

-- Insert sample records
INSERT INTO "Users" ("UserID", "Email", "Password", "PersonName", "Gender") VALUES
(gen_random_uuid(), 'nishant.patil@example.com', 'password123', 'Nishant Patil', 'Male'),
(gen_random_uuid(), 'ravi.kumar@example.com', 'securePass', 'Ravi Kumar', 'Male'),
(gen_random_uuid(), 'aisha.sharma@example.com', 'aisha@123', 'Aisha Sharma', 'Female'),
(gen_random_uuid(), 'rahul.jain@example.com', 'rahul@2024', 'Rahul Jain', 'Male'),
(gen_random_uuid(), 'meera.nair@example.com', 'meera@pwd', 'Meera Nair', 'Female'),
(gen_random_uuid(), 'arjun.singh@example.com', 'arjun@pwd', 'Arjun Singh', 'Male'),
(gen_random_uuid(), 'priya.verma@example.com', 'priya@123', 'Priya Verma', 'Female'),
(gen_random_uuid(), 'rohan.mehta@example.com', 'rohan@pwd', 'Rohan Mehta', 'Male'),
(gen_random_uuid(), 'sneha.kulkarni@example.com', 'sneha@secure', 'Sneha Kulkarni', 'Female'),
(gen_random_uuid(), 'amit.desai@example.com', 'amit@pass', 'Amit Desai', 'Male');