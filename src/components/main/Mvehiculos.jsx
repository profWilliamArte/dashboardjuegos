import { useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import axios from 'axios';
import Button from 'react-bootstrap/Button';
import DataTable from 'react-data-table-component';
import Swal from 'sweetalert2'

const API='http://localhost:8081/vehiculos';


const Mvehiculos = () => {


  const [datos, setDatos] = useState([])
  const [search, setSearch]=useState('')
  const [filter, setFilter]=useState([])

  const getDatos = async () => {
    try {
      const response = await fetch(API);
      const data = await response.json();
      console.log(data)
      setDatos(data.vehiculos);
      setFilter(data.vehiculos)
    } catch (error) {
      console.error(error)
    }
  };
  useEffect(()=>{
    getDatos();
  },[]);


  // table
  const columns = [
    {
      name:"ID",
      selector:(row)=>row.id,
      sortable: true,
    },
    {
      name: "Marca",
      selector: (row) => row.marca,
      sortable: true,
    
    },
    {
      name: "Modelo",
      selector: (row) => row.modelo,
      sortable: true,
    
    },
    {
      name: "Año",
      selector: (row) => row.anio,
      sortable: true,
    },
    {
      name: "VIN",
      selector: (row) => row.vin,
      sortable: true,
    },


    {
      name: "Eliminar",
      cell: (row) => (
        <Button variant="danger" size="sm" onClick={() => handleEliminar(row.id)}>
          Eliminar
        </Button>
      ),
    },
    {
      name: "Actualizar",
      cell: (row) => (
        <Button variant="info" size="sm" onClick={() => handleActualizar(row.id)}>
          Actualizar
        </Button>
      ),
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

  // acciones
  const navigate = useNavigate()


  const handleActualizar=(item)=>{
    console.log('/ActualizarVehiculo/'+item)
    navigate('/ActualizarVehiculo/'+item)

  }



  const handleEliminar=(item)=>{

    Swal.fire({
      title: "Eliminar?",
      text: "Esta seguro de de Eliminar este producto.!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#d33",
      cancelButtonColor: "#3085d6",
      confirmButtonText: "Seguro desea eliminar"
    }).then((result) => {
      if (result.isConfirmed) {
        axios.delete(`http://localhost:8081/DeleteVehiculo/${item}`)
        .then(res => navigate('/Vehiculos'))
        .catch(err => console.log(err));
        Swal.fire({
          title: "Eliminado!",
          text: "El producto ha sido eliminado!!",
          icon: "success"
        });
      }
    });
  
    
  
  
  
  
  
  
  
  
  
  }
  



  return (

      <div className="container py-3">
        
        <div className="py-2 text-end"> 
          <Link to="/InsertarVehiculo"  className="btn btn-success btn-sm">Agregar</Link>
        </div>
        <DataTable 
          customStyles={encabezadoTabla}
          columns={columns}
          data={datos}
          pagination
          paginationComponentOptions={paginationComponentOptions}
          highlightOnHover
        
        />
      </div>
     
   

  )
}

export default Mvehiculos