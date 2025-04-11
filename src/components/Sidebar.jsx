import { BsPeopleFill, BsFillGearFill} from 'react-icons/bs'
import { FaPerson } from "react-icons/fa6";
import { TbGoGame } from "react-icons/tb";
import { FaGamepad } from "react-icons/fa";
import { Link } from 'react-router-dom'

const Sidebar = ({openSidebarToggle, OpenSidebar}) => {
    return (
        <aside id="sidebar" className={openSidebarToggle ? "sidebar-responsive": ""}>
            <div className='sidebar-title'>
                <div className='sidebar-brand'>
                    <img src="logo.png" alt="logo" className='img-fluid'  />
                </div>
                <span className='icon close_icon' onClick={OpenSidebar}>X</span>
            </div>
    
            <ul className='sidebar-list'>
                <li className='sidebar-list-item'>
                    <Link to="/usuarios">
                        <FaPerson className='icon'/> Usuarios
                    </Link>
                </li>
                <li className='sidebar-list-item'>
                    <Link to="/generos">
                        <TbGoGame  className='icon'/> Generos
                    </Link>
                </li>
                <li className='sidebar-list-item'>
                    <Link to="/juegos">
                        <FaGamepad  className='icon'/> Juegos
                    </Link>
                </li>
                <li className='sidebar-list-item'>
                    <Link to="/visitantes">
                        <BsPeopleFill className='icon'/> Visitantes
                    </Link>
                </li>
               
                <li className='sidebar-list-item'>
                    <Link to="/configuracion">
                        <BsFillGearFill className='icon'/> Configuración
                    </Link>
                </li>
            </ul>
        </aside>
  )
}

export default Sidebar