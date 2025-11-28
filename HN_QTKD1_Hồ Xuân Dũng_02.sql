-- Viết lệnh tạo một CSDL mới tên là CompanyDB và sử dụng nó.
create database CompanyDB;
use CompanyDB;
-- Tạo 3 bảng dưới đây với đầy đủ các cột, kiểu dữ liệu và ràng buộc.
create table Employees (
employee_id int primary key auto_increment,
employee_name VARCHAR(100) not null,
email VARCHAR(100) unique not null,
salary DECIMAL(10, 2) check(salary>0),
department varchar(50)
);
create table Projects(
project_id INT primary key auto_increment,
project_name VARCHAR(100) not null,
budget DECIMAL(15, 2),
start_date date
);
create table Assignments(
assignment_id INT primary key auto_increment,
employee_id INT,
foreign key (employee_id) references Employees(employee_id),
project_id INT,
foreign key (project_id ) references Projects(project_id),
hours_worked INT default(0),
assignment_date DATE
);
-- Viết các lệnh để thêm dữ liệu mẫu vào 3 bảng (employees,projects,assignments như sau:
insert into Employees(employee_name,email,salary,department)
values ('Nguyen Van An', 'an.nguyen@company.com', 15000000, 'Ky Thuat'),
('Tran Thi Binh', 'binh.tran@company.com', 12000000, 'Ke Toan'),
('Le Van Cuong', 'cuong.le@company.com', 18000000, 'Ky Thuat'),
('Pham Thi Dung', 'dung.pham@company.com', 10000000, 'Nhan Su'),
('Hoang Van Em', 'em.hoang@company.com', 20000000, 'Quan Ly'),
('Do Thi Hoa', 'hoa.do@company.com', 11000000, 'Ke Toan'),
('Vu Van Giang', 'giang.vu@company.com', 14000000, 'Ky Thuat'),
('Bui Thi Hang', 'hang.bui@company.com', 9000000, 'Nhan Su'),
('Ngo Van Hung', 'hung.ngo@company.com', 16000000, 'Marketing'),
('Trinh Thi Khoi','khoi.trinh@company.com',13000000,'Marketing');
insert into Projects(project_name,budget,start_date)
values ('Xay dung Website', 50000000, '2024-01-01'),
('Phat trien App Mobile', 80000000, '2024-02-01'),
('Kiem toan tai chinh', 20000000, '2024-03-01'),
('Tuyen dung nhan su', 5000000, '2024-04-01'),
('Chien luoc kinh doanh', 30000000, '2024-05-01'),
('Bao tri he thong', 15000000, '2024-06-01'),
('Bao cao thue', 10000000, '2024-07-01'),
('Dao tao noi bo', 5000000, '2024-08-01'),
('Quang cao Facebook', 25000000, '2024-09-01'),
('Nghien cuu thi truong', 15000000, '2024-10-01');
insert into Assignments(employee_id ,project_id,hours_worked ,assignment_date)
values (1, 1, 120, '2024-01-05'),
(2, 3, 50, '2024-03-05'),
(3, 2, 150, '2024-02-05'),
(4, 4, 20, '2024-04-05'),
(5, 5, 80, '2024-05-05'),
(6, 7, 40, '2024-07-05'),
(7, 6, 60, '2024-06-05'),
(8, 8, 10, '2024-08-05'),
(9, 9, 100, '2024-09-05'),
(10, 10, 90, '2024-10-05');
-- Cập nhật mức lương (salary) của nhân viên có tên "Nguyen Van An" thành 17000000.
set sql_safe_updates=0;
update Employees 
set salary = 17000000
where employee_name= 'Nguyen Van An';
-- Cập nhật ngân sách (budget) của dự án "Xay dung Website" gấp đôi giá trị hiện tại.
set sql_safe_updates=0;
update Projects
set budget =2*budget
where project_name='Xay dung Website';
-- Xóa các bản ghi phân công trong bảng Assignments nếu số giờ làm việc (hours_worked) nhỏ hơn hoặc bằng 10.
delete
from Assignments 
where hours_worked <=10; 
-- Xóa dự án có tên "Dao tao noi bo" khỏi bảng Projects.
delete 
from Projects
where project_name='Dao tao noi bo';
-- Lấy ra danh sách nhân viên thuộc phòng ban (department) là "Ke Toan".
select department
from Employees 
where department like 'Ke Toan';
-- Lấy ra danh sách các dự án có ngân sách (budget) lớn hơn 20,000,000.
select *
from Projects
where budget>20000000;
-- Tìm kiếm các nhân viên có email chứa chữ "company.com".
select email
from Employees 
where email like '%company.com';
-- Lấy ra danh sách nhân viên sắp xếp theo lương (salary) giảm dần.
select salary
from Employees 
order by salary desc;
-- Lấy ra thông tin của 3 dự án mới nhất.
select *
from Projects 
order by project_id desc
limit 3;
-- Lấy ra danh sách gồm: Tên nhân viên (employee_name), Phòng ban, Tên dự án (project_name) và Số giờ làm việc.
select e.employee_name,p.project_name,e.department,a.hours_worked
from Assignments a 
join Employees e on e.employee_id=employee_id
join Projects p on p.project_id= a.project_id ;
-- Lấy ra tên dự án và tên nhân viên của những dự án có ngân sách trên 30,000,000.
select e.employee_name, p.project_name,p.budge
from Employees e
join Projects on e.employee_id=p.project_id
group by project_id
having budge>30000000;
-- Hiển thị danh sách các dự án thuộc về nhân viên có chức vụ trong phòng "Ky Thuat".
select ;


-- Thống kê số lượng nhân viên trong từng phòng ban (department).
select department,count(*) as nhan_vien
from Employees
group by department;
-- Tính tổng mức lương (salary) mà công ty phải trả cho mỗi phòng ban
select department,sum(salary) as tong_salary
from Employees
group by department;
-- Tìm những phòng ban (department) có số lượng nhân viên lớn hơn hoặc bằng 3
select department, count(*) as so_luong_nhan_vien
from Employees 
group by department
having count(*) >=3;

 









