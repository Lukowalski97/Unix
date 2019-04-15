class Blank

    def call(env)
        response = Rack::Response.new

        response.status = Rack::Utils::SYMBOL_TO_STATUS_CODE[:ok] # Ustaw kod statusu na 200. Zbędne, gdyż 200, to wartość domyślna własności 'status'; potrzebne do celów edukacyjnych ;-)
        response.header['Content-Type'] = 'text/html'             # Umieść, w nagłówku odpowiedzi, informację, że wysyłane dane będą HTML-em
        response.write %Q(<!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8">
        <title>Aplikacja Rack</title>
      </head>
      <body>
        <h1>Odmowa dostepu</h1>
     </body>
      
    </html>)            # Umieść, w ciele odpowiedzi, podany dokument HTML
        response.finish # Wyślij odpowiedź
    end

end