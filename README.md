# Ruby-Api_gps

* Ruby version
    
    ### ruby --version 
    ruby 2.2.6p369 (2016-11-15 revision 56800)

    ### rails --version 
    Rails 5.0.7

* Configuration

   * Para ver la configuración de ambientes development, test and production, ver los archivos dentro de config/environments
   * Para ver la configuración de la aplicación, ver el archivo config/aplication.rb
   * Para ver la configuración del servidor, ver el archivo config/puma.rb
   * En el archivo config/database.yml se encuentra la configuración de la base de datos

* Database creation

    La creacion de las tablas de la base de datos, esta detallada en los archivos db/migrate 
    La misma ya se encuentra inicializada, pero para correr las migraciones se usa el comando

    ### rails db:migrate

* How to run the test suite

    ### rake test	
    Ejecuta todas las pruebas en el directorio test. También puedes ejecutar rake y Rails ejecutará todos las pruebas por defecto
    
    ### rake test:controllers	
    Ejecuta todas las pruebas de controlador desde test/controllers
    
    ### rake test:functionals	
    Ejecuta todas las pruebas funcionales desde test/controllers, test/mailers, y test/functional
    
    ### rake test:helpers	
    Ejecuta todas las pruebas de los helpers desde test/helpers
    
    ### rake test:integration	
    Ejecuta tadas las pruebas de integración desde test/integration
    
    ### rake test:jobs	
    Ejecuta todas las pruebas de trabajos desde test/jobs
    
    ### rake test:mailers	
    Ejecuta todas las pruebas de envíos de correos desde test/mailers
    
    ### rake test:models	
    Ejecuta todas las pruebas del modelo desde test/models
    
    ### rake test:units	
    Ejecuta todas las pruebas unitarias desde test/models, test/helpers, y test/unit
    
    ### rake test:db	
    Ejecuta todas las pruebas en el directorio test y resetea la base de datos

* Deployment instructions

    Ejecutar el servidor puma con la configuracion establecida en el archivo config/puma.rb

    ### rails server
    => Booting Puma
    => Rails 5.0.7 application starting in development on http://localhost:3000
    Puma starting in single mode...
    * Version 3.12.0 (ruby 2.2.6-p396), codename: Llamas in Pajamas
    * Min threads: 5, max threads: 5
    * Environment: development
    * Listening on tcp://0.0.0.0:4000

    Y poner a trabajar a los jobs para que verifique cada cierto tiempo si tiene alguna tarea para realizar, con el siguiente comando

    ### rake jobs:work

