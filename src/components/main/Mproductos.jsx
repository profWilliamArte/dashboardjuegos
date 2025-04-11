import { useState, useEffect } from "react";
import DataTable, { createTheme } from 'react-data-table-component';
const API='https://dummyjson.com/products?limit=100';
const Mproductos = () => {


  const [datos, setDatos] = useState([])
  const [search, setSearch]=useState('')
  const [filter, setFilter]=useState([])

  const getDatos = async () => {
    try {
      const response = await fetch(API);
      const data = await response.json();
      //console.log(data)
      setDatos(data.products);
      setFilter(data.products)
    } catch (error) {
      console.error(error)
    }
  };
  useEffect(()=>{
    getDatos();
  },[]);

  //para filtrar
  useEffect(()=>{
    const result=datos.filter((item)=>{
      const titleMatch = item.title.toLowerCase().includes(search.toLowerCase());
      const categoryMatch = item.category.toLowerCase().includes(search.toLowerCase());
      return titleMatch || categoryMatch;
    })
    setFilter(result)
  },[search])

  const columns = [
    {
      name:"ID",
      selector:(row)=>row.id,
    },
    {
      name: "Img",
      selector: (row) =><img height={70} width={80}  src={row.thumbnail}/>,
    },
    {
      name: "Categoria",
      selector: (row) => row.category,
      sortable: true,
    },
    {
      name: "Nombre",
      selector: (row) => row.title,
      sortable: true,
    },
    {
      name: "Stock",
      selector: (row) => row.stock,
    },
    {
      name: "Precio",
      selector: (row) => row.price,
    },
    {
      name: "Rating",
      selector: (row) => row.rating,
    }
    
  ];
  const encabezadoTabla={
    headCells:{
      style:{
        fontWeight:"bold",
        fontSize:"14px",
        backgroundColor:"#2c3e50",
        color:"#ccc"
      },
    },
  }
  const paginationComponentOptions = {
    rowsPerPageText: 'Filas por página',
    rangeSeparatorText: 'de',
    selectAllRowsItem: true,
    selectAllRowsItemText: 'Todos',
  };


  const exportToCSV = () => {
    const csvData = datos.map((item) => ({
      ID: item.id,
      Img: item.thumbnail,
      Categoria: item.category,
      Nombre: item.title,
      Stock: item.stock,
      Precio: item.price,
      Rating: item.rating,
    }));

    const csvColumns = columns.map((column) => column.name);

    const csvContent = [
      csvColumns.join(","),
      ...csvData.map((item) => csvColumns.map((column) => item[column]).join(","))
    ].join("\n");

    const blob = new Blob([csvContent], { type: "text/csv;charset=utf-8;" });
    const link = document.createElement("a");
    if (link.download !== undefined) {
      const url = URL.createObjectURL(blob);
      link.setAttribute("href", url);
      link.setAttribute("download", "data.csv");
      link.style.visibility = "hidden";
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    }
  };

 

  return (

      <div className="">
        <button onClick={exportToCSV} className="btn btn-info my-2">Exportar a CSV</button>
     
        <DataTable 
          customStyles={encabezadoTabla}
          columns={columns}
          data={filter}
          pagination
          fixedHeader
          paginationComponentOptions={paginationComponentOptions}
          highlightOnHover
          subHeader
          subHeaderComponent={
            <input type="text" 
              className="w-25 form-control"
              placeholder="Buscar...."
              value={ search }
              onChange={(e)=>setSearch(e.target.value)}
              />
          }
        />
      </div>
     
   

  )
}

export default Mproductos