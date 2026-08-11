CLASS zcl_d400_00_09diverse_themen DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_09diverse_themen IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.




    DATA lt_carrier TYPE TABLE OF /dmo/carrier WITH NON-UNIQUE KEY carrier_id.


    DATA ls_carrier TYPE /dmo/carrier.

    SELECT carrier_id, name FROM /dmo/carrier INTO CORRESPONDING FIELDS OF TABLE @lt_carrier.       "Variante 1.


    SELECT FROM /dmo/carrier FIELDS * INTO TABLE @lt_carrier. "Variante 2.

    SELECT FROM /dmo/carrier FIELDS carrier_id, name  WHERE carrier_id = 'LH' APPENDING CORRESPONDING FIELDS OF TABLE
                              @lt_carrier.



    SELECT SINGLE FROM /dmo/carrier FIELDS * WHERE carrier_id = 'LH' INTO @ls_carrier .
    SELECT SINGLE FROM /dmo/carrier FIELDS * WHERE carrier_id = 'UA' INTO @ls_carrier .
    SELECT SINGLE FROM /dmo/carrier FIELDS * WHERE carrier_id = 'LH' INTO @ls_carrier .
    SELECT SINGLE FROM /dmo/carrier FIELDS * WHERE carrier_id = 'LH' INTO @ls_carrier .
    SELECT SINGLE FROM /dmo/carrier FIELDS * WHERE carrier_id = 'LH' INTO @ls_carrier .
    SELECT SINGLE FROM /dmo/carrier FIELDS * WHERE carrier_id = 'LH' INTO @ls_carrier .

    DO 10 TIMES.
      out->write( sy-index ).
    ENDDO.


  ENDMETHOD.





ENDCLASS.
