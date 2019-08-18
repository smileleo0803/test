--產業分類重調
--Zip_code(看mapping率)

--IB_SB

--RB_SB

--法金資料Rev.NII.FEE
----各產品Rev（check產品code)
sel customer_id
,sum(case when L2_Prod_code in ('') then avg_balance else 0 end)/5 as "Bal_台幣存款"
,sum(case when L2_Prod_code in ('') then avg_balance else 0 end)/5 as "Bal_外幣存款"
,sum(case when L2_Prod_code in ('') then avg_balance else 0 end)/5 as "Bal_匯兌"
,sum(case when L2_Prod_code in ('') then avg_balance else 0 end)/5 as "Bal_其他Cash"
,sum(case when L1_Prod_code in ('P2') then avg_balance else 0 end)/5 as "Bal_Factoring"
,sum(case when L2_Prod_code in ('') then avg_balance else 0 end)/5 as "Bal_台幣放款"
,sum(case when L2_Prod_code in ('') then avg_balance else 0 end)/5 as "Bal_外幣放款"
,sum(case when L2_Prod_code in ('') then avg_balance else 0 end)/5 as "Bal_其他放款"
,sum(case when L1_Prod_code in ('P4') then avg_balance else 0 end)/5 as "Bal_Trade"
,sum(case when L1_Prod_code in ('P5') then avg_balance else 0 end)/5 as "Bal_OW"
,sum(case when L1_Prod_code in ('PA') then avg_balance else 0 end)/5 as "Bal_其他"
,sum(case when L1_Prod_code in ('PB') then avg_balance else 0 end)/5 as "Bal_成本"
,sum(case when L1_Prod_code in ('PD') then avg_balance else 0 end)/5 as "Bal_SA_Expense"
,sum(case when L1_Prod_code in ('PE') then avg_balance else 0 end)/5 as "Bal_轉介"
,sum(case when L1_Prod_code in ('Q1') then avg_balance else 0 end)/5 as "Bal_Bill-Finance"
,sum(case when L1_Prod_code in ('Q2') then avg_balance else 0 end)/5 as "Bal_Corporate_Finance"
,sum(case when L1_Prod_code in ('Q3') then avg_balance else 0 end)/5 as "Bal_金交"
,sum(case when L1_Prod_code in ('Q6') then avg_balance else 0 end)/5 as "Bal_法人信託部"
,sum(case when L1_Prod_code in ('QA') then avg_balance else 0 end)/5 as "Bal_Oversea"
from temp_corporate.cb_cpm_2019
where snapshot_yr_mth between '2019-01-01' and '2019-06-30'
group by customer_id

----Total (參閱法金單月積數、收益、成本＿group by Id ,wide)
-- 先 union 一個ID名單，再left join（一般來說時間一致可不用做union） 
sel customer_id
,sum(avg_balance) as avg_balance
,sum(Net_Int_Income) as Net_Int_Income
,sum(Net_Fee_Income) as Net_Fee_Income
,sum(Other_Income)


--個金資料
----Rev、Ｃost
select customer_id
,sum(zeroifnull(wm_nii)+ zeroifnull(wm_fee)) as wm_rev
,sum(zeroifnull(wm_nii)) as nii_rev
,sum(zeroifnull(wm_fee)) as fee_rev
,sum(zeroifnull(wm_oe)) as 
,sum(zeroifnull(wm_cr))
temp_retail.crm_wm_cpm_1906

--AUM
select customer_id
,sum()  nii_aum
,sum()  fee_aum
,sum()  ttl_aum
temp_bps.wm_assetsclass_1906

--LUM
vp_drv_model.drv_cust_lum_info_m


