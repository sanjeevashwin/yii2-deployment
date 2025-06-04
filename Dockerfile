FROM php:8.2-apache

WORKDIR /var/www/html

# Install dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev unzip git curl \
    && docker-php-ext-install pdo pdo_mysql zip \
    && a2enmod rewrite

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Replace default Apache config with our custom one
COPY apache.conf /etc/apache2/sites-available/000-default.conf

# Copy all files into the container
COPY . /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Run composer install
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Apache port
EXPOSE 80

#healthcheck
HEALTHCHECK --interval=900s --timeout=10s --start-period=10s --retries=3 \
  CMD curl -f http://localhost/ || exit 1



