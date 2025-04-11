import { BrowserRouter, Routes, Route } from 'react-router-dom'
import { useState } from 'react'

import Header from './components/Header'
import Sidebar from './components/Sidebar'
import Home from './components/Home'
import Footer from './components/Footer'
import './App.css'
import Usuarios from './pages/Usuarios'
import Juegos from './pages/Juegos'
import Generos from './pages/Generos'
import Visitantes from './pages/Visitantes'
import Configuracion from './pages/Configuracion'

function App() {
  const [openSidebarToggle, setOpenSidebarToggle] = useState(false)
  const OpenSidebar = () => {
    setOpenSidebarToggle(!openSidebarToggle)
  }


  

  return (
    <BrowserRouter>
     <div className='grid-container'>
        <Header OpenSidebar={OpenSidebar}/>
        <Sidebar openSidebarToggle={openSidebarToggle} OpenSidebar={OpenSidebar}/>
     
      <Routes>
        <Route path='/' element={<Home/>}/>
   
        <Route path='/usuarios' element={<Usuarios/>}/>
        <Route path='/juegos' element={<Juegos/>}/>
        <Route path='/generos' element={<Generos/>}/>
        <Route path='/visitantes' element={<Visitantes/>}/>
        <Route path='/configuracion' element={<Configuracion/>}/>
       
      </Routes>
 </div>

      <Footer/>
    
    </BrowserRouter>
      
      
  

  )
}

export default App
