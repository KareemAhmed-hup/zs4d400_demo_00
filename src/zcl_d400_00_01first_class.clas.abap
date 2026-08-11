CLASS zcl_d400_00_01first_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA mv_demo_01 TYPE string VALUE '1234567ABC'.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_01first_class IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lv_demo_01 TYPE string VALUE '1234567'.

    DATA ls_demo_01 TYPE /dmo/carrier.

    ls_demo_01-client = 'Ali'.
    ls_demo_01-carrier_id = 'LH'.
    ls_demo_01-name = 'Lufthansa'.
    ls_demo_01-currency_code = 'EUR'.


    out->write( 'Test' ).

    out->write(
      EXPORTING

        data   = lv_demo_01
        name   = 'Meine Überschrift'

*      RECEIVING
*        output =
    ).
    out->write( cl_abap_char_utilities=>newline ).
    out->write(
          EXPORTING

            data   = ls_demo_01
            name   = 'Fluggesellschaften'

*      RECEIVING
*        output =
        ).

    out->write( '-------------------------------------' ).
    out->write( cl_abap_char_utilities=>newline ).
    out->write( 'demo'  ).

    mv_demo_01 = 'Banane'.


  ENDMETHOD.
ENDCLASS.
