CLASS zcl_d400_00_30eml DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    TYPES ty_demo_1 TYPE TABLE OF string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_30eml IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "S4D400 Seite 310.
    "Daten lesen
    DATA input_keys TYPE TABLE FOR READ IMPORT /DMO/I_AgencyTP.
    DATA result_tab TYPE TABLE FOR READ RESULT /DMO/I_AgencyTP.

    input_keys = VALUE #( ( AgencyID = '070050' ) ).


    READ ENTITIES OF /DMO/I_AgencyTP ENTITY /DMO/Agency
       ALL FIELDS WITH input_keys
          RESULT result_tab.

    out->write( result_tab ).

****************************************************************
    "Daten ändern
    DATA update_tab TYPE TABLE FOR UPDATE /DMO/I_AgencyTP.

    update_tab = VALUE #( ( AgencyID = '070051' Name = 'Demo for Update 3' ) ).

    MODIFY ENTITIES OF /DMO/I_AgencyTP ENTITY /DMO/Agency
        UPDATE FIELDS ( Name ) WITH update_tab
        FAILED DATA(failed).


    COMMIT ENTITIES.


  ENDMETHOD.

ENDCLASS.
