CLASS lcl_connection DEFINITION CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS class_constructor.
    METHODS constructor
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id
        i_connection_id TYPE /dmo/connection_id.
*    METHODS constructor IMPORTING iv_carrid TYPE /dmo/carrier_id
*                                  iv_connid TYPE /dmo/connection_id.

    CLASS-DATA gv_demo_02 TYPE i VALUE 300.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_carrier_id TYPE /dmo/carrier_id.
    DATA mv_connection_id TYPE /dmo/connection_id.
    CLASS-DATA gv_demo_01 TYPE i VALUE 200.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD class_constructor.

    gv_demo_01 = 2000.


  ENDMETHOD.

  METHOD constructor.


    me->mv_carrier_id = i_carrier_id.
    me->mv_connection_id = i_connection_id.

  ENDMETHOD.

*  METHOD constructor.
*    mv_carrier_id = iv_carrid.
*    mv_connection_id = iv_connid.
*
*
*  ENDMETHOD.

ENDCLASS.





