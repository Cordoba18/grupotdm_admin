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
                'resources/js/register.js',
                'resources/js/app.js',
                'resources/js/recovery_password.js',
                'resources/js/tickets.js',
                'resources/js/show_tickets.js',
            ],
            refresh: true,
        }),
    ],
});
