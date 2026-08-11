CLASS zcl_d400_00_03compute DEFINITION PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS summe IMPORTING iv_value1 TYPE i
                            iv_value2 TYPE i
                            demo      TYPE i OPTIONAL
                  EXPORTING ev_result TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_00_03compute IMPLEMENTATION.



  METHOD summe.

    DATA lv_demo_01 TYPE i.   "Nicht möglich i -> p

*    DATA lr_demo TYPE REF TO data.
*    DATA lv_type TYPE string VALUE '/DMO/CARRIER'.
*    CREATE DATA lr_demo TYPE TABLE OF (lv_type).

    ev_result = iv_value1 + iv_value2.




  ENDMETHOD.

ENDCLASS.
