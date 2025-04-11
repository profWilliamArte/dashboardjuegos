import { useState, useEffect, useRef } from 'react';

import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';
import { Button } from 'primereact/button';
import { Dropdown } from 'primereact/dropdown';
import { InputText } from 'primereact/inputtext';
import { Dialog } from 'primereact/dialog'; // Importar el componente Dialog
import { ConfirmDialog, confirmDialog } from 'primereact/confirmdialog'; // Diálogo de confirmación

import { Toast } from 'primereact/toast';
import { formatCurrency, formatDate } from '../util/formatUtils';
import { FileUpload } from 'primereact/fileupload';
const API_JUEGOS = 'https://api.arsistemaweb.com/juegos/api/juegos';
const API_ESTATUS = 'https://api.arsistemaweb.com/juegos/api/estatus';
const API_GENEROS = 'https://api.arsistemaweb.com/juegos/api/generos';
const Juegos = () => {
  const [juegos, setJuegos] = useState([]); // Lista de juegos
  const [generos, setGeneros] = useState([]); // Lista de juegos
  const [estados, setEstados] = useState([]); // Lista de estados disponibles
  const [visible, setVisible] = useState(false); // Controla la visibilidad del diálogo
  const [selectedJuego, setSelectedJuego] = useState(null); // Almacena el juego seleccionado
  const [editMode, setEditMode] = useState(false); // Indica si estamos editando o creando un juego
  const [filter, setFilter] = useState(''); // Estado para el filtro de búsqueda
  const toast = useRef(null);
  const [juego, setJuego] = useState(
    {
      idjuego: null,
      idestatus: null,
      idgenero: null,
      nombre: '',
      descripcion: '',
      precio: null,
      fechapublicacion: null,
      genero: '',
      valoracion: null
    }
  ); // Datos del juego actual



  const fetchJuegos = async () => {
    try {
      const response = await fetch(`${API_JUEGOS}/get/`);
      if (!response.ok) throw new Error('Error al cargar juegos');
      const data = await response.json();
      setJuegos(data);
    } catch (error) {
      console.error('Error al cargar Juegos:', error);
    }
  };
  const fetchGeneros = async () => {
    try {
      const response = await fetch(`${API_GENEROS}/get/`);
      if (!response.ok) throw new Error('Error al cargar géneros');
      const data = await response.json();
      setGeneros(data);
    } catch (error) {
      console.error('Error al cargar géneros:', error);
    }
  };

  const fetchEstados = async () => {
    try {
      const response = await fetch(`${API_ESTATUS}/get/`);
      if (!response.ok) throw new Error('Error al cargar estados');
      const data = await response.json();
      setEstados(data);
    } catch (error) {
      console.error('Error al cargar estados:', error);
    }
  };
  useEffect(() => {
    fetchJuegos();
    fetchGeneros();
    fetchEstados();
  }, []);
  // Filtrar juegos según el filtro
  const filteredJuegos = juegos.filter((juegos) =>
    juegos.nombre.toLowerCase().includes(filter.toLowerCase()) ||
    juegos.genero.toLowerCase().includes(filter.toLowerCase()) ||
    juegos.descripcion.toLowerCase().includes(filter.toLowerCase())
  );

  // Función para cerrar el diálogo
  const onHideDialog = () => {
    setVisible(false); // Oculta el diálogo
    setSelectedJuego(null); // Limpia el juego seleccionado
  };
  const actionBodyTemplate = (rowData) => {
    return (
      <div>
        <Button
          icon="pi pi-pencil"
          className="p-button-rounded p-button-success mr-2"
          onClick={() => editJuego(rowData)} // Abre el diálogo de edición
        />
        <Button
          icon="pi pi-trash"
          className="p-button-rounded p-button-danger"
          onClick={() => deleteJuego(rowData.idjuego)} // Abre el diálogo de confirmación
        />
        <Button
          icon="pi pi-eye"
          className="p-button-rounded p-button-info ml-2"
          onClick={() => setSelectedJuego(rowData)} // Selecciona el juego y abre el diálogo
        />
      </div>
    );
  };
  const editJuego = (rowData) => {
    setJuego({ ...rowData }); // Carga los datos del juego en el formulario
    setEditMode(true); // Modo de edición
    setVisible(true); // Muestra el diálogo
  };
  const hideDialog = () => {
    setVisible(false); // Oculta el diálogo
  };

  const openNew = () => {
    setJuego({
      idjuego: null,
      idestatus: null,
      idgenero: null,
      nombre: '',
      descripcion: '',
      fechapublicacion: null,
      precio: null,
      valoracion: null,
      imagen: '',
    }); // Reinicia el formulario
    setEditMode(false); // Modo de creación
    setVisible(true); // Muestra el diálogo
  };


  const saveJuego = async () => {
    try {
      // Validar campos obligatorios
      if (!validateFields()) {
        return;
      }
  
      // Preparar los datos para enviar
      const formData = prepareFormData();

      // Obtener la URL y el método
      const { url, method } = getEndpointAndMethod();
  


      console.log("Datos enviados al servidor:");
      for (const [key, value] of formData.entries()) {
        console.log(`${key}: ${value}`);
      }
  
      // Realizar la solicitud HTTP
      const response = await fetch(url, {
        method: method,
        body: formData,
        
      });
  
      // Verificar si la respuesta fue exitosa
      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || 'Error al guardar juego');
      }
  
      // Procesar la respuesta exitosa
      const responseBody = await response.json();
      console.log('Respuesta:', responseBody);
  
      // Mostrar mensaje de éxito
      toast.current.show({
        severity: 'success',
        summary: 'Éxito',
        detail: editMode ? 'Juego actualizado' : 'Juego creado',
      });
  
      // Actualizar la lista de juegos y cerrar el diálogo
      fetchJuegos();
      hideDialog();
    } catch (error) {
      // Manejar errores
      console.error('Error:', error);
      toast.current.show({
        severity: 'error',
        summary: 'Error',
        detail: error.message,
      });
    }
  };
  
  // Función para validar campos obligatorios
  const validateFields = () => {
    const requiredFields = [
      juego.nombre,
      juego.descripcion,
      juego.idestatus,
      juego.idgenero,
      juego.precio,
      juego.fechapublicacion,
    ];
  
    if (requiredFields.some((field) => !field)) {
      toast.current.show({
        severity: 'error',
        summary: 'Error',
        detail: 'Todos los campos son obligatorios',
      });
      return false;
    }
  
    return true;
  };
  
  // Función para preparar los datos del formulario
  const prepareFormData = () => {
    const formData = new FormData();

    // Agregar idjuego solo en modo edición
    if (editMode) {
        formData.append('idjuego', juego.idjuego);
    }

    // Agregar los campos básicos
    formData.append('nombre', juego.nombre);
    formData.append('descripcion', juego.descripcion);
    formData.append('idestatus', juego.idestatus);
    formData.append('idgenero', juego.idgenero);
    formData.append('precio', juego.precio);
    formData.append('fechapublicacion', juego.fechapublicacion);
    formData.append('valoracion', juego.valoracion);

    // Agregar la imagen si existe
    if (juego.imagen instanceof File) {
        formData.append('imagen', juego.imagen); // Archivo de imagen
    } else if (typeof juego.imagen === 'string') {
        formData.append('imagen', juego.imagen); // URL de imagen existente
    }

    // Depuración: Imprime todos los campos y valores en la consola
    console.log('Datos enviados:', Array.from(formData.entries()));

    return formData;
};
  
  // Función para determinar la URL y el método HTTP
  const getEndpointAndMethod = () => {
    const url = editMode ? `${API_JUEGOS}/update/` : `${API_JUEGOS}/create/`;
    const method = editMode ? 'POST' : 'POST';
    return { url, method };
  };





  const deleteJuego = (idjuego) => {
    confirmDialog({
      message: '¿Estás seguro de que deseas eliminar este Juego?',
      header: 'Confirmación',
      icon: 'pi pi-exclamation-triangle',
      acceptLabel: 'Sí',
      rejectLabel: 'No',
      accept: async () => {
        try {
          const requestBody = { idjuego }; // Objeto con el ID del juego
          const response = await fetch(`${API_JUEGOS}/delete/`, {
            method: 'DELETE',
            headers: {
              'Content-Type': 'application/json',
            },
            body: JSON.stringify(requestBody), // Envía el ID en el cuerpo
          });

          if (!response.ok) throw new Error('Error al eliminar juego');

          toast.current.show({
            severity: 'success',
            summary: 'Éxito',
            detail: 'juego eliminado',
          });

          fetchJuegos(); // Recargar la lista de juegos
        } catch (error) {
          console.error('Error al eliminar juego:', error);
          toast.current.show({
            severity: 'error',
            summary: 'Error',
            detail: 'No se pudo eliminar el juego',
          });
        }
      },
      reject: () => {
        // No hacer nada si el usuario cancela la eliminación
      },
    });
  };
  const fotoBodyTemplate = (rowData) => {
    return <img src={`https://api.arsistemaweb.com/juegos/img/${rowData.imagen}`} alt={rowData.imagen} className="w-75 img-thumbnail" />;
  };
  const dateBodyTemplate = (rowData) => {
    const formattedDate = formatDate(rowData.fechapublicacion); // Formatear la fecha
    return <span>{formattedDate}</span>; // Mostrar la fecha formateada
  };
  const precioBodyTemplate = (rowData) => {
    const formattedPrecio = formatCurrency(rowData.precio); // Formatear la fecha
    return <span>{formattedPrecio}</span>; // Mostrar la fecha formateada
  };

  // Contenido del diálogo
  const renderDialogContent = () => {
    if (!selectedJuego) return null;

    return (
      <div className="p-fluid">

        <div className='row'>
          <div className='col-md-4'>

            <img src={`https://api.arsistemaweb.com/juegos/img/${selectedJuego.imagen}`} alt={selectedJuego.imagen} className="img-fluid img-thumbnail" />

          </div>
          <div className='col-md-8'>
            <p><b>ID: </b>{selectedJuego.idjuego}</p>
            <p><b>juego: </b>{selectedJuego.genero}</p>
            <p><b>Nombre: </b>{selectedJuego.nombre}</p>
            <p><b>Descripción: </b>{selectedJuego.descripcion}</p>
            <p><b>Fecha de Publicación: </b>{formatDate(selectedJuego.fechapublicacion)}</p>
            <p className='fs-3 text-danger '><b>Precio: </b>{formatCurrency(selectedJuego.precio)}</p>
          </div>

        </div>








      </div>
    );
  };

  const renderFooter = () => {
    return (
      <div>
        <Button label="Cancelar" icon="pi pi-times" onClick={hideDialog} className="p-button-text" />
        <Button label="Guardar" icon="pi pi-check" onClick={saveJuego} autoFocus />
      </div>
    );
  };

  return (
    <main className='main-container'>
      <Toast ref={toast} />
      <ConfirmDialog />
      <div>
        <h5 className="text-center text-white-50 ">Juegos</h5>
      </div>
      <div className="d-flex justify-content-between mb-4">
        <div className=" mb-4">
          <span className="p-input-icon-left">
            <i className="pi pi-search mx-2" />
            <InputText
              value={filter}
              onChange={(e) => setFilter(e.target.value)} // Actualiza el estado del filtro
              placeholder="Buscar juego..."
              className="w-100 px-5"
            />
          </span>
        </div>
        <Button label="Nuevo juego" icon="pi pi-plus" className="p-button-success" onClick={openNew} />
      </div>
      <DataTable value={filteredJuegos} paginator rows={5} rowsPerPageOptions={[5, 10, 25]} >
        <Column field="idjuego" header="ID" sortable style={{ width: '5%' }} />
        <Column header="Foto" body={fotoBodyTemplate} style={{ width: '10%' }} />
        <Column field="genero" header="Genero" sortable style={{ width: '10%' }} />
        <Column field="nombre" header="Nombre" sortable style={{ width: '20%' }} />
        <Column field="descripcion" header="Descripción" sortable style={{ width: '25%' }} />
        <Column header="Fecha Pub" body={dateBodyTemplate} sortable style={{ width: '10%' }} />
        <Column header="Precio" body={precioBodyTemplate} sortable style={{ width: '10%' }} />
        <Column body={actionBodyTemplate} header="Acciones" style={{ width: '10%' }} />
      </DataTable>
      {/* Diálogo para mostrar los detalles del juego */}
      <Dialog
        visible={!!selectedJuego} // Muestra el diálogo si hay un juego seleccionado
        onHide={onHideDialog}
        header="Detalles del Juego"
        style={{ width: '900px', maxWidth: '90%' }}
        modal
      >
        {renderDialogContent()}
      </Dialog>


      <Dialog
        visible={visible}
        style={{ width: '800px' }}
        header={editMode ? 'Editar Juego' : 'Nuevo Juego'}
        modal
        footer={renderFooter()}
        onHide={hideDialog}
      >
        <div className="p-fluid">
          {/* Campo de nombre */}
          <div className="field mb-3">
            <label htmlFor="nombre">Nombre *</label>
            <InputText
              id="nombre"
              value={juego.nombre}
              onChange={(e) => setJuego({ ...juego, nombre: e.target.value })}
              required
            />
          </div>
          {/* Campo de género */}
          <div className="field mb-3">
            <label htmlFor="idgenero">Género *</label>
            <Dropdown
              id="idgenero"
              value={generos.find((g) => g.idgenero === juego.idgenero)}
              options={generos}
              optionLabel="nombre"
              onChange={(e) => setJuego({ ...juego, idgenero: e.value.idgenero })}
              placeholder="Selecciona un género"
              required
            />
          </div>

          {/* Campo de estado */}
          <div className="field mb-3">
            <label htmlFor="idestatus">Estado *</label>
            <Dropdown
              id="idestatus"
              value={estados.find((e) => e.idestatus === juego.idestatus)}
              options={estados}
              optionLabel="nombre"
              onChange={(e) => setJuego({ ...juego, idestatus: e.value.idestatus })}
              placeholder="Selecciona un estado"
              required
            />
          </div>
          {/* Campo de precio */}
          <div className="field mb-3">
            <label htmlFor="precio">Precio *</label>
            <InputText
              id="precio"
              value={juego.precio}
              onChange={(e) => setJuego({ ...juego, precio: parseFloat(e.target.value) || null })}
              required
            />
          </div>
          {/* Campo de valoración */}
          <div className="field mb-3">
            <label htmlFor="valoracion">Valoración</label>
            <Dropdown
              id="valoracion"
              value={juego.valoracion} // Valor seleccionado actualmente
              options={[1, 2, 3, 4, 5]} // Lista estática de opciones
              onChange={(e) => setJuego({ ...juego, valoracion: e.value })} // Actualiza el estado con el valor seleccionado
              placeholder="Selecciona una valoración" // Placeholder del dropdown
            />
          </div>

          {/* Campo de fecha de publicación */}
          <div className="field mb-3">
            <label htmlFor="fechapublicacion">Fecha de Publicación *</label>
            <input
              type="date"
              id="fechapublicacion"
              value={juego.fechapublicacion}
              onChange={(e) => setJuego({ ...juego, fechapublicacion: e.target.value })}
              className='w-100 p-2'
              required
            />
          </div>



          {/* Campo de descripción */}
          <div className="field mb-3">
            <label htmlFor="descripcion">Descripción *</label>
            <InputText
              id="descripcion"
              value={juego.descripcion}
              onChange={(e) => setJuego({ ...juego, descripcion: e.target.value })}
              required
            />
          </div>
          {/* Campo de imagen */}
          <FileUpload
              id="imagen"
              name="imagen"
              accept="image/*"
              maxFileSize={9000000}
              chooseLabel="Seleccionar Imagen"
              uploadLabel="Subir"
              cancelLabel="Cancelar"
              onSelect={(e) => {
                if (e.files.length > 0) {
                  setJuego(prev => ({...prev, imagen: e.files[0]}));
                }
              }}
              onClear={() => setJuego(prev => ({...prev, imagen: null}))}
              emptyTemplate={<p className="m-0">Arrastra y suelta una imagen aquí o haz clic para seleccionar.</p>}
            />
        </div>
      </Dialog>
    </main>
  )
}

export default Juegos