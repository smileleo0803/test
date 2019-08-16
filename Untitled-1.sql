--IB_SB_PPT
Select *
,case when length(trim(customer_id))= 8 and (substr(customer_id,1,1) >= '0' and substr(customer_id,1,1) <= 9 ) then 'DBU'
else 'OBU及自然人' end as "ID_Type"

,case when td.id is null then 'N'
else 'Y' end as "trade_flag"

,Case when substr(industry_desc,1,2) in ('01','02','03') then 'A.農、林、漁、牧業'
when substr(industry_desc,1,2) in ('05','06') then 'B.礦業及土石採取業'
when substr(industry_desc,1,2) >= '08' and substr(industry_desc,1,2) <= '34' then 'C.製造業'
when substr(industry_desc,1,2) in ('35') then 'D.電力及燃氣供應業'
when substr(industry_desc,1,2) in ('36','37','38','39') then 'E.用水供應及污染整治業'
when substr(industry_desc,1,2) in ('41','42','43') then 'F.營建工程業'
when substr(industry_desc,1,2) in ('45','46','47','48') then 'G.批發及零售業'
when substr(industry_desc,1,2) in ('49','50','51','52','53','54') then 'H.運輸及倉儲業'
when substr(industry_desc,1,2) in ('55','56') then 'I.住宿及餐飲業'
when substr(industry_desc,1,2) >= '58' and substr(industry_desc,1,2) <= '63' then 'J.出版、影音製作、傳播及資通
訊服務業'
when substr(industry_desc,1,2) >= '64' and substr(industry_desc,1,2) <= '66' then 'K.金融及保險業'
when substr(industry_desc,1,2) in ('67','68') then 'L.不動產業'
when substr(industry_desc,1,2) >= '69' and substr(industry_desc,1,2) <= '76' then 'M.專業、科學及技術服務業'
when substr(industry_desc,1,2) >= '77' and substr(industry_desc,1,2) <= '82' then 'N.支援服務業'
when substr(industry_desc,1,2) in ('83','84') then 'O.公共行政及國防；強制性社會
安全'
when substr(industry_desc,1,2) = '85' then 'P.教育業'
when substr(industry_desc,1,2) >= '86' and substr(industry_desc,1,2) <= '88' then 'Q.醫療保健及社會工作服務業'
when substr(industry_desc,1,2) >= '90' and substr(industry_desc,1,2) <= '93' then 'R.藝術、娛樂及休閒服務業 '
when substr(industry_desc,1,2) >= '94' and substr(industry_desc,1,2) <= '96' then 'S.其他服務業'
else '' end as "industry_type"

,case when industry_type in ('A.農、林、漁、牧業' , 'B.礦業及土石採取業','D.電力及燃氣供應業','E.用水供應及污染整治業') then '其他'
else industry_type end as "industry_type2"

From temp_analysis.Z35615_IB_SB sb
Left join (select id from temp_analysis.Z44_Trade ) td
On sb.customer_id = td.id

--Product、REV、COST
sel customer_id
,L1_Prod_code
,L1_Prod_chi
,L2_Prod_code
,L2_Prod_chi
sum()

--windows function
select id
,product_id 
,score
,avg(score) over() as avg_score
,avg(score) over(partition by id)

--行列轉換
select customer_id 
,max(case when L2_Prod_code = '' then Rev end) as "Rev" 
,max(case when L2_Prod_code = '' then Rev end) as "Rev" 
,max(case when L2_Prod_code = '' then Rev end) as "Rev" 
,max(case when L2_Prod_code = '' then Rev end) as "Rev" 
,max(case when L2_Prod_code = '' then Rev end) as "Rev" 
,max(case when L2_Prod_code = '' then Rev end) as "Rev" 



--