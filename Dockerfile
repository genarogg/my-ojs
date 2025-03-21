# Usa una imagen base de PHP con Apache
FROM php:8.1-apache

# Instala las extensiones necesarias de PHP
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    libicu-dev \
    nginx \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install mysqli pdo pdo_mysql zip intl

# Habilita el módulo de reescritura de Apache
RUN a2enmod rewrite

# Copia los archivos del proyecto al contenedor
COPY . /var/www/html

# Copia los archivos de configuración de Nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# Crea los directorios necesarios y establece los permisos adecuados
RUN mkdir -p /var/www/html/files \
    && mkdir -p /var/www/files \
    && mkdir -p /var/www/html/cache/t_cache \
    && mkdir -p /var/www/html/cache/t_compile \
    && mkdir -p /var/www/html/cache/_db \
    && chown -R www-data:www-data /var \
    && chmod -R 777 /var \
    && chmod -R 777 /var/www/html/config.inc.php \
    && chmod -R 777 /var/www/html/public \
    && chmod -R 777 /var/www/html/cache \
    && chmod -R 777 /var/www/html/cache/t_cache \
    && chmod -R 777 /var/www/html/cache/t_compile \
    && chmod -R 777 /var/www/html/cache/_db \
    && chmod -R 777 /var/www/html/files \
    && chmod -R 777 /var/www/files \
    && chmod -R 777 /var/log/apache2

# Exponer los puertos 80 y 443
EXPOSE 80 443

# Comando para iniciar Nginx y Apache
CMD service apache2 start && nginx -g 'daemon off;'