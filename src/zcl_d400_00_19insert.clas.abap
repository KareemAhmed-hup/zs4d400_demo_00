CLASS zcl_d400_00_19insert DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_d400_00_19insert IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "S4D400 Seite 197 DML

    DATA ls_z00_demo_01 TYPE z00_demo_01.
    ls_z00_demo_01-customer_id = '000001'.
    ls_z00_demo_01-first_name = 'Vorname-1'.
    ls_z00_demo_01-name = 'Name-1'.
    ls_z00_demo_01-postal_code = '80939'.
    ls_z00_demo_01-city = 'München'.
    INSERT INTO z00_demo_01 VALUES @ls_z00_demo_01.

    ls_z00_demo_01-customer_id = '000002'.
    ls_z00_demo_01-first_name = 'Vorname-2'.
    ls_z00_demo_01-name = 'Name-2'.
    ls_z00_demo_01-postal_code = '80939'.
    ls_z00_demo_01-city = 'München'.
    INSERT INTO z00_demo_01 VALUES @ls_z00_demo_01.

    ls_z00_demo_01-customer_id = '000003'.
    ls_z00_demo_01-first_name = 'Vorname-3'.
    ls_z00_demo_01-name = 'Name-3'.
    ls_z00_demo_01-postal_code = '10939'.
    ls_z00_demo_01-city = 'Berlin'.
    INSERT INTO z00_demo_01 VALUES @ls_z00_demo_01.

    ls_z00_demo_01-customer_id = '000004'.
    ls_z00_demo_01-first_name = 'Vorname-4'.
    ls_z00_demo_01-name = 'Name-4'.
    ls_z00_demo_01-postal_code = '10939'.
    ls_z00_demo_01-city = 'Berlin'.
    INSERT INTO z00_demo_01 VALUES @ls_z00_demo_01.


    ls_z00_demo_01-customer_id = '000005'.
    ls_z00_demo_01-first_name = 'Vorname-5'.
    ls_z00_demo_01-name = 'Name-5'.
    ls_z00_demo_01-postal_code = '10939'.
    ls_z00_demo_01-city = 'Berlin'.
    INSERT INTO z00_demo_01 VALUES @ls_z00_demo_01.


    ls_z00_demo_01-customer_id = '000006'.
    ls_z00_demo_01-first_name = 'Vorname-6'.
    ls_z00_demo_01-name = 'Name-6'.
    ls_z00_demo_01-postal_code = '10937'.
    ls_z00_demo_01-city = 'Berlin'.
    INSERT INTO z00_demo_01 VALUES @ls_z00_demo_01.





  ENDMETHOD.

ENDCLASS.


