<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>We'll be back soon — Maintenance</title>
  <meta name="description" content="Our website is currently undergoing scheduled maintenance. We'll be back shortly." />
  <!--<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'%3E%3Ctext y='0.9em' font-size='90'%3E🛠️%3C/text%3E%3C/svg%3E">-->

  <style>
    :root{
      --bg:#0b1115;            /* background */
      --card:#111a21;          /* card surface */
      --text:#e6f0f3;          /* primary text */
      --muted:#9fb2bb;         /* secondary text */
      --accent:#27ae60;        /* green accent */
      --accent-2:#1f8f4f;      /* accent darker */
      --ring:rgba(39,174,96,.35);
    }
    @media (prefers-color-scheme: light){
      :root{
        --bg:#f6f9fb;
        --card:#ffffff;
        --text:#0b1115;
        --muted:#516169;
        --accent:#2ecc71;
        --accent-2:#27ae60;
        --ring:rgba(39,174,96,.25);
      }
    }
    *{box-sizing:border-box}
    html,body{height:100%}
    body{
      margin:0;
      font-family: system-ui, -apple-system, "Segoe UI", Roboto, Inter, "Helvetica Neue", Arial, "Noto Sans", "Liberation Sans", sans-serif;
      color:var(--text);
      background: radial-gradient(1200px 800px at 80% -10%, rgba(39,174,96,.15), transparent 60%),
                  radial-gradient(900px 600px at -10% 110%, rgba(39,174,96,.12), transparent 55%),
                  var(--bg);
      display:grid;
      place-items:center;
      padding:24px;
    }

    .card{
      width:min(720px, 95vw);
      background:linear-gradient(180deg, rgba(255,255,255,.02), rgba(255,255,255,0)) , var(--card);
      border:1px solid rgba(255,255,255,.06);
      border-radius:18px;
      padding:28px clamp(24px, 4vw, 40px) 32px;
      box-shadow:
        0 8px 24px -12px rgba(0,0,0,.4),
        0 0 0 6px rgba(39,174,96,.06);
      text-align:center;
      position:relative;
      overflow:hidden;
    }

    .badge{
      display:inline-flex;
      align-items:center;
      gap:8px;
      font:600 14px/1.1 inherit;
      color:var(--accent);
      background:rgba(39,174,96,.09);
      border:1px solid rgba(39,174,96,.25);
      padding:8px 12px;
      border-radius:999px;
      letter-spacing:.3px;
      margin-bottom:16px;
      box-shadow:0 0 0 3px var(--ring) inset;
    }
    .badge svg{width:18px; height:18px}

    h1{
      margin:8px 0 10px;
      font-weight:800;
      font-size:clamp(26px, 4.5vw, 36px);
      letter-spacing:.2px;
    }
    p{
      margin:0 auto;
      color:var(--muted);
      max-width:56ch;
      font-size:clamp(16px, 2.6vw, 18px);
      line-height:1.6;
    }

    .meter{
      margin:26px auto 14px;
      width:min(520px, 100%);
      height:10px;
      background:linear-gradient(180deg, rgba(255,255,255,.04), rgba(0,0,0,.08));
      border:1px solid rgba(255,255,255,.08);
      border-radius:999px;
      overflow:hidden;
      position:relative;
    }
    .meter::before{
      content:"";
      position:absolute; inset:0;
      background:
        linear-gradient(90deg, rgba(255,255,255,.25), rgba(255,255,255,0) 25%),
        linear-gradient(90deg, var(--accent), var(--accent-2));
      width:40%;
      animation:load 2.6s ease-in-out infinite;
    }
    @keyframes load{
      0%{transform:translateX(-40%)}
      50%{transform:translateX(30%)}
      100%{transform:translateX(110%)}
    }

    .actions{
      margin-top:20px;
      display:flex;
      justify-content:center;
      gap:12px;
      flex-wrap:wrap;
    }
    .btn{
      appearance:none;
      border:none;
      border-radius:12px;
      padding:12px 16px;
      font-weight:700;
      cursor:pointer;
      transition:transform .08s ease, box-shadow .2s ease, background .2s ease;
      box-shadow:0 6px 16px -8px rgba(0,0,0,.45);
    }
    .btn:active{transform:translateY(1px)}
    .btn-primary{
      background:linear-gradient(180deg, var(--accent), var(--accent-2));
      color:white;
    }
    .btn-ghost{
      background:transparent;
      color:var(--text);
      border:1px dashed rgba(255,255,255,.25);
    }
    .small{
      margin-top:12px;
      color:var(--muted);
      font-size:13px;
    }

    /* Subtle animated gear illustration */
    .gear{
      width:86px; height:86px; margin:10px auto 4px;
      filter: drop-shadow(0 6px 14px rgba(0,0,0,.35));
    }
    .gear svg{width:100%; height:100%}
    .spin-slow{ animation: spin 10s linear infinite; transform-origin: 50% 50%; }
    .spin-fast{ animation: spin 4s linear infinite reverse; transform-origin: 50% 50%; }
    @keyframes spin{ to{ transform: rotate(360deg);} }

    /* Footer note */
    footer{
      margin-top:20px;
      font-size:12px;
      color:var(--muted);
      opacity:.8;
    }

    /* Make focus states visible */
    .btn:focus-visible, a:focus-visible, .badge:focus-visible{
      outline: 3px solid var(--ring);
      outline-offset: 2px;
      border-radius:12px;
    }
  </style>
