INTERFACE zif_flight_manager_05
  PUBLIC .

  "--- Estructura de vuelo compartida ---
  TYPES: BEGIN OF ty_vuelo,
           aerolinea  TYPE c LENGTH 2,
           num_vuelo  TYPE n LENGTH 4,
           origen     TYPE c LENGTH 3,
           destino    TYPE c LENGTH 3,
           precio     TYPE p LENGTH 8 DECIMALS 2,
           plazas     TYPE i,
         END OF ty_vuelo.

  TYPES: ty_t_vuelos TYPE STANDARD TABLE OF ty_vuelo WITH KEY aerolinea num_vuelo.

  METHODS add_flight
    IMPORTING
      is_vuelo TYPE ty_vuelo
    RAISING
      zcx_flight_error_05.


  METHODS get_flights_by_airline
    IMPORTING
      iv_aerolinea  TYPE c
    RETURNING
      VALUE(rt_vuelos) TYPE ty_t_vuelos.


  METHODS get_cheapest_flight
    RETURNING
      VALUE(rs_vuelo) TYPE ty_vuelo
    RAISING
      zcx_flight_error_05.



  METHODS get_total_revenue
  RETURNING
    VALUE(rv_total) TYPE decfloat16.


ENDINTERFACE.
