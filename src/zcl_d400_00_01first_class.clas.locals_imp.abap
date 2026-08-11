CLASS lcl_compute DEFINITION CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS get_sum IMPORTING iv_value1        TYPE i
                              iv_value2        TYPE i
                    RETURNING VALUE(rv_result) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_compute IMPLEMENTATION.

  METHOD get_sum.

    rv_result = iv_value1  + iv_value2.

  ENDMETHOD.

ENDCLASS.

