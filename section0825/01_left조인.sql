● [left join 과 right join]

--학생테이블의 모든 행을 가져오고, 수강테이블에서 학번이 일치하는 행안 가져오기
select ST.*, SU.*
from tb_student ST left join tb_sugang SU
on ST.hakno = SU.hakno;

문1) left join을 이용해서 수강신청을 하지 않은 학번, 이름, 과목코드 조회하시오
select  ST.hakno, ST.uname, SU.hakno, SU.gcode
from tb_student ST left join tb_sugang SU
on ST.hakno = SU.hakno
where SU.hakno is null;

문2) right join을 이용해서 수강신청을 하지 않은 학번, 이름, 과목코드 조회하시오
select ST.hakno, ST.uname, SU.hakno, SU.gcode
from tb_sugang SU right join tb_student ST
on SU.hakno = ST.hakno
where SU.hakno is null;
///////////////////////////////////////////////////////////////////

● [ (+)기호를 이용한 테이블 조인 ] 
   (+)기호는 일치되지 않는 행이 존재하지 않은 쪽에 붙인다
select ST.hakno, ST.uname, SU.hakno, SU.gcode 
from tb_student ST, tb_sugang SU
where ST.hakno=SU.hakno(+);       --left join

select ST.hakno, ST.uname, SU.hakno, SU.gcode
from tb_sugang SU, tb_student ST
where SU.hakno(+)=ST.hakno;       --right join

