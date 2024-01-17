import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    plugins: [
        laravel({
            input: [
                'resources/css/app.css',
                'resources/css/login.css',
                'resources/css/form.css',
                'resources/css/tickets.css',
                'resources/css/view_ticket.css',
                'resources/css/create_certificate.css',
                'resources/css/accept_certificate.css',
                'resources/css/view_certificate.css',
                'resources/css/inventories.css',
                'resources/css/view_product.css',
                'resources/css/images_product.css',
                'resources/js/register.js',
                'resources/js/app.js',
                'resources/js/recovery_password.js',
                'resources/js/tickets.js',
                'resources/js/show_tickets.js',
                'resources/js/create_permissions.js',
                'resources/js/permissions.js',
                'resources/js/show_permission.js',
                'resources/js/create_certificate.js',
                'resources/js/show_certificate.js',
                'resources/js/certificates.js',
                'resources/js/create_product.js',
                'resources/js/edit_user.js',
                'resources/js/new_user.js',
                'resources/js/dashboard.js',
                'resources/js/notifications.js',
            ],
            refresh: true,
        }),
    ],
});
