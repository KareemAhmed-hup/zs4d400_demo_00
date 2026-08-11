CLASS lcl_demo_01 DEFINITION CREATE PUBLIC.
*S4D400 Seite 136.
  PUBLIC SECTION.

    DATA mv_value2 TYPE i VALUE 200.
    CLASS-DATA gv_value3 TYPE i VALUE 300.
    CLASS-DATA gv_value4 TYPE i VALUE 400.
    CLASS-METHODS class_constructor.
    CLASS-METHODS demo.
    METHODS demo_1.
    DATA mv_value3 TYPE i VALUE 200 READ-ONLY.
    DATA mv_value1 TYPE i VALUE 100.
  PROTECTED SECTION.
    DATA mv_value5 TYPE i VALUE 500.
  PRIVATE SECTION.
    DATA mv_value4 TYPE i VALUE 300.

ENDCLASS.

CLASS lcl_demo_01 IMPLEMENTATION.

  METHOD class_constructor.

  ENDMETHOD.

  METHOD demo.
*       mv_value1 = 100. "Fehler
*       mv_value2 = 100. "Fehler
    gv_value3 = 100.
    gv_value4 = 100.

  ENDMETHOD.


  METHOD demo_1.
    mv_value3 = 700.
    mv_value4 = 100.
  ENDMETHOD.

ENDCLASS.


CLASS lcl_demo_02 DEFINITION INHERITING FROM lcl_demo_01.

  PUBLIC SECTION.
    METHODS demo_2.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_demo_02 IMPLEMENTATION.

  METHOD demo_2.
    mv_value5 = 5000.
  ENDMETHOD.

ENDCLASS.





