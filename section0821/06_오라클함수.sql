�� ���� http://pretyimo.cafe24.com/lectureRead.do?lectureno=185

-- ���� ���̺� : dual

�� [����Ŭ �Լ�]
1.���ڿ� ���� �Լ�

select lower('Hello World') from dual;      --���� �ҹ��ڷ� ��ȯ
select upper('Hello World') from dual;      --���� �빮�ڷ� ��ȯ
select length('Hello World') from dual;     --���ڰ���
select substr('Hello World', 1, 5) from dual; --���ڿ� �ڸ��� (ù��° ���ں��� 5��) 'Hello'

select instr('HelloWorld', 'W') from dual;     --Ư������ ��ġ 6
select lpad('SKY', 5, '*') from dual;      --5ĭ������ ����ϰ� ���� ��ĭ�� *�� ä��
select rpad('SKY', 5, '*') from dual;      --5ĭ������ ����ϰ� ������ ��ĭ�� *�� ä��
select replace('happy', 'p', 'k') from dual; --Ư������ ��ȯ

--���ڿ� �����ϱ�
select concat('�ι̿�','�ٸ���') from dual; --�ι̿��ٸ���
select concat(uname,'�� �����'), concat(aver, '�Դϴ�') from sungjuk;
select concat(uname,'�� �����') as �̸�, concat(aver, '�Դϴ�') as ��� from sungjuk;

--���� ������||
select uname || '�� �����'|| aver || '�Դϴ�' from sungjuk;
select uname || '�� �����'|| aver || '�Դϴ�' as str from sungjuk;

--ASCII ���ں�ȯ
select chr(65) from dual;   --'A'
select chr(66) from dual;   --'B'
select chr(97) from dual;   --'a'
select chr(98) from dual;   --'b'
select '#' || chr(32) || '#' from dual; --���鹮��

select chr(43) from dual;   --'+'
select chr(45) from dual;   --'-'
select chr(42) from dual;   --'*'
select chr(47) from dual;   --'/'
//////////////////////////////////////////////



2.���� ���� �Լ�
select abs(-7) from dual;         --���밪
select mod(5,3) from dual;        --������ �Լ�
select ceil(12.4) from dual;      --�ø��Լ�
select trunc(13.56,1) from dual;  --�����Լ�

select avg(kor) from sungjuk;              --66.363636
select ceil(avg(kor)) from sungjuk;        --67
select trunc(avg(kor),2) from sungjuk;     --66.36
select round(avg(kor),2) from sungjuk;     --66.36
3.��¥ ���� �Լ�
--�ý����� ���� ��¥�� �ð� ������ �����ϴ� �Լ�
select sysdate from dual; 

--��¥�������� ����
select sysdate+100 from dual;  --���ó�¥+100��
select sysdate-100 from dual;  --���ó�¥-100��

--sysdate���� ����� �����ϱ�
select extract(year from sysdate) from dual;  --2023
select extract(month from sysdate) from dual;  --8
select extract(day from sysdate) from dual;  --22

--�ΰ��� ��¥�����Ϳ��� ���� �� ���
select months_between('2023-08-22', '2022-10-30') from dual; --9.7
select months_between('2023-08-22', '2023-12-31') from dual; -- -4.2
//////////////////////////////////////////////////////////////////////

4.����ȯ �Լ�

--TO_CHAR(���� ��¥, '���ϴ� ���')
--���ڿ� ��¥�� ���ڷ� ��ȯ�� �ִ� �ΰ��� ���

--
select to_char(sysdate, 'YYYY-MM-DD') from dual; --2023-08-22
select to_char(sysdate, 'MM/DD/YYYY') from dual; --08/22/2023
select to_char(sysdate, 'DD-Mon-YYYY') from dual; --22-8��-2023

select to_char(sysdate, 'YYYY') from dual; --'2023'
select to_char(sysdate, 'MM') from dual; --'08'
select to_char(sysdate, 'DD') from dual; --'22'

-- to_number('���������� ���ڿ�')
select to_number('123')+1 from dual;  -- 124
select '123'+1 from dual;             -- 124 ���������� to_number()�� ȣ���

--TO DATE('����', '��¥����')
--���ڿ��� ��¥������ ��ȯ
select to_date('2023-08-22') from dual;
select to_date('2023-08-22') - to_date('2023-05-30') from dual;