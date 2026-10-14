#!/usr/bin/env bash

echo "=========================================================="
echo " Starting Smart Irrigation Advisory System (KisanSmart)  "
echo "=========================================================="

# Trap SIGINT to kill background processes on Ctrl+C
trap 'kill $(jobs -p) 2>/dev/null; exit' SIGINT SIGTERM EXIT

# 1. Start Backend API Server
echo "[1/2] Starting Node.js Backend API on http://localhost:5000..."
cd /home/gintoki/Downloads/smart_irrigation/backend
node server.js &
BACKEND_PID=$!

# Wait for backend to be ready
sleep 1.5

# 2. Start Frontend Dev Server
echo "[2/2] Starting React + Vite Frontend on http://localhost:3000..."
cd /home/gintoki/Downloads/smart_irrigation/frontend
npm run dev &
FRONTEND_PID=$!

echo ""
echo "=========================================================="
echo "  ✓ System is running!"
echo "  🌐 Open Web App:       http://localhost:3000"
echo "  🔌 Backend API:        http://localhost:5000"
echo "  📄 6-Page IEEE Paper:  http://localhost:3000 (Research Paper Tab)"
echo "=========================================================="
echo "Press Ctrl+C to stop both servers."
echo ""

wait
