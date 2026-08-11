CLASS zcl_d400_00_23joins DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_d400_00_23joins IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "S4D400 Seite 250.


    SELECT SINGLE FROM /dmo/connection
           LEFT OUTER JOIN /dmo/airport AS a
              ON /dmo/connection~airport_from_id = a~airport_id
           LEFT OUTER JOIN /dmo/airport AS b
              ON /dmo/connection~airport_to_id = b~airport_id
         FIELDS
         /dmo/connection~carrier_id,
         /dmo/connection~connection_id,
         /dmo/connection~airport_from_id,
         /dmo/connection~airport_to_id,
         a~name AS airport_from_name,
         b~name AS airport_to_name
          WHERE
           /dmo/connection~carrier_id = 'LH' AND
           /dmo/connection~connection_id = '0400'
           INTO @DATA(ls_result).


    out->write( ls_result ).


  ENDMETHOD.

ENDCLASS.


