# CHANGELOG - Taleemwaly Revenue Engine

## [1.0.0-ecom] - 2026-10-11
### Added
- Created `taleemwaly-ecommerce-theme.xml` converted from baseline Plus UI v3.7.0.
- Preserved pristine original backup `theme-backup-original.xml` (Zero overwrite guarantee).
- Injected lightweight mobile-first eCommerce styles into theme `<head>`:
  - Top store announcement bar.
  - Category horizontal filter chip bar (All Store, AIOU, 9th Class, 10th Class, Intermediate, Guess Papers 2026, Payments).
  - Product price cards, strikethrough regular prices, and verified badges.
  - Sticky bottom mobile checkout bar for instant single-product conversions.
  - Slide-in shopping cart drawer with live total calculation.
  - Modal order submission form with Trx ID input.
  - Quick-copy buttons for JazzCash and Easypaisa accounts.
- Injected vanilla JavaScript `TaleemwalyShop` engine:
  - `localStorage` multi-item shopping cart.
  - Direct 1-tap WhatsApp manifest checkout (`wa.me` URL with formatted item list & total).
  - Toast notifications and clipboard copying.
  - Academic integrity disclaimer box conforming to Global Rule 3.
- Created `/dev/apps-script/Code.gs` for automated order logging to Google Sheets and gated digital delivery.
- Created `/dev/setup-guide.md` with instructions on restoring theme and publishing product posts.
