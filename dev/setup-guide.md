# Taleemwaly Storefront - Developer & Setup Guide
Last Updated: 2026-10-11
Author: Agent 5 (Blogger eCommerce Developer)

---

## 1. How to Upload the eCommerce Theme to Blogger

1. Go to your Blogger Dashboard: [https://www.blogger.com](https://www.blogger.com).
2. Select your blog: **Taleemwaly** (`https://taleemwaly.blogspot.com`).
3. In the left navigation menu, click **Theme** (تھیم).
4. Click the small arrow next to the orange **Customize** button and select **Restore** (بحال کریں).
5. Click **Upload** and choose the newly generated file:
   `taleemwaly-ecommerce-theme.xml`
6. Wait 5-10 seconds until Blogger displays *"Theme restored"*.
7. Refresh your website:
   - Notice the **Category Quick Filter Bar** below the header.
   - Notice the **Floating Shopping Cart Trigger** at the bottom-right.
   - Open any product post to see the **Sticky Mobile Buy Bar** and **WhatsApp Checkout Drawer**.

---

## 2. Setting Up Google Sheets for Automated Orders (Optional but Recommended)

1. Open [Google Sheets](https://sheets.new) and create a new blank spreadsheet named **Taleemwaly Orders 2026**.
2. Click **Extensions** > **Apps Script**.
3. Delete any default code in `Code.gs` and paste the contents of:
   [`g:/AIOU NATIONALIST ACADEMY/dev/apps-script/Code.gs`](file:///g:/AIOU%20NATIONALIST%20ACADEMY/dev/apps-script/Code.gs).
4. Update `WHATSAPP_ADMIN` and `ADMIN_EMAIL` with your actual contact details.
5. Click **Deploy** > **New deployment**:
   - Select type: **Web app**.
   - Description: `Taleemwaly Order Receiver`.
   - Execute as: **Me**.
   - Who has access: **Anyone** (ضروری ہے تاکہ بغیر لاگ ان کے آرڈر جمع ہو سکے).
6. Copy the generated Web App URL and paste it into the theme configuration or order form.

---

## 3. How to Create a Product Post in Blogger

When publishing a post for study notes or solved assignments, simply paste this HTML snippet at the bottom or top of your post in **HTML View**:

```html
<div class="tw-product-showcase" 
     data-sku="AIOU-9836" 
     data-title="AIOU Code 9836 Solved Assignment No. 1 (Autumn 2026)" 
     data-price="299" 
     data-regular-price="499">
  <div class="tw-product-header">
    <div class="tw-product-meta-tags">
      <span class="tw-pill">AIOU Autumn 2026</span>
      <span class="tw-pill" style="background:#d1fae5; color:#047857;">Syllabus Verified</span>
      <span class="tw-pill">SKU: AIOU-9836</span>
    </div>
    <h1 class="tw-product-title">AIOU Code 9836 Solved Assignment No. 1 (Autumn 2026)</h1>
  </div>

  <div class="tw-price-box">
    <div>
      <div class="tw-price-main">Rs. 299 <span style="font-size:14px; color:#6b7280; text-decoration:line-through;">Rs. 499</span></div>
      <div class="tw-price-discount">Save Rs. 200 (Special Semester Launch Offer)</div>
    </div>
    <div>
      <span class="tw-grid-badge tw-badge-verified">Instant Access</span>
    </div>
  </div>

  <div class="tw-compliance-box">
    <strong>Academic Reference Notice:</strong> This solved assignment is provided strictly as a study reference and learning guide. Students are advised to understand the concepts and submit their own original work.
  </div>

  <div style="display:flex; gap:10px; margin:16px 0; flex-wrap:wrap;">
    <button type="button" class="tw-btn-cart" onclick="TaleemwalyShop.addCurrentToCart()">
      🛒 Add to Cart
    </button>
    <a href="https://wa.me/923001234567?text=Salam%20Taleemwaly!%20I%20want%20to%20order%20AIOU%209836%20Solved%20Assignment%20for%20Rs.299." class="tw-btn-wa" target="_blank">
      💬 Buy Now via WhatsApp (Rs. 299)
    </a>
  </div>

  <div class="tw-payment-accounts">
    <div style="font-size:13px; font-weight:700; color:#047857; margin-bottom:8px;">Easy Payment Options (Pakistan)</div>
    <div class="tw-account-row">
      <div class="tw-account-name">JazzCash:</div>
      <div class="tw-account-val">
        <span>03001234567</span>
        <button class="tw-copy-btn" onclick="TaleemwalyShop.copyText('03001234567', 'JazzCash copied!')">Copy</button>
      </div>
    </div>
    <div class="tw-account-row">
      <div class="tw-account-name">Easypaisa:</div>
      <div class="tw-account-val">
        <span>03001234567</span>
        <button class="tw-copy-btn" onclick="TaleemwalyShop.copyText('03001234567', 'Easypaisa copied!')">Copy</button>
      </div>
    </div>
  </div>
</div>
```
