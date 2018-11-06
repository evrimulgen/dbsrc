CREATE OR REPLACE EDITIONABLE TRIGGER "OE"."INSERT_ORD_LINE"
  BEFORE INSERT ON order_items
  FOR EACH ROW
  DECLARE
    new_line number;
  BEGIN
    SELECT (NVL(MAX(line_item_id),0)+1) INTO new_line
      FROM order_items
      WHERE order_id = :new.order_id;
    :new.line_item_id := new_line;
  END;
/

CREATE OR REPLACE EDITIONABLE TRIGGER "OE"."ORDERS_TRG" INSTEAD OF INSERT
 ON oc_orders FOR EACH ROW
BEGIN
   INSERT INTO ORDERS (order_id, order_mode, order_total,
                       sales_rep_id, order_status)
               VALUES (:NEW.order_id, :NEW.order_mode,
                       :NEW.order_total, :NEW.sales_rep_id,
                       :NEW.order_status);
END;
/

CREATE OR REPLACE EDITIONABLE TRIGGER "OE"."ORDERS_ITEMS_TRG" INSTEAD OF INSERT ON NESTED
 TABLE order_item_list OF oc_orders FOR EACH ROW
DECLARE
    prod  product_information_typ;
BEGIN
    SELECT DEREF(:NEW.product_ref) INTO prod FROM DUAL;
    INSERT INTO order_items VALUES (prod.product_id, :NEW.order_id,
                                    :NEW.line_item_id, :NEW.unit_price,
                                    :NEW.quantity);
END;
/

