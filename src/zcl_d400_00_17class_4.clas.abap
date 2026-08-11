CLASS zcl_d400_00_17class_4 DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_d400_00_17class_4 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.



    DATA birne TYPE i VALUE 400.
    birne = birne + 600.


    lcl_connection=>gv_demo_02 = 2000.
    birne = birne + 600.


    DATA(lo_connection) = NEW lcl_connection(
      i_carrier_id    = 'LH'
      i_connection_id = '0400' ).

*      lo_connection->constructor(         "Fehler
*      i_carrier_id    = 'AA'
*      i_connection_id = '0402' ).


    DATA(lo_connection1) = NEW lcl_connection(
      i_carrier_id    = 'AA'
      i_connection_id = '0017' ).





*    DATA(lo_connection) = NEW lcl_connection(
*                               iv_carrid = 'LH'
*                               iv_connid =  '0400' ).








  ENDMETHOD.

ENDCLASS.


