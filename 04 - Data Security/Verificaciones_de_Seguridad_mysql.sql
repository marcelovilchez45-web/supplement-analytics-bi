
-- Verificar directorio permitido para carga de archivos
SHOW VARIABLES LIKE 'secure_file_priv';

-- Verificar si se permite la carga desde el cliente local
SHOW VARIABLES LIKE 'local_infile';

-- Verificar el usuario actual
SELECT CURRENT_USER();

-- Verificar los permisos del usuario actual
SHOW GRANTS FOR CURRENT_USER();