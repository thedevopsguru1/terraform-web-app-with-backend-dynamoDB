
        #!/bin/bash
        yum install httpd -y
        systemctl start httpd 
        systemctl enable httpd
        cd /var/www/html

        echo "<html><h1>Hello Cloud Gurus Welcome To My Webpage</h1></html>" > index.html