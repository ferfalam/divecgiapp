# Start the CGI program that receives and returns the data
require 'cgi'
cgi = CGI.new
# After receiving the data, return the response in HTML format
cgi.out("type" => "text/html", "charset" => "UTF-8") {
    # Take out the data of "goya" used as a marker of information with the description cgi ['goya'] and assign it to a local variable.
    html_middle = ""
    get = cgi['goya']
    goyas = get.split('*')
    goyas.each do |goya| 
        record = goya.split(' ')
        html_middle += "<tr> 
                            <td>#{record[0]}</td>
                            <td>#{record[1]}</td>
                            <td>#{record[2]}</td>
                            <td>#{record[3]}</td>
                        </tr>"
    end
    
    "<!DOCTYPE html>
    <html lang=\"en\">
    <head>
        <meta charset=\"UTF-8\">
        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
        <title>CGI||Application</title>

        <style>
            header{
                text-align: center;
                background-color: #4d4d4d;
                color: #fff;
            }
            header h1{
                margin: 0;
                padding: 10px;
            }
            .container{
                width: 980px;
                margin: 15px auto;
                text-align: center;
            }

            table{
                width: 80%;
                margin: auto;
                border: 1px solid #b5b5b5;
                border-collapse: collapse;
            }
            th, td{
                border: 1px solid #b5b5b5;
            }

            .back{
                position: fixed;
                bottom: 40px;
                right: 18px;
            }

            .back a{
                color: white;
                padding: 15px;
                background-color: turquoise;
                text-decoration: none;
                border-radius: 50%;
            }

            .back a:hover{
                text-decoration: none;
                opacity: 0.6;
            }

        </style>
    </head>
    <body>
        <header>
            <h1>CGI Application-All Goya</h1>
        </header>
        <div class=\"container\">
            <table>
                <tr>
                    <th>Length</th>
                    <th>Weight</th>
                    <th>Quality</th>
                    <th>Give for</th>
                </tr>
                    " + html_middle + "
            </table>
        </div>

        <div class=\"back\">
            <a href=\"/\">Back</a>
        </div>
    </body>
    </html>"    
}
