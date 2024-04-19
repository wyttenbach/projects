delete from sot15.pay_procedure_line_detail where ins_user = 'postPaymentExecution';
delete from sot15.pay_eob where ins_user = 'postPaymentExecution';
delete from sot15.pay_payment_file where ins_user = 'postPaymentExecution';
delete from sot15.pay_levy_file where ins_user = 'postPaymentExecution';
delete from sot15.pay_eft where ins_user = 'postPaymentExecution';
delete from sot15.pay_bank_reconciliation where ins_user = 'postPaymentExecution';
commit;

delete from sot15.pay_detail where ins_user = 'paymentGeneration';
delete from sot15.pay_claim where ins_user = 'paymentGeneration';
delete from sot15.pay_run where ins_user = 'paymentGeneration';
commit;

delete from sot15.pay_bulk where ins_user = 'paymentExecution';
delete from sot15.pay_exec where ins_user = 'paymentExecution';
commit;
