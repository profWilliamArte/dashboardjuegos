/**
 * Formatea una fecha en formato 'YYYY/MM/DD' a 'DD/MM/YYYY'.
 * @param {string} date - Fecha en formato 'YYYY/MM/DD'.
 * @returns {string} Fecha formateada en 'DD/MM/YYYY'.
 */
export const formatDate = (date) => {
    if (!date) return ''; // Manejar valores nulos o vacíos
    const [year, month, day] = date.split('-');
    return `${day}/${month}/${year}`;
  };
  
  /**
   * Formatea un valor numérico como moneda con separadores de miles y decimales.
   * Ejemplo: 1232.32 -> '1.232,32'
   * @param {number} value - Valor numérico a formatear.
   * @returns {string} Valor formateado como moneda.
   */
  export const formatCurrency = (value) => {
    if (value === null || value === undefined) return ''; // Manejar valores nulos o indefinidos
  
    // Usar el objeto Intl.NumberFormat para formatear números como moneda
    return new Intl.NumberFormat('es-ES', {
      style: 'decimal',
      minimumFractionDigits: 2,
      maximumFractionDigits: 2,
    }).format(value);
  };