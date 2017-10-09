FROM debian:stable

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install git avr-libc make avrdude nano vim
RUN git clone https://github.com/rainisto/sd2iec_mega2560.git
RUN cd sd2iec_mega2560 && chmod -R a+x scripts && make CONFIG=configs/config-arduino_mega2560

CMD (cd sd2iec_mega2560 && cp scripts/flash_arduino.sh /flash/ && cp -a obj-m2560-arduino_mega2560/sd2iec.hex /flash/)
