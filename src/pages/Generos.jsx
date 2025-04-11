import { useState, useEffect, useRef } from 'react';

// Importar componentes de PrimeReact
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';
import { Button } from 'primereact/button';
import { Dialog } from 'primereact/dialog';
import { InputText } from 'primereact/inputtext';
import { Dropdown } from 'primereact/dropdown';
import { Toast } from 'primereact/toast';
import { ConfirmDialog, confirmDialog } from 'primereact/confirmdialog'; // Diálogo de confirmación

// URLs del backend
const API_GENEROS = 'https://api.arsistemaweb.com/juegos/api/generos';
const API_ESTATUS = 'https://api.arsistemaweb.com/juegos/api/estatus';

const Generos = () => {
  // Estados del componente
  const [generos, setGeneros] = useState([]); // Lista de géneros
  const [estados, setEstados] = useState([]); // Lista de estados disponibles
  const [genero, setGenero] = useState({ idgenero: null, nombre: '', descripcion: '', idestatus: null }); // Datos del género actual
  const [visible, setVisible] = useState(false); // Controla la visibilidad del diálogo
  const [editMode, setEditMode] = useState(false); // Indica si estamos editando o creando un género
  const [filter, setFilter] = useState(''); // Estado para el filtro de búsqueda
  const toast = useRef(null); // Referencia al componente Toast para mostrar mensajes

  /**
   * Cargar los géneros desde el backend.
   */
  const fetchGeneros = async () => {
    try {
      const response = await fetch(`${API_GENEROS}/get/`);
      if (!response.ok) throw new Error('Error al cargar géneros');
      const data = await response.json();
      setGeneros(data); // Actualiza la lista de géneros
    } catch (error) {
      console.error('Error al cargar géneros:', error);
    }
  };

  /**
   * Cargar los estados desde el backend.
   */
  const fetchEstados = async () => {
    try {
      const response = await fetch(`${API_ESTATUS}/get/`);
      if (!response.ok) throw new Error('Error al cargar estados');
      const data = await response.json();
      setEstados(data); // Actualiza la lista de estados
    } catch (error) {
      console.error('Error al cargar estados:', error);
    }
  };

  // Cargar datos iniciales cuando el componente se monta
  useEffect(() => {
    fetchGeneros();
    fetchEstados();
  }, []);


  // Filtrar géneros según el filtro
  const filteredGeneros = generos.filter((genero) =>
    genero.nombre.toLowerCase().includes(filter.toLowerCase()) ||
    genero.descripcion.toLowerCase().includes(filter.toLowerCase())
  );
  /**
   * Abre el diálogo para crear un nuevo género.
   */
  const openNew = () => {
    setGenero({ idgenero: null, nombre: '', descripcion: '', idestatus: null }); // Reinicia el formulario
    setEditMode(false); // Modo de creación
    setVisible(true); // Muestra el diálogo
  };

  /**
   * Cierra el diálogo.
   */
  const hideDialog = () => {
    setVisible(false); // Oculta el diálogo
  };

  /**
   * Guarda el género (crea o actualiza).
   */
  const saveGenero = async () => {
    try {
      // Validación de campos obligatorios
      if (!genero.nombre || !genero.descripcion || !genero.idestatus) {
        toast.current.show({
          severity: 'error',
          summary: 'Error',
          detail: 'Todos los campos son obligatorios',
        });
        return; // Detener la ejecución si hay campos vacíos
      }
  
      let response;
  
      if (editMode) {
        // Actualizar género
        response = await fetch(`${API_GENEROS}/update/?idgenero=${genero.idgenero}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            nombre: genero.nombre,
            descripcion: genero.descripcion,
            idestatus: genero.idestatus,
          }),
        });
      } else {
        // Crear nuevo género
        response = await fetch(`${API_GENEROS}/create/`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(genero),
        });
      }
  
      // Verificar si la solicitud fue exitosa
      if (!response.ok) {
        const errorData = await response.json(); // Leer el mensaje de error del backend
        throw new Error(errorData.error || 'Error al guardar género'); // Usa el mensaje del backend o uno genérico
      }
  
      const responseBody = await response.json();
      console.log('Respuesta del servidor:', responseBody);
  
      // Mostrar mensaje de éxito
      toast.current.show({
        severity: 'success',
        summary: 'Éxito',
        detail: editMode ? 'Género actualizado' : 'Género creado',
      });
  
      fetchGeneros(); // Recargar la lista de géneros
      hideDialog(); // Cerrar el diálogo
    } catch (error) {
      console.error('Error al guardar género:', error);
      toast.current.show({
        severity: 'error',
        summary: 'Error',
        detail: error.message, // Muestra el mensaje de error específico
      });
    }
  };

  /**
   * Abre el diálogo para editar un género existente.
   * @param {Object} rowData - Datos del género seleccionado.
   */
  const editGenero = (rowData) => {
    setGenero({ ...rowData }); // Carga los datos del género en el formulario
    setEditMode(true); // Modo de edición
    setVisible(true); // Muestra el diálogo
  };

  /**
   * Elimina un género después de confirmar.
   * @param {number} idgenero - ID del género a eliminar.
   */
  const deleteGenero = (idgenero) => {
    confirmDialog({
      message: '¿Estás seguro de que deseas eliminar este género?',
      header: 'Confirmación',
      icon: 'pi pi-exclamation-triangle',
      acceptLabel: 'Sí',
      rejectLabel: 'No',
      accept: async () => {
        try {
          const requestBody = { idgenero }; // Objeto con el ID del género
          const response = await fetch(`${API_GENEROS}/delete/`, {
            method: 'DELETE',
            headers: {
              'Content-Type': 'application/json',
            },
            body: JSON.stringify(requestBody), // Envía el ID en el cuerpo
          });

          if (!response.ok) throw new Error('Error al eliminar género');

          toast.current.show({
            severity: 'success',
            summary: 'Éxito',
            detail: 'Género eliminado',
          });

          fetchGeneros(); // Recargar la lista de géneros
        } catch (error) {
          console.error('Error al eliminar género:', error);
          toast.current.show({
            severity: 'error',
            summary: 'Error',
            detail: 'No se pudo eliminar el género',
          });
        }
      },
      reject: () => {
        // No hacer nada si el usuario cancela la eliminación
      },
    });
  };

  /**
   * Renderiza los botones de acción (editar y eliminar) para cada fila.
   * @param {Object} rowData - Datos de la fila actual.
   */
  const actionBodyTemplate = (rowData) => {
    return (
      <div>
        <Button
          icon="pi pi-pencil"
          className="p-button-rounded p-button-success mr-2"
          onClick={() => editGenero(rowData)} // Abre el diálogo de edición
        />
        <Button
          icon="pi pi-trash"
          className="p-button-rounded p-button-danger"
          onClick={() => deleteGenero(rowData.idgenero)} // Abre el diálogo de confirmación
        />
      </div>
    );
  };

  /**
   * Renderiza el footer del diálogo (botones "Cancelar" y "Guardar").
   */
  const renderFooter = () => {
    return (
      <div>
        <Button label="Cancelar" icon="pi pi-times" onClick={hideDialog} className="p-button-text" />
        <Button label="Guardar" icon="pi pi-check" onClick={saveGenero} autoFocus />
      </div>
    );
  };

  return (
    <main className="main-container">
      {/* Componente Toast para mostrar mensajes */}
      <Toast ref={toast} />

      {/* Diálogo de confirmación */}
      <ConfirmDialog />

      {/* Título de la página */}
      <h5 className="text-center text-white-50">Géneros</h5>


      {/* Botón para abrir el diálogo de creación */}
      <div className="d-flex justify-content-between mb-4">
        <div className=" mb-4">
            <span className="p-input-icon-left">
              <i className="pi pi-search mx-2" />
              <InputText
                value={filter}
                onChange={(e) => setFilter(e.target.value)} // Actualiza el estado del filtro
                placeholder="Buscar género..."
                className="w-100 px-5"
              />
            </span>
          </div>
        <Button label="Nuevo Género" icon="pi pi-plus" className="p-button-success" onClick={openNew} />
      </div>

      {/* Tabla de géneros */}
      <DataTable value={filteredGeneros} paginator rows={5} rowsPerPageOptions={[5, 10, 25]} responsiveLayout="scroll">
        <Column field="idgenero" header="ID" sortable />
        <Column field="estatus" header="Estado" sortable />
        <Column field="nombre" header="Nombre" sortable />
        <Column field="descripcion" header="Descripción" sortable />
        <Column body={actionBodyTemplate} header="Acciones" style={{ minWidth: '10rem' }} />
      </DataTable>

      {/* Diálogo para crear/editar géneros */}
      <Dialog
        visible={visible}
        style={{ width: '450px' }}
        header={editMode ? 'Editar Género' : 'Nuevo Género'}
        modal
        footer={renderFooter()}
        onHide={hideDialog}
      >
        <div className="p-fluid">
          {/* Campo de nombre */}
          <div className="field">
            <label htmlFor="nombre">Nombre *</label>
            <InputText
              id="nombre"
              value={genero.nombre}
              onChange={(e) => setGenero({ ...genero, nombre: e.target.value })}
              required
            />
          </div>

          {/* Campo de descripción */}
          <div className="field">
            <label htmlFor="descripcion">Descripción *</label>
            <InputText
              id="descripcion"
              value={genero.descripcion}
              onChange={(e) => setGenero({ ...genero, descripcion: e.target.value })}
              required
            />
          </div>

          {/* Campo de estado */}
          <div className="field">
            <label htmlFor="idestatus">Estado *</label>
            <Dropdown
              id="idestatus"
              value={estados.find((e) => e.idestatus === genero.idestatus)}
              options={estados}
              optionLabel="nombre"
              onChange={(e) => setGenero({ ...genero, idestatus: e.value.idestatus })}
              placeholder="Selecciona un estado"
              required
            />
          </div>
        </div>
      </Dialog>
    </main>
  );
};

export default Generos;