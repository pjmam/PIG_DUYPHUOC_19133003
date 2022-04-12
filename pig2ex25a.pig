data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_recs = foreach data generate empno,ename, job,mgr,hiredate, sal, comm,deptno;
rec_fltr = filter all_recs by   (SIZE(ename) == 5) and (SUBSTRING(ename,0,1) == 'S');
rec_ordr = order rec_fltr by sal;
dump rec_fltr;
store rec_fltr into 'output/pig2ex25a';