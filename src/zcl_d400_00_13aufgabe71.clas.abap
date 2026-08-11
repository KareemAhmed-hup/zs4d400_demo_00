CLASS zcl_d400_00_13aufgabe71 DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_13aufgabe71 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "Lösung 1 Interne Tabelle
    DATA BEGIN OF gs_carrier.
    DATA carrier_id TYPE /dmo/carrier-carrier_id.
    DATA name TYPE /dmo/carrier-name.
    DATA currency_code TYPE /dmo/carrier-currency_code.
    DATA sales_volume TYPE /dmo/flight_price.
    DATA END OF gs_carrier.
    DATA gt_carrier LIKE TABLE OF gs_carrier.

    DATA lv_price TYPE /dmo/booking-flight_price.

    SELECT FROM /dmo/carrier FIELDS * INTO CORRESPONDING FIELDS OF
         TABLE @gt_carrier.

    SORT gt_carrier BY carrier_id.
    LOOP AT gt_carrier INTO gs_carrier.
      SELECT FROM /dmo/booking FIELDS flight_price WHERE carrier_id = @gs_carrier-carrier_id
                 INTO @lv_price.
        gs_carrier-sales_volume =  gs_carrier-sales_volume + lv_price.   "Variante 1
*        gs_carrier-sales_volume += lv_price.                            "VAriante 2

      ENDSELECT.
      MODIFY gt_carrier FROM gs_carrier TRANSPORTING sales_volume.
    ENDLOOP.
    out->write( gt_carrier ).


















  ENDMETHOD.

ENDCLASS.
