# minidlna

This is a Debian-based MiniDLNa Docker image.

Create workdirs :

     mkdir -p /path/to/your/minidlna/volume/etc /path/to/your/minidlna/volume/etc/default /path/to/your/minidlna/volume/etc/minidlna

Get default minidlna :

    docker run --rm \
               --entrypoint cat barbak/minidlna \
               /etc/default/minidlna > /path/to/your/minidlna/volume/etc/default/minidlna

Get default minidlna.conf :

    docker run --rm \
               --entrypoint cat barbak/minidlna \
               /etc/minidlna.conf > /path/to/your/minidlna/volume/etc/minidlna/minidlna.conf

Edit minidlna and minidlna.conf:

Create container :

    docker run -d \
               --init \
               --restart always \
               --name minidlna \
               --hostname minidlna \
               -p 1900:1900/udp
               -p 8200:8200/tcp
               -v /etc/timezone:/etc/timezone:ro \
               -v /etc/localtime:/etc/localtime:ro \
               -v /path/to/your/minidlna/volume/etc/default/minidlna:/etc/default/minidlna \
               -v /path/to/your/minidlna/volume/etc/minidlna/minidlna.conf:/etc/minidlna/minidlna.conf \
               -v /path/to/your/minidlna/volume/var:/var \
               -v <media-dir>:/your/media/dir:ro \ # you can add multiple media dirs if you want, just add another -v <media-dir-n>:/another/media/dir:ro
               barbak/minidlna

Or with docker-compose :

    version: "3.6"
    services:
        # MiniDLNa - DLNa server
        minidlna:
            container_name: minidlna
            hostname: minidlna
            image: barbak/minidlna
            restart: always
            ports:
                - "1900:1900/udp"
                - "8200:8200/tcp"
            volumes:
                - /etc/timezone:/etc/timezone:ro
                - /etc/localtime:/etc/localtime:ro
                - /path/to/your/minidlna/volume/etc/default/minidlna:/etc/default/minidlna
                - /path/to/your/minidlna/volume/etc/minidlna/minidlna.conf:/etc/minidlna/minidlna.conf
                - /path/to/your/minidlna/volume/var:/var
                - <media-dir>:/your/media/dir:ro \ # you can add multiple media dirs if you want, just add another - <media-dir-n>:/another/media/dir:ro

The web interface runs on port 8200.

List of exposed ports : 1900/udp 8200/tcp
