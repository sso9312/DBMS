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

2.���� ���� �Լ�

3.��¥ ���� �Լ�

4.����ȯ �Լ�
