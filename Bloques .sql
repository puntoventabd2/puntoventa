-- Bloque Anonimo (Muestra la ubicacion de un producto buscado) --
DECLARE
Busqueda Producto.ubicacion%TYPE
BEGIN
SELECT ubicacion
INTO Busqueda
FROM Producto
END;

-- Bloque Anonimo (Cuanta los vendedores que hay en la tienda y sus nombres)--
DECLARE 
Conteo Number;
BEGIN
SELECT count (Vendedores), nombre_vendedor,
INTO Conteo
FROM Vendedor 
ORDER BY nombre_vendedor
DBMS_OUTPUT.PUT_LINE(Conteo);
END;
