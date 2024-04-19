delete from wh_task where task_payload_id = (select workflow_payload_id from wh_payload where CLIENT_PAYLOAD_ID = &&client_payload_id and CLIENT_PAYLOAD_TYPE = '&&client_payload_type');
delete from wh_payload where CLIENT_PAYLOAD_ID = &&client_payload_id and CLIENT_PAYLOAD_TYPE = '&&client_payload_type';
commit;
