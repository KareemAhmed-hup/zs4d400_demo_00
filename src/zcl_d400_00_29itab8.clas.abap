CLASS zcl_d400_00_29itab8 DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    TYPES ty_demo_1 TYPE TABLE OF string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_29itab8 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "S4D400 Seite 279.

    SELECT FROM /dmo/i_carrier FIELDS 'Airline' AS type, AirlineID AS id, Name
           WHERE CurrencyCode = 'GBP'

    UNION ALL
    SELECT FROM /DMO/I_Airport FIELDS 'Airport' AS type, AirportID AS id, Name
           WHERE City = 'London'

     INTO TABLE @DATA(lt_rsult).



    out->write( lt_rsult ).



*    loop at itab1  1000
*    loop at itab2  20
*    loop at itab3  30
*    loop at itab4  60
*
*
*    endloop
*    endloop
*    endloop
*    endloop

  ENDMETHOD.

ENDCLASS.
