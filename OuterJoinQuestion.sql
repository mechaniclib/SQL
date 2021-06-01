-- Q1.직원들의 이름(first_name), 입사일, 부서명(department_name) 검색하세요
-- 단, 부서가 없는 직원이 있다면 그 직원 정보도 검색에 포함시키기
-- user hr/hr table

--solutions
select first_name, hire_date, departments.department_name
from employees, departments
where employees.department_id = departments.department_id(+);

--results
/*
SQL> select first_name, hire_date, departments.department_name
  2  from employees, departments
  3  where employees.department_id = departments.department_id(+);

FIRST_NAME                               HIRE_DAT DEPARTMENT_NAME
---------------------------------------- -------- ------------------------------------------------------------
Jennifer                                 03/09/17 Administration
Pat                                      05/08/17 Marketing
Michael                                  04/02/17 Marketing
Karen                                    07/08/10 Purchasing
Guy                                      06/11/15 Purchasing
Sigal                                    05/07/24 Purchasing
Shelli                                   05/12/24 Purchasing
Alexander                                03/05/18 Purchasing
Den                                      02/12/07 Purchasing
Susan                                    02/06/07 Human Resources
Douglas                                  08/01/13 Shipping
Donald                                   07/06/21 Shipping
Kevin                                    06/05/23 Shipping
Alana                                    06/04/24 Shipping
Vance                                    07/03/17 Shipping
Samuel                                   06/07/01 Shipping
Britney                                  05/03/03 Shipping
Sarah                                    04/02/04 Shipping
Randall                                  07/12/19 Shipping
Timothy                                  06/07/11 Shipping
Jennifer                                 05/08/13 Shipping
Kelly                                    05/06/14 Shipping
Anthony                                  07/02/07 Shipping
Julia                                    06/06/24 Shipping
Alexis                                   05/02/20 Shipping
Nandita                                  04/01/27 Shipping
Girard                                   08/02/03 Shipping
Martha                                   07/06/21 Shipping
Jean                                     06/02/23 Shipping
Winston                                  06/01/24 Shipping
Peter                                    06/07/09 Shipping
Randall                                  06/03/15 Shipping
Curtis                                   05/01/29 Shipping
Trenna                                   03/10/17 Shipping
Joshua                                   06/04/06 Shipping
John                                     06/02/12 Shipping
Stephen                                  05/10/26 Shipping
Renske                                   03/07/14 Shipping
Hazel                                    08/02/06 Shipping
Ki                                       07/12/12 Shipping
Michael                                  06/08/26 Shipping
Jason                                    04/06/14 Shipping
TJ                                       07/04/10 Shipping
James                                    05/02/16 Shipping
Mozhe                                    05/10/30 Shipping
Laura                                    05/08/20 Shipping
Steven                                   08/03/08 Shipping
James                                    07/01/14 Shipping
Irene                                    06/09/28 Shipping
Julia                                    05/07/16 Shipping
Kevin                                    07/11/16 Shipping
Shanta                                   05/10/10 Shipping
Payam                                    03/05/01 Shipping
Adam                                     05/04/10 Shipping
Matthew                                  04/07/18 Shipping
Diana                                    07/02/07 IT
Valli                                    06/02/05 IT
David                                    05/06/25 IT
Bruce                                    07/05/21 IT
Alexander                                06/01/03 IT
Hermann                                  02/06/07 Public Relations
Charles                                  08/01/04 Sales
Jack                                     06/04/23 Sales
Jonathon                                 06/03/24 Sales
Alyssa                                   05/03/19 Sales
Ellen                                    04/05/11 Sales
Sundita                                  08/04/21 Sales
Elizabeth                                07/03/24 Sales
William                                  07/02/23 Sales
Tayler                                   06/01/24 Sales
Harrison                                 06/03/23 Sales
Lisa                                     05/03/11 Sales
Amit                                     08/04/21 Sales
Sundar                                   08/03/24 Sales
David                                    08/02/23 Sales
Mattea                                   08/01/24 Sales
Danielle                                 07/03/19 Sales
Clara                                    05/11/11 Sales
Sarath                                   06/11/03 Sales
Louise                                   05/12/15 Sales
Lindsey                                  05/03/10 Sales
Allan                                    04/08/01 Sales
Patrick                                  04/03/04 Sales
Janette                                  04/01/30 Sales
Oliver                                   07/11/23 Sales
Nanette                                  06/12/09 Sales
Christopher                              06/03/30 Sales
Peter                                    05/08/20 Sales
David                                    05/03/24 Sales
Peter                                    05/01/30 Sales
Eleni                                    08/01/29 Sales
Gerald                                   07/10/15 Sales
Alberto                                  05/03/10 Sales
Karen                                    05/01/05 Sales
John                                     04/10/01 Sales
Lex                                      01/01/13 Executive
Neena                                    05/09/21 Executive
Steven                                   03/06/17 Executive
Luis                                     07/12/07 Finance
Jose Manuel                              06/03/07 Finance
Ismael                                   05/09/30 Finance
John                                     05/09/28 Finance
Daniel                                   02/08/16 Finance
Nancy                                    02/08/17 Finance
William                                  02/06/07 Accounting
Shelley                                  02/06/07 Accounting
Kimberely                                07/05/24

107 rows selected.
*/