</head>
<body>
  <main class="card" role="main" aria-labelledby="headline">
    <div class="badge" aria-hidden="true" title="Scheduled maintenance">
      <!-- wrench icon -->
      <!--<svg viewBox="0 0 24 24" fill="none" aria-hidden="true">-->
      <!--  <path d="M21 3a7 7 0 0 1-9.44 6.62L5.1 16.06a2.5 2.5 0 1 1-3.16-3.16l6.44-6.46A7 7 0 0 1 21 3Z" stroke="currentColor" stroke-width="1.6"/>-->
      <!--  <circle cx="5" cy="19" r="1.8" fill="currentColor"/>-->
      <!--</svg>-->
      Under Maintenance
    </div>

    <div class="gear" aria-hidden="true">
      <!-- two interlocking gears as inline SVG -->
      <svg viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
        <g class="spin-slow" opacity=".9">
          <path d="M60 18l6 6 9-2 3 8 8 3-2 9 6 6-6 6 2 9-8 3-3 8-9-2-6 6-6-6-9 2-3-8-8-3 2-9-6-6 6-6-2-9 8-3 3-8 9 2 6-6z" fill="url(#g1)"/>
        </g>
        <g class="spin-fast" transform="translate(70,70) scale(.6)" opacity=".85">
          <path d="M20-22l4 4 6-1 2 6 6 2-1 6 4 4-4 4 1 6-6 2-2 6-6-1-4 4-4-4-6 1-2-6-6-2 1-6-4-4 4-4-1-6 6-2 2-6 6 1 4-4z" fill="url(#g2)"/>
        </g>
        <defs>
          <linearGradient id="g1" x1="0" y1="0" x2="1" y2="1">
            <stop offset="0" stop-color="#2ecc71"/>
            <stop offset="1" stop-color="#27ae60"/>
          </linearGradient>
          <linearGradient id="g2" x1="0" y1="0" x2="1" y2="1">
            <stop offset="0" stop-color="#27ae60"/>
            <stop offset="1" stop-color="#1f8f4f"/>
          </linearGradient>
        </defs>
      </svg>
    </div>

    <h1 id="headline">We&rsquo;ll be back soon</h1>
    <p>
      Our site is undergoing scheduled maintenance to improve your experience.
      Thank you for your patience. Everything should be back online shortly.
    </p>

    <!--<div class="meter" role="progressbar" aria-label="Maintenance progress" aria-valuemin="0" aria-valuemax="100" aria-valuenow="60"></div>-->

    <div class="actions">
      <button class="btn btn-primary" onclick="location.reload()">Refresh</button>
      <a class="btn btn-ghost" href="mailto:aa12437809@gmail.com">Contact Support</a>
    </div>

    <p class="small">Status: updating script, database and servers<p>

    <footer>
      &copy; <span id="year"></span> UTCC. All rights reserved.
    </footer>
  </main>

  <script>
    // Set dynamic year without external JS
    document.getElementById('year').textContent = new Date().getFullYear();
  </script>
</body>
</html>
