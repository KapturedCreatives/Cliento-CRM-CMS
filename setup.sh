#!/bin/bash

# Initialize project
echo "🚀 Setting up Cliento CRM..."
git init
npm init -y

# Install dependencies
echo "📦 Installing dependencies..."
npm install next@14 react react-dom @supabase/supabase-js @supabase/ssr zod @radix-ui/react-dropdown-menu @radix-ui/react-slot @radix-ui/react-dialog framer-motion lucide-react tailwind-merge clsx tailwindcss-animate shadcn-ui

# Setup Next.js
echo "⚙️ Configuring Next.js..."
npx shadcn-ui@latest init
npx tailwindcss init -p

# Setup Supabase
echo "🔥 Configuring Supabase..."
npm install @supabase/cli --save-dev
npx supabase init
curl -o .env.local https://raw.githubusercontent.com/supabase/supabase/master/examples/nextjs-ts/.env.local.example

# Create Vercel config
echo "▲ Preparing Vercel config..."
cat > vercel.json <<EOL
{
  "buildCommand": "npm run build",
  "devCommand": "npm run dev",
  "installCommand": "npm install",
  "framework": "nextjs",
  "outputDirectory": ".next"
}
EOL

# Setup git
echo "🔮 Initializing Git..."
git add .
git commit -m "Initial commit"

# Open Supabase Dashboard
echo "🔑 Opening Supabase Dashboard..."
npx supabase login

echo "✅ Setup complete! Run these commands next:"
echo "1. Start dev server: npm run dev"
echo "2. Start Supabase: npx supabase start"
echo "3. Push schema: npx supabase db push"