-- Q2.세일즈부서(department)의 직원(employees)들의 전화번호 목록을 검색하세요
--solutions
select emp.first_name, emp.phone_number, dp.department_name
from employees emp, departments dp
where dp.department_name = 'Sales' and emp.department_id = dp.department_id(+);

--results
/*
SQL> select emp.first_name, emp.phone_number, dp.department_name
  2  from employees emp, departments dp
  3  where dp.department_name = 'Sales' and emp.department_id = dp.department_id(+);

FIRST_NAME                               PHONE_NUMBER                             DEPARTMENT_NAME
---------------------------------------- ---------------------------------------- ------------------------------------------------------------
John                                     011.44.1344.429268                       Sales
Karen                                    011.44.1344.467268                       Sales
Alberto                                  011.44.1344.429278                       Sales
Gerald                                   011.44.1344.619268                       Sales
Eleni                                    011.44.1344.429018                       Sales
Peter                                    011.44.1344.129268                       Sales
David                                    011.44.1344.345268                       Sales
Peter                                    011.44.1344.478968                       Sales
Christopher                              011.44.1344.498718                       Sales
Nanette                                  011.44.1344.987668                       Sales
Oliver                                   011.44.1344.486508                       Sales
Janette                                  011.44.1345.429268                       Sales
Patrick                                  011.44.1345.929268                       Sales
Allan                                    011.44.1345.829268                       Sales
Lindsey                                  011.44.1345.729268                       Sales
Louise                                   011.44.1345.629268                       Sales
Sarath                                   011.44.1345.529268                       Sales
Clara                                    011.44.1346.129268                       Sales
Danielle                                 011.44.1346.229268                       Sales
Mattea                                   011.44.1346.329268                       Sales
David                                    011.44.1346.529268                       Sales
Sundar                                   011.44.1346.629268                       Sales
Amit                                     011.44.1346.729268                       Sales
Lisa                                     011.44.1343.929268                       Sales
Harrison                                 011.44.1343.829268                       Sales
Tayler                                   011.44.1343.729268                       Sales
William                                  011.44.1343.629268                       Sales
Elizabeth                                011.44.1343.529268                       Sales
Sundita                                  011.44.1343.329268                       Sales
Ellen                                    011.44.1644.429267                       Sales
Alyssa                                   011.44.1644.429266                       Sales
Jonathon                                 011.44.1644.429265                       Sales
Jack                                     011.44.1644.429264                       Sales
Charles                                  011.44.1644.429262                       Sales

34 rows selected.
*/
