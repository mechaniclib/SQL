---------- 1. 수연

/*
문제: 
부서 번호를 입력 받아 최고 급여액과 최저 급여액의 차이를 반환하되 
출력값은 $9999.99 형태와 같이 출력하라
(테스트할 부서 번호는 10으로 한다.)
*/


CREATE OR REPLACE FUNCTION s_gap_sal(s_deptno emp.deptno%type)
RETURN varchar2
IS
    gap_sal varchar2(10);
BEGIN
    SELECT to_char((max(sal) - min(sal)), '$9999.99')
        INTO gap_sal
    FROM emp
    WHERE deptno = s_deptno;

    RETURN gap_sal;
END;
/

SELECT s_gap_sal(10) FROM dual;


/*
결과물:
S_GAP_SAL(10)
--------------
 $3700.00
*/



---------- 2. 태영

/*
문제:
DALLAS에서 근무하는 사원들의 연봉이 50%인상되었다. 인상이 반영된 채로 전체 사원들중 연봉이 1500이상인 직원들을 연봉순으로 나열하라.
(임의로 새 테이블을 만들어서 작성하고, rownum을 사용하여라.)
*/


CREATE TABLE emp001 AS SELECT * FROM emp;

UPDATE emp001 SET sal=sal*1.5 
WHERE deptno=(SELECT deptno FROM dept WHERE loc='DALLAS');

SELECT rownum, ename, sal
FROM (SELECT rownum, ename, sal
    FROM emp001 ORDER BY sal DESC)
WHERE sal >=1500;


/*
결과물:
ROWNUM ENAME                       SAL
---------- -------------------- ----------
         1 KING                       5000
         2 FORD                       4500
         3 JONES                    4462.5
         4 BLAKE                      2850
         5 CLARK                      2450
         6 ALLEN                      1600
         7 TURNER                     1500
*/


---------- 3. 동기

/*
문제:
emp 테이블을 사용하여 사원이름을 입력하면 사번, 급여, 커미션이 저장되는 프로시저를 만들고 (In/out 사용)
'SMITH'을 넣어 execute하라.
그리고 'SMITH'의 사번, 급여, 커미션을 각각 출력하라.
(단, comm이 NULL인 경우 0으로 출력하라)
*/


CREATE OR REPLACE procedure emp_sal_info
    (
    v_ename IN emp.ename%type,
    v_empno OUT emp.empno%type,
    v_sal OUT emp.sal%type,
    v_comm OUT emp.comm%type
    )
IS
BEGIN
	SELECT empno, sal, nvl(comm,0)
		INTO v_empno, v_sal, v_comm
	FROM emp
	WHERE ename=v_ename;
END;
/

VARIABLE out_empno number;
VARIABLE out_sal number;
VARIABLE out_comm number;

EXECUTE emp_sal_info('SMITH', :out_empno, :out_sal, :out_comm);

PRINT out_empno;
PRINT out_sal;
PRINT out_comm;


/*
결과물:
SQL>
 OUT_EMPNO
----------
      7369

SQL> 
   OUT_SAL
----------
       800

SQL> 

  OUT_COMM
----------
	 0
*/




---------- 4. 유경

/*
문제:
사원의 급여가 20번부서의 최소급여보다 많이 받는 부서를 부서별로 출력하라.
*/


SELECT deptno, min(sal) FROM emp
GROUP BY deptno
HAVING min(sal) > (SELECT min(sal) FROM emp WHERE deptno=20);


/*
결과물:
DEPTNO   MIN(SAL)
---------- ----------
        30        950
        10       1300
*/



----------5. 영민

/*
문제:
신발상품관련 고객, 신발종류, 신발색상, 신발사이즈, 제조사, 모델목록 테이블 생성
*/


DROP TABLE shoes_customer;
DROP TABLE shoes_type;
DROP TABLE shoes_color;
DROP TABLE shoes_size;
DROP TABLE shoes_product;

