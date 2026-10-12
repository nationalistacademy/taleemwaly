/**
 * TALEEMWALY REVENUE ENGINE - GOOGLE APPS SCRIPT
 * Handles automated order processing, Google Sheets logging,
 * and gated digital delivery link dispatch.
 */

// 1. CONFIGURATION
const CONFIG = {
  SHEET_NAME: "Orders",
  ADMIN_EMAIL: "support@taleemwaly.com",
  STORE_NAME: "Taleemwaly Education Store",
  WHATSAPP_ADMIN: "923702388998" // LIVE CONFIRMED
};

/**
 * Handle incoming web order from Blogger Storefront Form
 */
function doPost(e) {
  try {
    const sheet = getOrCreateOrdersSheet();
    const data = JSON.parse(e.postData.contents);

    const orderId = "TW-" + new Date().getTime().toString().slice(-6);
    const timestamp = new Date();
    const studentName = data.name || "N/A";
    const phone = data.phone || "N/A";
    const email = data.email || "N/A";
    const items = data.items || "N/A";
    const total = data.total || 0;
    const paymentMethod = data.paymentMethod || "Easypaisa (03702388998)";
    const trxId = data.trxId || "PENDING";
    const status = "Pending Verification";
    const gatedLink = getProductGatedLink(items);

    sheet.appendRow([
      timestamp,
      orderId,
      studentName,
      phone,
      email,
      items,
      total,
      paymentMethod,
      trxId,
      status,
      gatedLink
    ]);

    // Send Admin Notification Email
    sendAdminNotification(orderId, studentName, phone, items, total, trxId);

    return ContentService.createTextOutput(JSON.stringify({
      status: "success",
      orderId: orderId,
      message: "Order received. Verification in progress."
    })).setMimeType(ContentService.MimeType.JSON);

  } catch (error) {
    return ContentService.createTextOutput(JSON.stringify({
      status: "error",
      message: error.toString()
    })).setMimeType(ContentService.MimeType.JSON);
  }
}

/**
 * Helper to get or initialize Orders Sheet
 */
function getOrCreateOrdersSheet() {
  const ss = SpreadsheetApp.getActiveSpreadsheet();
  let sheet = ss.getSheetByName(CONFIG.SHEET_NAME);
  if (!sheet) {
    sheet = ss.insertSheet(CONFIG.SHEET_NAME);
    sheet.appendRow([
      "Timestamp",
      "Order ID",
      "Student Name",
      "WhatsApp Number",
      "Email Address",
      "Ordered Items / SKU",
      "Total (PKR)",
      "Payment Method",
      "Transaction ID (TID)",
      "Verification Status",
      "Gated Delivery Link"
    ]);
    sheet.getRange(1, 1, 1, 11).setFontWeight("bold").setBackground("#047857").setFontColor("#ffffff");
  }
  return sheet;
}

/**
 * Look up gated Google Drive folder/file link based on ordered SKU
 */
function getProductGatedLink(items) {
  if (items.indexOf("AIOU-9836") !== -1) {
    return "https://drive.google.com/drive/folders/[GATED_AIOU_9836_PLACEHOLDER]";
  } else if (items.indexOf("MATRIC-9TH") !== -1) {
    return "https://drive.google.com/drive/folders/[GATED_MATRIC_9TH_PLACEHOLDER]";
  }
  return "https://drive.google.com/drive/folders/[GATED_GENERAL_STORE_PLACEHOLDER]";
}

/**
 * Send Admin Notification
 */
function sendAdminNotification(orderId, name, phone, items, total, trxId) {
  try {
    const subject = `[New Order] ${orderId} - Rs. ${total} from ${name}`;
    const body = `Naya order receive hua hai!\n\n` +
      `Order ID: ${orderId}\n` +
      `Student Name: ${name}\n` +
      `WhatsApp: ${phone}\n` +
      `Items: ${items}\n` +
      `Total: Rs. ${total}\n` +
      `Trx ID: ${trxId}\n\n` +
      `Sheets check karein aur payment verify hone par file bhejen.`;
    
    MailApp.sendEmail(Session.getActiveUser().getEmail(), subject, body);
  } catch (err) {
    // Logging only
  }
}
