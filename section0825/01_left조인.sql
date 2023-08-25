�� [left join �� right join]

--�л����̺��� ��� ���� ��������, �������̺��� �й��� ��ġ�ϴ� ��� ��������
select ST.*, SU.*
from tb_student ST left join tb_sugang SU
on ST.hakno = SU.hakno;

��1) left join�� �̿��ؼ� ������û�� ���� ���� �й�, �̸�, �����ڵ� ��ȸ�Ͻÿ�
select  ST.hakno, ST.uname, SU.hakno, SU.gcode
from tb_student ST left join tb_sugang SU
on ST.hakno = SU.hakno
where SU.hakno is null;

��2) right join�� �̿��ؼ� ������û�� ���� ���� �й�, �̸�, �����ڵ� ��ȸ�Ͻÿ�
select ST.hakno, ST.uname, SU.hakno, SU.gcode
from tb_sugang SU right join tb_student ST
on SU.hakno = ST.hakno
where SU.hakno is null;
///////////////////////////////////////////////////////////////////

�� [ (+)��ȣ�� �̿��� ���̺� ���� ] 
   (+)��ȣ�� ��ġ���� �ʴ� ���� �������� ���� �ʿ� ���δ�
select ST.hakno, ST.uname, SU.hakno, SU.gcode 
from tb_student ST, tb_sugang SU
where ST.hakno=SU.hakno(+);       --left join

select ST.hakno, ST.uname, SU.hakno, SU.gcode
from tb_sugang SU, tb_student ST
where SU.hakno(+)=ST.hakno;       --right join

