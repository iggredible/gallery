import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
// https://stackoverflow.com/questions/70446474/how-to-set-vite-preview-production-port
export default defineConfig({
  preview: {
    host: '0.0.0.0',
    port: 8080
  },
  server: {
    host: '0.0.0.0',
    port: 3000
  },
  plugins: [react()],
})
