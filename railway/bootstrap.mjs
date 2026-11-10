// Creates the owner account on first boot (registration is closed afterwards by Bookplate itself).
const port = process.env.PORT || "8080";
const base = `http://127.0.0.1:${port}`;
const email = process.env.OWNER_EMAIL || "admin@example.com";
const password = process.env.BOOKPLATE_OWNER_PASSWORD;
const sleep = (ms) => new Promise((r) => setTimeout(r, ms));
for (let i = 0; i < 120; i++) {
  try {
    const h = await fetch(`${base}/api/health`);
    if (h.ok) break;
  } catch {}
  await sleep(2000);
}
try {
  const r = await fetch(`${base}/api/auth/sign-up/email`, {
    method: "POST",
    headers: { "content-type": "application/json", origin: base, "x-forwarded-for": "127.0.0.1" },
    body: JSON.stringify({ email, password, name: "Owner" }),
  });
  console.log(`[railway] owner bootstrap: HTTP ${r.status}`);
} catch (e) {
  console.log(`[railway] owner bootstrap failed: ${e}`);
}
