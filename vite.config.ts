import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import path from 'path';

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    }
  },
  server: {
    port: 3000,
    open: true,
    host: true
  },
  preview: {
    port: 80,
    host: true
  },
  build: {
    target: 'esnext',
    minify: 'esbuild',
    sourcemap: true,
    rollupOptions: {
      output: {
        manualChunks: {
          'react-vendor': ['react', 'react-dom', 'react-router-dom'],
          'firebase-vendor': [
            'firebase/app',
            'firebase/auth',
            'firebase/firestore',
            'firebase/storage'
          ],
          'ui-vendor': ['lucide-react', 'react-hot-toast']
        }
      }
    },
    chunkSizeWarningLimit: 1000,
    assetsDir: 'assets',
    outDir: 'dist',
    emptyOutDir: true,
    cssCodeSplit: true,
    modulePreload: {
      polyfill: true
    },
    reportCompressedSize: false
  },
  optimizeDeps: {
    include: [
      'react',
      'react-dom',
      'react-router-dom',
      'firebase/app',
      'firebase/auth',
      'firebase/firestore',
      'firebase/storage'
    ],
    esbuildOptions: {
      target: 'esnext'
    }
  }
});