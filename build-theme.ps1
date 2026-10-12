# Build Script for Taleemwaly eCommerce Theme
$ErrorActionPreference = "Stop"

$sourcePath = "theme-backup-repaired.xml"
$destPath = "taleemwaly-ecommerce-theme.xml"

Write-Host "Reading repaired valid base theme: $sourcePath"
$rawXml = [System.IO.File]::ReadAllText($sourcePath, [System.Text.Encoding]::UTF8)

# eCommerce Head Code (CSS and Meta)
$headCode = @'
<b:if cond='!data:amp.active and !data:view.isPreview'>
<style>/*<![CDATA[*/
/* ==========================================================================
   TALEEMWALY REVENUE ENGINE - ECOMMERCE STYLES (MOBILE-FIRST / LOW BANDWIDTH)
   ========================================================================== */
:root {
  --tw-primary: #059669;
  --tw-primary-dark: #047857;
  --tw-accent: #25D366; /* WhatsApp Green */
  --tw-jazzcash: #b91c1c;
  --tw-easypaisa: #059669;
  --tw-text: #1f2937;
  --tw-light-bg: #f9fafb;
  --tw-border: #e5e7eb;
  --tw-card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.08), 0 2px 4px -1px rgba(0, 0, 0, 0.04);
}

/* Announcement Bar */
.tw-announcement-bar {
  background: linear-gradient(135deg, #065f46, #047857);
  color: #ffffff;
  padding: 8px 12px;
  font-size: 13px;
  font-weight: 600;
  text-align: center;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 8px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.06);
}
.tw-announcement-bar a {
  color: #fde047;
  text-decoration: underline;
  font-weight: 700;
  margin-left: 6px;
}

/* Category Quick Filter Chips */
.tw-filter-bar {
  display: flex;
  gap: 8px;
  overflow-x: auto;
  padding: 12px 16px;
  background: #ffffff;
  border-bottom: 1px solid var(--tw-border);
  -webkit-overflow-scrolling: touch;
  scrollbar-width: none;
}
.tw-filter-bar::-webkit-scrollbar { display: none; }
.tw-filter-chip {
  display: inline-flex;
  align-items: center;
  white-space: nowrap;
  padding: 6px 14px;
  border-radius: 9999px;
  font-size: 13px;
  font-weight: 600;
  color: #374151;
  background: #f3f4f6;
  border: 1px solid #e5e7eb;
  text-decoration: none;
  transition: all 0.2s ease;
}
.tw-filter-chip:hover, .tw-filter-chip.active {
  background: var(--tw-primary);
  color: #ffffff;
  border-color: var(--tw-primary);
}

