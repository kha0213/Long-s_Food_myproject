SELECT * FROM AD;
SELECT * FROM GRADES;
SELECT * FROM DELIVERY;
SELECT * FROM PRODUCT;
SELECT * FROM MEMBER;
select * from member m, grades g where m.mcumulative_buy between g.lowgrade and g.highgrade; 

SELECT * FROM ORDERS;
SELECT * FROM CUSTOMER_SERVICE;
SELECT * FROM ORDER_DETAIL;
SELECT * FROM REVIEW;
SELECT * FROM MANAGER;
SELECT * FROM MEMBER M, GRADES G WHERE M.MCUMULATIVE_BUY BETWEEN G.LOWGRADE AND G.HIGHGRADE AND MID='aaa';
SELECT GF.GNAME FROM GRADES GF WHERE GNO = (SELECT G.GNO+1 FROM MEMBER M, GRADES G WHERE M.MCUMULATIVE_BUY BETWEEN G.LOWGRADE AND G.HIGHGRADE AND M.MID='aaa');
--로그인 시 MID,MPW로 DTO가져오기
SELECT M.*,a.ad_email,a.ad_phone,a.ad_call,g.* FROM MEMBER M,AD A,GRADES G WHERE M.MID=A.MID AND m.mcumulative_buy between g.lowgrade and g.highgrade AND M.MID='aaa' AND MPW='11';

SELECT * FROM MANAGER WHERE MGID='' AND MGPW='';
SELECT * FROM MANAGER WHERE MGID='1';

SELECT COUNT(*) FROM PRODUCT;
-- product 정렬 top-n

SELECT * FROM PRODUCT ORDER BY preview_count DESC;

SELECT * FROM PRODUCT ORDER BY PREGIST DESC, preview_count DESC;

SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT P.*,M.MGNAME FROM PRODUCT P,MANAGER M WHERE P.MGID = M.MGID ORDER BY PPRICE, preview_count DESC) A)
 WHERE RN BETWEEN 5 AND 10;

SELECT * FROM (SELECT ROWNUM RN,C.* FROM (SELECT CS.*,M.MNAME FROM CUSTOMER_SERVICE CS, MEMBER M WHERE CS.MID=M.MID ORDER BY CGROUP DESC,CGROUP_OUTNUM) C)
    WHERE RN BETWEEN 5 AND 10;
    
SELECT CS.*,M.MNAME FROM customer_service CS, MEMBER M WHERE CNO='1';

SELECT M.*,ONO FROM MEMBER M, ORDERS O WHERE M.MID=O.MID AND M.MID='aaa';
SELECT * FROM ORDERS;

INSERT INTO ORDERS VALUES(ONO_SEQ.NEXTVAL,SYSDATE,NULL,1,'aaa');
SELECT MAX(ONO) FROM ORDERS;
SELECT * FROM DELIVERY;
INSERT INTO DELIVERY (DNO,DPRICE,DCOMPANY,parrive_date) VALUES('WWW',2500,'한진',NULL);


SELECT O.* FROM MEMBER M, ORDERS O WHERE M.MID=O.MID AND M.MID='aaa';
--주문한 적 있는 상품인지 보기 (이주일 안에)
SELECT * FROM MEMBER M,ORDERS O,order_detail OD WHERE M.MID=O.MID AND O.ONO=OD.ONO AND O.ODATE BETWEEN SYSDATE-14 AND SYSDATE AND PCODE='testPcode2';


SELECT * FROM REVIEW R,MEMBER M WHERE R.MID=M.MID;

UPDATE MEMBER SET MSTATUS=0 WHERE MID='aaa';
COMMIT;
SELECT MAX(ONO) FROM ORDERS;
SELECT MAX(DNO) FROM delivery;
SELECT * FROM delivery;
-- 다음 등급보기
SELECT g.highgrade-m.mcumulative_buy MONEY,(SELECT GNAME FROM GRADES WHERE GNO=G.GNO+1) GRADE FROM MEMBER M,GRADES G WHERE M.GNO=G.GNO AND MID='aaa';


--리뷰 페이징
SELECT * FROM (SELECT ROWNUM RN,A.* FROM (SELECT R.*,P.PNAME FROM REVIEW R,PRODUCT P WHERE R.PCODE=P.PCODE ORDER BY ODATE DESC) A) WHERE RN BETWEEN 6 AND 10;