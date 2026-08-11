CLASS zcl_d400_00_18select_1 DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_d400_00_18select_1 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "S4D400 Seite 201.

    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id TYPE /dmo/airport_to_id.



    "Old SQL -> Open SQL
    SELECT SINGLE airport_from_id, airport_to_id FROM /dmo/connection WHERE carrier_id = 'LH' AND connection_id = '0400'
               INTO ( @airport_from_id, @airport_to_id  ).

    "New SQL -> ABAP SQL
    SELECT SINGLE FROM /dmo/connection FIELDS airport_from_id, airport_to_id
           WHERE carrier_id = 'LH' AND connection_id = '0400'
              INTO ( @airport_from_id, @airport_to_id     ).
    IF sy-subrc = 0.
      out->write( |Datensatz wurde gefunden:  { airport_from_id }  { airport_to_id }   | ).

    ELSE.
      out->write( 'Datensatz wurde nicht gefunden!' ).

    ENDIF.



*    out->write( |Airport from ID:  { airport_from_id  }     Airport to ID: { airport_to_id } | ).





  ENDMETHOD.

ENDCLASS.


