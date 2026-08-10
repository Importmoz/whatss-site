# Whatss — Landing Page + Termos & Privacidade

Site estático do **Whatss** (API Oficial WhatsApp Business — Moçambique & Brasil), pronto para hospedar no **Cloudflare Pages**.

## Estrutura

```
├── index.html    → Landing page (página inicial)
├── termos.html   → Termos de Serviço + Política de Privacidade (com abas)
└── 404.html      → Página de erro 404 com link para a home
```

## Contactos

- **Email:** info@hlces.com
- **WhatsApp:** +258 82 446 3475 → [wa.me/258824463475](https://wa.me/258824463475)

## Deploy no Coolify (VPS — `whatss.mycloudspaces.com`)

### Pré-requisitos

- DNS: `whatss.mycloudspaces.com` → `144.91.110.199` (A record — já configurado)
- Repositório `Importmoz/whatss-site` com o código atualizado (push feito)

### Passo a passo (painel Coolify)

1. **Push** do código para o GitHub (se ainda não foi feito):
   ```bash
   git push origin main
   ```
2. No Coolify (`https://mycloudspaces.com`) → **Projects** → **+ New Project** (ou usa um existente) → **+ New Resource**.
3. Escolhe **Private Repository** → seleciona `Importmoz/whatss-site` (branch `main`).
4. **Build Pack:** `Dockerfile` (o Dockerfile do repo usa nginx e já trata o 404).
5. **Domains:** adiciona `https://whatss.mycloudspaces.com`.
6. **Deploy** — o Coolify faz o build, publica e emite o SSL automático (Let's Encrypt) em ~1 min.

> Alternativa (sem Dockerfile): Build Pack `Static` → Build Command vazio → Publish Directory `/`.

### Verificação

```bash
curl -s -o /dev/null -w "%{http_code}" https://whatss.mycloudspaces.com/   # esperado: 200
curl -s -o /dev/null -w "%{http_code}" https://whatss.mycloudspaces.com/termos.html   # 200
curl -s -o /dev/null -w "%{http_code}" https://whatss.mycloudspaces.com/nao-existe   # 404 (página custom)
```

## Deploy no Cloudflare Pages

### Opção A — Conectar repositório GitHub (recomendado, deploys automáticos)

1. Crie um repositório no GitHub (ou use este) e faça push deste código.
2. No [Cloudflare Dashboard](https://dash.cloudflare.com) → **Workers & Pages** → **Create** → **Pages** → **Connect to Git**.
3. Escolha o repositório.
4. **Build configuration:**
   - Framework preset: **None** (ou "Static HTML")
   - Build command: *(deixar vazio)*
   - Build output directory: `/` (ou deixar vazio)
5. **Deploy** — em segundos o site fica no ar em `https://<projeto>.pages.dev`.
6. (Opcional) Aponte um domínio próprio em **Custom domains** (ex.: `hlces.com`).

### Opção B — Direct Upload

1. No Cloudflare Dashboard → **Workers & Pages** → **Create** → **Pages** → **Upload assets**.
2. Arraste os 3 ficheiros (`index.html`, `termos.html`, `404.html`) e publique.

## Como os links funcionam

| De | Para | Link |
|---|---|---|
| Landing (rodapé) | Termos | `termos.html` |
| Landing (rodapé) | Privacidade | `termos.html` |
| Termos (cabeçalho e rodapé) | Home | `index.html` |
| Landing (todos os CTAs) | WhatsApp | `https://wa.me/258824463475?text=...` |
| Landing (rodapé) | Email | `mailto:info@hlces.com` |

> Links relativos (sem `/`) — funcionam em qualquer subdiretório/domínio do Cloudflare Pages sem configuração extra.
