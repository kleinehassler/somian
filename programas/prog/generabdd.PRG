-- BORRAR LOS ANULADOS DIFENRENTES DE FACTURAS Y NOTAS DE VENTAS
delete from asientosmov where idasiento in (select idasiento from asientosdia where code in (select code from vdocusmall where isanulado and nomdoc not like '%FACTURA%' and nomdoc not like '%NOTA DE V%')) ;

delete from asientosdia where code in (select code from vdocusmall where isanulado and nomdoc not like '%FACTURA%' and nomdoc not like '%NOTA DE V%');

delete from detadoci where code in (select code from vdocusmall where isanulado and nomdoc not like '%FACTURA%' and nomdoc not like '%NOTA DE V%');

delete from detadocb where code in (select code from vdocusmall where isanulado and nomdoc not like '%FACTURA%' and nomdoc not like '%NOTA DE V%');

delete from detadocd where code in (select code from vdocusmall where isanulado and nomdoc not like '%FACTURA%' and nomdoc not like '%NOTA DE V%');

delete from detadocl where code in (select code from vdocusmall where isanulado and nomdoc not like '%FACTURA%' and nomdoc not like '%NOTA DE V%');

delete from detadocr where code in (select code from vdocusmall where isanulado and nomdoc not like '%FACTURA%' and nomdoc not like '%NOTA DE V%');

delete from cobros where code in (select code from vdocusmall where isanulado and nomdoc not like '%FACTURA%' and nomdoc not like '%NOTA DE V%');

delete from cheques where code in (select code from vdocusmall where isanulado and nomdoc not like '%FACTURA%' and nomdoc not like '%NOTA DE V%');

delete from documents where code in (select code from vdocusmall where isanulado and nomdoc not like '%FACTURA%' and nomdoc not like '%NOTA DE V%');

-- SOLO DEJAR LOS DOCUMENTOS DE JUNIO Y JULIO

delete from asientosmov where idasiento in (select idasiento from asientosdia where code in (select code from vdocusmall where extract(month from fecha)<=5 )) ;

delete from asientosdia where code in (select code from vdocusmall where extract(month from fecha)<=5);

delete from detadoci where code in (select code from vdocusmall where extract(month from fecha)<=5);

delete from detadocb where code in (select code from vdocusmall where extract(month from fecha)<=5);

delete from detadocd where code in (select code from vdocusmall where extract(month from fecha)<=5);

delete from detadocl where code in (select code from vdocusmall where extract(month from fecha)<=5);

delete from detadocr where code in (select code from vdocusmall where extract(month from fecha)<=5);

delete from cobros where code in (select code from vdocusmall where extract(month from fecha)<=5);

delete from cheques where code in (select code from vdocusmall where extract(month from fecha)<=5);

delete from documents where extract(month from fecha)<=5;

-- borrar todos, dejar listo para iniciar

truncate asientosmov ;

truncate asientosdia;

truncate detadoci;

truncate detadocb;

truncate detadocd ;

truncate detadocl ;

truncate detadocr ;

truncate cobros ;

truncate cheques ;

truncate documents ;