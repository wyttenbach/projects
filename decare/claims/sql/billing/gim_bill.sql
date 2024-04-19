select * from &&sot..gim_bill
where ins_date > trunc(sysdate - 365 * &&years)