CREATE TABLE shoes_customer(
  cs_number number(5),
  cs_name varchar2(10),
  cs_type varchar2(10),
  cs_colOR varchar2(10),
  cs_size number(5),
  cs_brand varchar2(10)
);

CREATE TABLE shoes_type(
  shoes_type varchar2(10)
);

CREATE TABLE shoes_colOR(
  colOR varchar2(10)
);

CREATE TABLE shoes_size(
  shoes_size number(5)
);

CREATE TABLE shoes_product(
  product_number number(5),
  product_name varchar2(10),
  shoes_type varchar2(10),
  colOR varchar2(10),
  shoes_size number(5),
  brand_name varchar2(10)
);

INSERT INTO shoes_customer VALUES(0001, 'Alex', 'sneakers', 'blue', 255, 'NIKE');
INSERT INTO shoes_customer VALUES(0002, 'Alice', 'flat_shoe', 'green', 240, 'Crocs');
INSERT INTO shoes_customer VALUES(0003, 'Edward', 'high_hill', 'red' , 235, 'Clarks');
INSERT INTO shoes_customer VALUES(0004, 'Smith', 'canvas', 'white', 275, 'ADIDAS');
INSERT INTO shoes_customer VALUES(0005, 'Robert', 'working', 'black', 290, 'FILA');

INSERT INTO shoes_type VALUES('sneakers');
INSERT INTO shoes_type VALUES('sandal');
INSERT INTO shoes_type VALUES('flat_shoe');
INSERT INTO shoes_type VALUES('high_hill');
INSERT INTO shoes_type VALUES('canvAS');
INSERT INTO shoes_type VALUES('dress_shoes');
INSERT INTO shoes_type VALUES('working');

INSERT INTO shoes_color VALUES('black');
INSERT INTO shoes_color VALUES('white');
INSERT INTO shoes_color VALUES('gray');
INSERT INTO shoes_color VALUES('red');
INSERT INTO shoes_color VALUES('blue');
INSERT INTO shoes_color VALUES('green');
INSERT INTO shoes_color VALUES('yellow');
INSERT INTO shoes_color VALUES('purple');

INSERT INTO shoes_size VALUES(220);
INSERT INTO shoes_size VALUES(225);
INSERT INTO shoes_size VALUES(230);
INSERT INTO shoes_size VALUES(235);
INSERT INTO shoes_size VALUES(240);
INSERT INTO shoes_size VALUES(245);
INSERT INTO shoes_size VALUES(250);
INSERT INTO shoes_size VALUES(255);
INSERT INTO shoes_size VALUES(260);
INSERT INTO shoes_size VALUES(265);
INSERT INTO shoes_size VALUES(270);
INSERT INTO shoes_size VALUES(280);
INSERT INTO shoes_size VALUES(285);
INSERT INTO shoes_size VALUES(290);
INSERT INTO shoes_size VALUES(295);
INSERT INTO shoes_size VALUES(300);

INSERT INTO shoes_product VALUES(9001, 'KNY92T', 'sneakers', 'blue', 255, 'NIKE');
INSERT INTO shoes_product VALUES(9002, 'TYZ54R', 'flat_shoes', 'green', 240, 'Crocs');
INSERT INTO shoes_product VALUES(9003, 'MMZ843', 'high_hills', 'red' , 235, 'Clarks');
INSERT INTO shoes_product VALUES(9004, 'MTR086', 'canvas', 'white', 275, 'ADIDAS');
INSERT INTO shoes_product VALUES(9005, 'NYE904', 'working', 'black', 290, 'FILA');
INSERT INTO shoes_product VALUES(9006, 'MYM459', 'sandal', 'white', 260, 'Crocs');

COMMIT;

SELECT * FROM shoes_customer;
SELECT * FROM shoes_type;
SELECT * FROM shoes_color;
SELECT * FROM shoes_size;
SELECT * FROM shoes_product;
