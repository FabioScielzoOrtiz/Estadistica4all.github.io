select 
	-- Campos de agrupacion
	t1_venta.codempre
	,t1_venta.fecventa
    ,t2_uneco.CODDIVIS
    ,t3_division.DESDIVIS
	-- Principales KPIs de la venta
	,sum(impventa) as VL_S_IMPVENTA
    ,count(distinct codtaven) as VL_C_TALONES
from
	[Ventas].[CV_FACT_VENTA_DETALLE_TALON_ARTICULO] t1_venta
	-- Informacion de mercancias 
	left join [Maestras].[CV_DIM_UNECO_NOSAP] t2_uneco
		on t1_venta.CUNECOOM = t2_uneco.CMDEPART
	left join [Maestras].[CV_DIM_DIVISION_HOST_NOSAP] t3_division
		on t2_uneco.CODDIVIS = t3_division.coddivis

where 
	-- se descartan operaciones ficticias
	(CTIPUNEC in ('2') or CODIGTPV not in ('9992', '9993')) 
	and t1_venta.codempre = '001'
	-- Venta actividad
	and t1_venta.codiregg in ('01', '02', '04', '05')
	and t1_venta.fecventa between '06-06-21' and '08-06-21'
group by 
	t1_venta.codempre
	,t1_venta.fecventa
    ,t2_uneco.CODDIVIS
    ,t3_division.DESDIVIS
		
order by
	t1_venta.codempre
	,t1_venta.fecventa
    ,t2_uneco.CODDIVIS
    ,t3_division.DESDIVIS