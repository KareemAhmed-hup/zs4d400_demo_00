CLASS zcl_00_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_eml IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA agencies_upd TYPE TABLE FOR UPDATE /DMO/I_AgencyTP.
    agencies_upd = VALUE #( ( AgencyID = '070080' Name = 'Change Group 00'  )   ).
    MODIFY ENTITIES OF /DMO/I_AgencyTP ENTITY /DMO/Agency
        UPDATE FIELDS ( Name ) WITH agencies_upd
           MAPPED DATA(mapped)
           REPORTED DATA(reported)
           FAILED  DATA(failed).


    COMMIT ENTITIES.

    out->write( 'Daten wurden gespeichert!' ).




  ENDMETHOD.
ENDCLASS.