/* Product Card Elements in Grid */
.tw-grid-badge {
  display: inline-block;
  font-size: 11px;
  font-weight: 700;
  padding: 3px 8px;
  border-radius: 4px;
  margin-bottom: 6px;
  text-transform: uppercase;
}
.tw-badge-sale { background: #fee2e2; color: #b91c1c; }
.tw-badge-verified { background: #d1fae5; color: #047857; }

.tw-product-card-pricing {
  display: flex;
  align-items: baseline;
  gap: 8px;
  margin: 6px 0 10px;
}
.tw-price-curr {
  font-size: 18px;
  font-weight: 800;
  color: #047857;
}
.tw-price-orig {
  font-size: 13px;
  color: #9ca3af;
  text-decoration: line-through;
}

/* Fast Order WhatsApp Button */
.tw-btn-wa {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 6px;
  background: #25D366;
  color: #ffffff !important;
  font-weight: 700;
  font-size: 13px;
  padding: 8px 14px;
  border-radius: 6px;
  text-decoration: none !important;
  border: none;
  cursor: pointer;
  box-shadow: 0 2px 4px rgba(37, 211, 102, 0.25);
  transition: transform 0.15s ease, background 0.2s ease;
}
.tw-btn-wa:hover {
  background: #1ebd5a;
  transform: translateY(-1px);
}
.tw-btn-wa svg {
  width: 16px;
  height: 16px;
  fill: currentColor;
}

.tw-btn-cart {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 6px;
  background: #1f2937;
  color: #ffffff !important;
  font-weight: 600;
  font-size: 13px;
  padding: 8px 12px;
  border-radius: 6px;
  text-decoration: none !important;
  border: none;
  cursor: pointer;
}
.tw-btn-cart:hover { background: #111827; }

/* Product Page Showcase Box */
.tw-product-showcase {
  background: #ffffff;
  border: 2px solid #e5e7eb;
  border-radius: 12px;
  padding: 20px;
  margin: 20px 0;
  box-shadow: var(--tw-card-shadow);
}
.tw-product-header {
  border-bottom: 1px solid #f3f4f6;
  padding-bottom: 14px;
  margin-bottom: 16px;
}
.tw-product-title {
  font-size: 20px;
  font-weight: 800;
  color: #111827;
  margin: 0 0 8px 0;
}
.tw-product-meta-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
}
.tw-pill {
  font-size: 12px;
  font-weight: 600;
  padding: 2px 10px;
  border-radius: 9999px;
  background: #f3f4f6;
  color: #374151;
}

.tw-price-box {
  background: #ecfdf5;
  border: 1px solid #a7f3d0;
  border-radius: 8px;
  padding: 14px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 16px 0;
}
.tw-price-main {
  font-size: 24px;
  font-weight: 900;
  color: #065f46;
}
.tw-price-discount {
  font-size: 13px;
  color: #047857;
  font-weight: 700;
}

/* Compliance Disclaimer Box */
.tw-compliance-box {
  background: #fffbeb;
  border-left: 4px solid #f59e0b;
  padding: 12px 14px;
  margin: 16px 0;
  border-radius: 0 8px 8px 0;
  font-size: 13px;
  color: #92400e;
  line-height: 1.5;
}

/* Payment Info Grid */
.tw-payment-accounts {
  background: #f9fafb;
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  padding: 14px;
  margin: 16px 0;
}
.tw-account-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 8px 0;
  border-bottom: 1px dashed #e5e7eb;
}
.tw-account-row:last-child { border-bottom: none; }
.tw-account-name { font-weight: 700; font-size: 14px; }
.tw-account-val {
  font-family: monospace;
  font-size: 14px;
  background: #ffffff;
  padding: 3px 8px;
  border: 1px solid #d1d5db;
  border-radius: 4px;
  display: flex;
  align-items: center;
  gap: 6px;
}
.tw-copy-btn {
  background: #e5e7eb;
  border: none;
  padding: 2px 6px;
  border-radius: 4px;
  cursor: pointer;
  font-size: 11px;
  font-weight: 600;
}
.tw-copy-btn:hover { background: #d1d5db; }

/* Sticky Mobile Order Bar */
.tw-sticky-mobile-bar {
  display: none;
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  background: #ffffff;
  border-top: 1px solid #e5e7eb;
  padding: 10px 16px;
  z-index: 9998;
  box-shadow: 0 -2px 10px rgba(0,0,0,0.08);
}
@media (max-width: 768px) {
  .tw-sticky-mobile-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
  }
}

/* Floating Cart Icon */
.tw-floating-cart {
  position: fixed;
  bottom: 75px;
  right: 18px;
  width: 52px;
  height: 52px;
  background: #047857;
  color: #ffffff;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  box-shadow: 0 4px 14px rgba(4, 120, 87, 0.35);
  z-index: 9990;
  transition: transform 0.2s ease;
}
.tw-floating-cart:hover { transform: scale(1.08); }
.tw-cart-count {
  position: absolute;
  top: -4px;
  right: -4px;
  background: #ef4444;
  color: #ffffff;
  font-size: 11px;
  font-weight: 800;
  width: 20px;
  height: 20px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  border: 2px solid #ffffff;
}

/* Modal Drawer */
.tw-modal-overlay {
  display: none;
  position: fixed;
  top: 0; left: 0; right: 0; bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  z-index: 9999;
  justify-content: flex-end;
}
.tw-modal-overlay.active { display: flex; }
.tw-drawer {
  background: #ffffff;
  width: 100%;
  max-width: 420px;
  height: 100%;
  overflow-y: auto;
  display: flex;
  flex-direction: column;
  animation: twSlideIn 0.25s ease-out;
}
@keyframes twSlideIn {
  from { transform: translateX(100%); }
  to { transform: translateX(0); }
}
.tw-drawer-head {
  padding: 16px 20px;
  border-bottom: 1px solid #e5e7eb;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.tw-drawer-title { font-size: 18px; font-weight: 800; margin: 0; }
.tw-drawer-close {
  background: none;
  border: none;
  font-size: 24px;
  cursor: pointer;
  color: #6b7280;
}
.tw-drawer-body { padding: 20px; flex: 1; }
.tw-drawer-foot {
  padding: 16px 20px;
  border-top: 1px solid #e5e7eb;
  background: #f9fafb;
}

/* Toast Notifications */
.tw-toast {
  position: fixed;
  bottom: 24px;
  left: 50%;
  transform: translateX(-50%);
  background: #1f2937;
  color: #ffffff;
  padding: 10px 18px;
  border-radius: 8px;
  font-size: 13px;
  font-weight: 600;
  z-index: 10000;
  opacity: 0;
  transition: opacity 0.2s ease;
  pointer-events: none;
}
.tw-toast.show { opacity: 1; }
/*]]>*/</style>
</b:if>
'@

# eCommerce Body Code (Drawer HTML + Vanilla JS Engine with Live User Easypaisa Number)
$bodyCode = @'
<b:if cond='!data:amp.active and !data:view.isPreview'>
<!-- ==========================================================================
     TALEEMWALY ECOMMERCE STOREFRONT OVERLAYS & JAVASCRIPT ENGINE
     ========================================================================== -->
<!-- Sticky Mobile Order Bar for Product Pages -->
<div id="twStickyMobileBar" class="tw-sticky-mobile-bar" style="display:none;">
  <div>
    <div id="twStickyPrice" class="tw-price-curr" style="font-size:16px;">Rs. 299</div>
    <div style="font-size:10px; color:#6b7280;">100% Original Reference</div>
  </div>
  <div style="display:flex; gap:6px;">
    <button type="button" class="tw-btn-cart" onclick="TaleemwalyShop.addCurrentToCart()">Add Cart</button>
    <a id="twStickyWaBtn" href="#" class="tw-btn-wa" target="_blank">
      <svg viewBox="0 0 24 24"><path d="M12.04 2c-5.46 0-9.91 4.45-9.91 9.91 0 1.75.46 3.45 1.32 4.95L2.05 22l5.25-1.38c1.45.79 3.08 1.21 4.74 1.21 5.46 0 9.91-4.45 9.91-9.91 0-2.65-1.03-5.14-2.9-7.01A9.816 9.816 0 0 0 12.04 2z"/></svg>
      Order
    </a>
  </div>
</div>

<!-- Floating Shopping Cart Trigger -->
<div id="twFloatingCart" class="tw-floating-cart" onclick="TaleemwalyShop.openCart()">
  <svg style="width:24px;height:24px;fill:none;stroke:currentColor;stroke-width:2;" viewBox="0 0 24 24">
    <path stroke-linecap="round" stroke-linejoin="round" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
  </svg>
  <div id="twCartCount" class="tw-cart-count">0</div>
</div>

<!-- Shopping Cart Drawer Modal -->
<div id="twCartModal" class="tw-modal-overlay">
  <div class="tw-drawer">
    <div class="tw-drawer-head">
      <h3 class="tw-drawer-title">Aapka Cart (Taleemwaly)</h3>
      <button class="tw-drawer-close" onclick="TaleemwalyShop.closeCart()">&#215;</button>
    </div>
    <div id="twCartBody" class="tw-drawer-body">
      <!-- Injected via JavaScript -->
    </div>
    <div class="tw-drawer-foot">
      <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:12px;">
        <span style="font-weight:700; font-size:15px;">Total Amount:</span>
        <span id="twCartTotal" style="font-weight:900; font-size:20px; color:#047857;">Rs. 0</span>
      </div>
      <button id="twCheckoutWaBtn" type="button" class="tw-btn-wa" style="width:100%; padding:12px; font-size:15px; margin-bottom:8px;" onclick="TaleemwalyShop.checkoutWhatsApp()">
        <svg viewBox="0 0 24 24"><path d="M12.04 2c-5.46 0-9.91 4.45-9.91 9.91 0 1.75.46 3.45 1.32 4.95L2.05 22l5.25-1.38c1.45.79 3.08 1.21 4.74 1.21 5.46 0 9.91-4.45 9.91-9.91 0-2.65-1.03-5.14-2.9-7.01A9.816 9.816 0 0 0 12.04 2z"/></svg>
        WhatsApp Par Checkout Karein
      </button>
      <button type="button" class="tw-btn-cart" style="width:100%; padding:10px; font-size:14px; background:#4b5563;" onclick="TaleemwalyShop.openOrderFormModal()">
        Online Order Form &amp; Trx ID Upload
      </button>
      <div style="text-align:center; margin-top:8px; font-size:11px; color:#6b7280;">
        Easypaisa (03702388998) Manual Verification &#8226; Delivery via Gated Drive / WhatsApp
      </div>
    </div>
  </div>
</div>

<!-- Order Submission & Proof Modal -->
<div id="twOrderModal" class="tw-modal-overlay">
  <div class="tw-drawer" style="max-width:480px;">
    <div class="tw-drawer-head">
      <h3 class="tw-drawer-title">Payment Verification &amp; Order</h3>
      <button class="tw-drawer-close" onclick="TaleemwalyShop.closeOrderFormModal()">&#215;</button>
    </div>
    <div class="tw-drawer-body">
      <div class="tw-payment-accounts" style="margin-top:0;">
        <div style="font-size:12px; font-weight:700; color:#047857; margin-bottom:8px;">OFFICIAL PAYMENT ACCOUNTS (TALEEMWALY)</div>
        <div class="tw-account-row">
          <div class="tw-account-name">Easypaisa:</div>
          <div class="tw-account-val">
            <span id="twEasypaisaNum">03702388998</span>
            <button class="tw-copy-btn" onclick="TaleemwalyShop.copyText('03702388998', 'Easypaisa number copied!')">Copy</button>
          </div>
        </div>
        <div class="tw-account-row">
          <div class="tw-account-name">JazzCash:</div>
          <div class="tw-account-val">
            <span id="twJazzcashNum">03702388998</span>
            <button class="tw-copy-btn" onclick="TaleemwalyShop.copyText('03702388998', 'JazzCash number copied!')">Copy</button>
          </div>
        </div>
        <div style="font-size:11px; color:#6b7280; margin-top:6px;">Account Title: <strong>Taleemwaly / Nationalist Academy</strong></div>
      </div>

      <form id="twOrderForm" onsubmit="TaleemwalyShop.submitOrderForm(event)" style="display:flex; flex-direction:column; gap:10px;">
        <div>
          <label style="font-size:12px; font-weight:700;">Aapka Naam (Student Name) *</label>
          <input type="text" id="twCustName" required="required" style="width:100%; padding:8px; border:1px solid #d1d5db; border-radius:6px; box-sizing:border-box;" placeholder="e.g. Muhammad Ali" />
        </div>
        <div>
          <label style="font-size:12px; font-weight:700;">WhatsApp Number *</label>
          <input type="tel" id="twCustWhatsApp" required="required" style="width:100%; padding:8px; border:1px solid #d1d5db; border-radius:6px; box-sizing:border-box;" placeholder="03XXXXXXXXX" />
        </div>
        <div>
          <label style="font-size:12px; font-weight:700;">Email Address (For Google Drive Access) *</label>
          <input type="email" id="twCustEmail" required="required" style="width:100%; padding:8px; border:1px solid #d1d5db; border-radius:6px; box-sizing:border-box;" placeholder="ali@gmail.com" />
        </div>
        <div>
          <label style="font-size:12px; font-weight:700;">Payment Method &amp; Transaction ID (TID) *</label>
          <input type="text" id="twCustTrxId" required="required" style="width:100%; padding:8px; border:1px solid #d1d5db; border-radius:6px; box-sizing:border-box;" placeholder="e.g. Easypaisa TID: 1049284729" />
        </div>
        <button type="submit" id="twSubmitBtn" class="tw-btn-wa" style="width:100%; padding:12px; font-size:14px; margin-top:8px; background:#047857;">
          Order Jama Karwayen (Submit Proof)
        </button>
      </form>
    </div>
  </div>
</div>

<div id="twToast" class="tw-toast">Item Cart mein add hogaya!</div>

<script>/*<![CDATA[*/
/* ==========================================================================
   TALEEMWALY ECOMMERCE STOREFRONT CORE ENGINE (VANILLA JS / LIGHTWEIGHT)
   ========================================================================== */
var TaleemwalyShop = (function() {
  var CONFIG = {
    whatsappNumber: "923702388998",
    jazzcashNumber: "03702388998",
    easypaisaNumber: "03702388998",
    accountTitle: "Taleemwaly / Nationalist Academy"
  };

  var cart = [];

  function init() {
    loadCart();
    updateCartBadge();
    bindProductPage();
    injectTopFilterBar();
  }

  function loadCart() {
    try {
      var stored = localStorage.getItem("tw_cart");
      if (stored) cart = JSON.parse(stored);
    } catch(e) { cart = []; }
  }

  function saveCart() {
    try {
      localStorage.setItem("tw_cart", JSON.stringify(cart));
    } catch(e) {}
    updateCartBadge();
  }

  function updateCartBadge() {
    var badge = document.getElementById("twCartCount");
    var count = 0;
    for (var i = 0; i < cart.length; i++) {
      count += (cart[i].qty || 1);
    }
    if (badge) badge.innerText = count;
  }

  function showToast(msg) {
    var t = document.getElementById("twToast");
    if (!t) return;
    t.innerText = msg;
    t.classList.add("show");
    setTimeout(function() { t.classList.remove("show"); }, 2500);
  }

  function copyText(val, successMsg) {
    if (navigator.clipboard) {
      navigator.clipboard.writeText(val).then(function() { showToast(successMsg || "Copied!"); });
    } else {
      var el = document.createElement("textarea");
      el.value = val;
      document.body.appendChild(el);
      el.select();
      document.execCommand("copy");
      document.body.removeChild(el);
      showToast(successMsg || "Copied!");
    }
  }

  function addToCart(item) {
    var existing = null;
    for (var i = 0; i < cart.length; i++) {
      if (cart[i].sku === item.sku) {
        existing = cart[i];
        break;
      }
    }
    if (existing) {
      existing.qty = (existing.qty || 1) + 1;
    } else {
      cart.push({
        sku: item.sku,
        title: item.title,
        price: parseInt(item.price, 10),
        qty: 1,
        url: item.url || window.location.href
      });
    }
    saveCart();
    showToast("Cart mein add ho gaya!");
  }

  function removeFromCart(sku) {
    var updated = [];
    for (var i = 0; i < cart.length; i++) {
      if (cart[i].sku !== sku) {
        updated.push(cart[i]);
      }
    }
    cart = updated;
    saveCart();
    renderCart();
  }

  function openCart() {
    renderCart();
    var modal = document.getElementById("twCartModal");
    if (modal) modal.classList.add("active");
  }

  function closeCart() {
    var modal = document.getElementById("twCartModal");
    if (modal) modal.classList.remove("active");
  }

  function openOrderFormModal() {
    closeCart();
    var modal = document.getElementById("twOrderModal");
    if (modal) modal.classList.add("active");
  }

  function closeOrderFormModal() {
    var modal = document.getElementById("twOrderModal");
    if (modal) modal.classList.remove("active");
  }

  function renderCart() {
    var body = document.getElementById("twCartBody");
    var totalEl = document.getElementById("twCartTotal");
    if (!body || !totalEl) return;

    if (cart.length === 0) {
      body.innerHTML = '<div style="text-align:center; padding:40px 10px; color:#6b7280;">' +
        '<div style="font-size:16px; font-weight:700; color:#374151;">Aapka cart khali hai</div>' +
        '<div style="font-size:13px; margin-top:4px;">Apni pasand ke notes ya solved assignment select karein.</div>' +
        '</div>';
      totalEl.innerText = "Rs. 0";
      return;
    }

    var total = 0;
    var html = '<div style="display:flex; flex-direction:column; gap:12px;">';
    for (var i = 0; i < cart.length; i++) {
      var item = cart[i];
      var sub = item.price * (item.qty || 1);
      total += sub;
      html += '<div style="display:flex; justify-content:space-between; align-items:flex-start; padding:10px; background:#f9fafb; border:1px solid #e5e7eb; border-radius:8px;">' +
        '<div style="flex:1; padding-right:8px;">' +
        '<div style="font-weight:700; font-size:13px; color:#111827;">' + item.title + '</div>' +
        '<div style="font-size:11px; color:#6b7280; margin-top:2px;">SKU: ' + item.sku + ' &#8226; Rs. ' + item.price + ' &#215; ' + item.qty + '</div>' +
        '</div>' +
        '<div style="text-align:right;">' +
        '<div style="font-weight:800; font-size:14px; color:#047857;">Rs. ' + sub + '</div>' +
        '<button type="button" style="background:none; border:none; color:#ef4444; font-size:11px; cursor:pointer; padding:4px 0;" onclick="TaleemwalyShop.removeFromCart(\'' + item.sku + '\')">Remove</button>' +
        '</div>' +
        '</div>';
    }
    html += '</div>';
    body.innerHTML = html;
    totalEl.innerText = "Rs. " + total;
  }

  function checkoutWhatsApp() {
    if (cart.length === 0) {
      alert("Aapka cart khali hai. Pehle koi product select karein.");
      return;
    }
    var total = 0;
    var itemsText = "";
    for (var i = 0; i < cart.length; i++) {
      var itm = cart[i];
      var sub = itm.price * (itm.qty || 1);
      total += sub;
      itemsText += (i + 1) + ". " + itm.title + " (SKU: " + itm.sku + ") - Rs. " + sub + "%0A";
    }

    var msg = "Salam Taleemwaly! Mein yeh study material order karna chahta hoon:%0A%0A" +
      itemsText +
      "%0A*Total Amount: Rs. " + total + "*%0A" +
      "Payment Method: Easypaisa / JazzCash%0A%0A" +
      "Barah-e-karam apna Easypaisa number (03702388998) verify kar dein taake mein payment bhej sakoon.";

    var url = "https://wa.me/" + CONFIG.whatsappNumber + "?text=" + msg;
    window.open(url, "_blank");
  }

  function submitOrderForm(e) {
    e.preventDefault();
    var name = document.getElementById("twCustName").value;
    var phone = document.getElementById("twCustWhatsApp").value;
    var email = document.getElementById("twCustEmail").value;
    var trx = document.getElementById("twCustTrxId").value;

    var total = 0;
    var itemsDescList = [];
    for (var i = 0; i < cart.length; i++) {
      total += (cart[i].price * (cart[i].qty || 1));
      itemsDescList.push(cart[i].title + " (" + cart[i].sku + ")");
    }
    var itemsDesc = itemsDescList.join(", ");

    var summaryMsg = "Salam Taleemwaly! Maine order submit kiya hai:%0A" +
      "Naam: " + encodeURIComponent(name) + "%0A" +
      "WhatsApp: " + encodeURIComponent(phone) + "%0A" +
      "Email: " + encodeURIComponent(email) + "%0A" +
      "Trx ID: " + encodeURIComponent(trx) + "%0A" +
      "Products: " + encodeURIComponent(itemsDesc) + "%0A" +
      "Total: Rs. " + total + "%0A%0A" +
      "Maine payment proof screenshot le liya hai. Barah-e-karam file access provide kar dein.";

    var waUrl = "https://wa.me/" + CONFIG.whatsappNumber + "?text=" + summaryMsg;
    window.open(waUrl, "_blank");

    closeOrderFormModal();
    showToast("Order darj ho gaya! WhatsApp open ho raha hai...");
  }

  function bindProductPage() {
    var prodEl = document.querySelector(".tw-product-showcase");
    if (!prodEl) return;

    var sku = prodEl.getAttribute("data-sku") || "TW-ITEM";
    var title = prodEl.getAttribute("data-title") || document.title;
    var price = prodEl.getAttribute("data-price") || "299";

    var sticky = document.getElementById("twStickyMobileBar");
    var stickyPrice = document.getElementById("twStickyPrice");
    var stickyWaBtn = document.getElementById("twStickyWaBtn");

    if (sticky && stickyPrice && stickyWaBtn) {
      sticky.style.display = "flex";
      stickyPrice.innerText = "Rs. " + price;
      var waMsg = encodeURIComponent("Salam Taleemwaly! Mujhe yeh product order karna hai:\nProduct: " + title + "\nSKU: " + sku + "\nPrice: Rs. " + price + "\nEasypaisa details bhej dein.");
      stickyWaBtn.href = "https://wa.me/" + CONFIG.whatsappNumber + "?text=" + waMsg;
    }
  }

  function addCurrentToCart() {
    var prodEl = document.querySelector(".tw-product-showcase");
    if (!prodEl) return;
    addToCart({
      sku: prodEl.getAttribute("data-sku") || "TW-ITEM",
      title: prodEl.getAttribute("data-title") || document.title,
      price: prodEl.getAttribute("data-price") || "299",
      url: window.location.href
    });
  }

  function injectTopFilterBar() {
    var mainSec = document.querySelector("#sec_Header_Title") || document.querySelector("header");
    if (!mainSec) return;

    var bar = document.createElement("div");
    bar.className = "tw-filter-bar";
    bar.innerHTML = '<a href="/" class="tw-filter-chip active">All Store</a>' +
      '<a href="/search/label/AIOU" class="tw-filter-chip">AIOU Solved Assignments</a>' +
      '<a href="/search/label/9th-Class" class="tw-filter-chip">9th Class Notes</a>' +
      '<a href="/search/label/10th-Class" class="tw-filter-chip">10th Class Notes</a>' +
      '<a href="/search/label/Intermediate" class="tw-filter-chip">11th &amp; 12th Class</a>' +
      '<a href="/search/label/Guess-Papers-2026" class="tw-filter-chip">Guess Papers 2026</a>' +
      '<a href="/p/payments.html" class="tw-filter-chip">Payment Guide (Easypaisa: 03702388998)</a>';
    if (mainSec.parentNode) {
      mainSec.parentNode.insertBefore(bar, mainSec.nextSibling);
    }
  }

  return {
    init: init,
    addToCart: addToCart,
    removeFromCart: removeFromCart,
    openCart: openCart,
    closeCart: closeCart,
    openOrderFormModal: openOrderFormModal,
    closeOrderFormModal: closeOrderFormModal,
    checkoutWhatsApp: checkoutWhatsApp,
    submitOrderForm: submitOrderForm,
    addCurrentToCart: addCurrentToCart,
    copyText: copyText
  };
})();

document.addEventListener("DOMContentLoaded", function() {
  TaleemwalyShop.init();
});
/*]]>*/</script>
</b:if>
'@

# Target Anchors
$headAnchor = '<b:comment><!--[ </head> | <!> [below] Custom codes (Global) ]--></b:comment>'
$bodyAnchor = '<b:comment><!--[ </body> | <!> [below] Custom codes (Global) ]--></b:comment>'

Write-Host "Injecting eCommerce styles into head slot..."
$newXml = $rawXml.Replace($headAnchor, "$headAnchor`r`n$headCode")

Write-Host "Injecting eCommerce modals and engine into body slot..."
$newXml = $newXml.Replace($bodyAnchor, "$bodyAnchor`r`n$bodyCode")

Write-Host "Writing transformed theme to: $destPath"
[System.IO.File]::WriteAllText($destPath, $newXml, [System.Text.Encoding]::UTF8)

Write-Host "Validating XML file existence and size..."
$item = Get-Item $destPath
Write-Host "Success! File generated: $($item.FullName), Size: $($item.Length) bytes"
