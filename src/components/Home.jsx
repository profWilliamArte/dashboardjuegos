import { BsFillArchiveFill, BsFillGrid3X3GapFill, BsPeopleFill, BsFillBellFill} from 'react-icons/bs'
import { BarChart, Bar, Cell, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, LineChart, Line } from 'recharts';
import { useEffect, useState } from 'react'
const API='http://localhost/musicback/api/genero/getGenero.php';

const Home = () => {
  const [datos, setDatos] = useState([])
  
  const getDatos = () => {
    fetch(API)
      .then(response => response.json())
      .then(data => {
        console.log(data.resumen);
        setDatos(data.resumen);
  
      })
      .catch(error => {
        console.error(error);
      });
  };
  useEffect(()=>{
     getDatos();
  },[]);


    const data = [
        {
          name: 'Page A',
          uv: 4000,
          pv: 2400,
          amt: 2400,
        },
        {
          name: 'Page B',
          uv: 3000,
          pv: 1398,
          amt: 2210,
        },
        {
          name: 'Page C',
          uv: 2000,
          pv: 9800,
          amt: 2290,
        },
        {
          name: 'Page D',
          uv: 2780,
          pv: 3908,
          amt: 2000,
        },
        {
          name: 'Page E',
          uv: 1890,
          pv: 4800,
          amt: 2181,
        },
        {
          name: 'Page F',
          uv: 2390,
          pv: 3800,
          amt: 2500,
        },
        {
          name: 'Page G',
          uv: 3490,
          pv: 4300,
          amt: 2100,
        },
      ];

      const formatearMoneda = (valor) => {
        const resultado = valor.toLocaleString("es", {
          style: "currency",
          currency: "USD",
          useGrouping: true,
        });
      
        return resultado.replace("US$", "");
      };

      return (
     
        <main className='main-container'>
            <div className='main-title'>
                <h3 className='text-red text-center'>DASHBOARD</h3>
            </div>
    
            <div className='main-cards'>
                <div className='card text-white-50'>
                    <div className='card-inner'>
                        <h3>VENTAS</h3>
                        <BsFillArchiveFill className='card_icon'/>
                    </div>
                    {datos.length > 0 && <h1 >{formatearMoneda(datos[0].ventas)}</h1>}
                </div>
                <div className='card text-white-50'>
                    <div className='card-inner'>
                        <h3>COBRANZA</h3>
                        <BsFillGrid3X3GapFill className='card_icon'/>
                    </div>
                    {datos.length > 0 && <h1>{formatearMoneda(datos[0].cobranzas)}</h1>}
                </div>
                <div className='card text-white-50'>
                    <div className='card-inner'>
                        <h3>INVENTARIO</h3>
                        <BsPeopleFill className='card_icon'/>
                    </div>
                    {datos.length > 0 && <h1>{formatearMoneda(datos[0].inventario)}</h1>}
                </div>
                <div className='card text-white-50'>
                    <div className='card-inner'>
                        <h3>DEVOLUCIONES</h3>
                        <BsFillBellFill className='card_icon'/>
                    </div>
                    {datos.length > 0 && <h1>{formatearMoneda(datos[0].devoluciones)}</h1>}
                </div>
            </div>
    
            <div className='charts'>
                <ResponsiveContainer width="100%" height="100%">
                <BarChart
                width={500}
                height={300}
                data={data}
                margin={{
                    top: 5,
                    right: 30,
                    left: 20,
                    bottom: 5,
                }}
                >
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis dataKey="name" />
                    <YAxis />
                    <Tooltip />
                    <Legend />
                    <Bar dataKey="pv" fill="#8884d8" />
                    <Bar dataKey="uv" fill="#82ca9d" />
                    </BarChart>
                </ResponsiveContainer>
    
                <ResponsiveContainer width="100%" height="100%">
                    <LineChart
                    width={500}
                    height={300}
                    data={data}
                    margin={{
                        top: 5,
                        right: 30,
                        left: 20,
                        bottom: 5,
                    }}
                    >
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis dataKey="name" />
                    <YAxis />
                    <Tooltip />
                    <Legend />
                    <Line type="monotone" dataKey="pv" stroke="#8884d8" activeDot={{ r: 8 }} />
                    <Line type="monotone" dataKey="uv" stroke="#82ca9d" />
                    </LineChart>
                </ResponsiveContainer>
    
            </div>
        </main>
      )
}

export default Home