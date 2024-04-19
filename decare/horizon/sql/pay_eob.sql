SELECT
    eob_destination, eob_instruction, COUNT(*)
FROM
    sot23.pay_eob
group by eob_destination, eob_instruction
order by eob_destination, eob_instruction;

desc sot23.pay_eob;

select column_name, data_type, column_id
from all_tab_columns 
where owner='SOT23'
and table_name = 'PAY_EOB'
order by column_name;