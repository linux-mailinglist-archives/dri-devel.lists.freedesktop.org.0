Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C927FB4F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6D96EE64;
	Fri,  2 Aug 2019 13:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE24D6EE60;
 Fri,  2 Aug 2019 13:43:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 06:43:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,338,1559545200"; d="scan'208";a="174926931"
Received: from mlankhor-desk.ger.corp.intel.com (HELO [10.252.38.58])
 ([10.252.38.58])
 by fmsmga007.fm.intel.com with ESMTP; 02 Aug 2019 06:43:49 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <af0dc371-16e0-cee8-0d71-4824d44aa973@linux.intel.com>
Date: Fri, 2 Aug 2019 15:43:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dim-tools@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5LAoKQml0IGxhdGUsIGJ1dCBmaXhlcyBmb3IgdjUuMy1yYzMuIDopCgpkcm0tbWlzYy1maXhl
cy0yMDE5LTA4LTAyOgpkcm0tbWlzYy1maXhlcyBmb3IgdjUuMy1yYzM6Ci0gRml4IHNvbWUgYnVp
bGQgZXJyb3JzIGluIGRybS9icmlkZ2UuCi0gRG8gbm90IGJ1aWxkIGk4MTAgb24gQ09ORklHX1BS
RUVNUFRJT04uCi0gRml4IGNhY2hlIHN5bmMgb24gYXJtIGluIHZnZW0uCi0gQWxsb3cgbWFwcGlu
ZyBmYiBpbiBkcm1fY2xpZW50IG9ubHkgd2hlbiByZXF1aXJlZCwgYW5kIHVzZSBpdCB0byBmaXgg
Ym9jaHMgZmJkZXYuClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNjA5NDg4YmM5
NzlmOTlmODA1ZjM0ZTlhMzJjMWUzYjcxMTc5ZDEwYjoKCiAgTGludXggNS4zLXJjMiAoMjAxOS0w
Ny0yOCAxMjo0NzowMiAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5
IGF0OgoKICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MgdGFncy9k
cm0tbWlzYy1maXhlcy0yMDE5LTA4LTAyCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8g
NTg1NDA1OTQ1NzA3NzhmZDE0OWNkOGM5YjJiZmY2MWYyY2VmYThjOToKCiAgZHJtL2JvY2hzOiBV
c2Ugc2hhZG93IGJ1ZmZlciBmb3IgYm9jaHMgZnJhbWVidWZmZXIgY29uc29sZSAoMjAxOS0wOC0w
MSAxNTowMTo0MiArMDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJtLW1pc2MtZml4ZXMgZm9yIHY1LjMtcmMzOgot
IEZpeCBzb21lIGJ1aWxkIGVycm9ycyBpbiBkcm0vYnJpZGdlLgotIERvIG5vdCBidWlsZCBpODEw
IG9uIENPTkZJR19QUkVFTVBUSU9OLgotIEZpeCBjYWNoZSBzeW5jIG9uIGFybSBpbiB2Z2VtLgot
IEFsbG93IG1hcHBpbmcgZmIgaW4gZHJtX2NsaWVudCBvbmx5IHdoZW4gcmVxdWlyZWQsIGFuZCB1
c2UgaXQgdG8gZml4IGJvY2hzIGZiZGV2LgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNYWFydGVuIExhbmtob3JzdCAoMSk6
CiAgICAgIE1lcmdlIHRhZyAndjUuMy1yYzInIGludG8gZHJtLW1pc2MtZml4ZXMKClJvYiBDbGFy
ayAoMSk6CiAgICAgIGRybS92Z2VtOiBmaXggY2FjaGUgc3luY2hyb25pemF0aW9uIG9uIGFybS9h
cm02NAoKVGhvbWFzIEdsZWl4bmVyICgxKToKICAgICAgZHJtL2k4MTA6IFVzZSBDT05GSUdfUFJF
RU1QVElPTgoKVGhvbWFzIFppbW1lcm1hbm4gKDQpOgogICAgICBkcm0vY2xpZW50OiBTdXBwb3J0
IHVubWFwcGluZyBvZiBEUk0gY2xpZW50IGJ1ZmZlcnMKICAgICAgZHJtL2ZiLWhlbHBlcjogTWFw
IERSTSBjbGllbnQgYnVmZmVyIG9ubHkgd2hlbiByZXF1aXJlZAogICAgICBkcm0vZmItaGVscGVy
OiBJbnN0YW5jaWF0ZSBzaGFkb3cgRkIgaWYgY29uZmlndXJlZCBpbiBkZXZpY2UncyBtb2RlX2Nv
bmZpZwogICAgICBkcm0vYm9jaHM6IFVzZSBzaGFkb3cgYnVmZmVyIGZvciBib2NocyBmcmFtZWJ1
ZmZlciBjb25zb2xlCgpZdWVIYWliaW5nICgyKToKICAgICAgZHJtL2JyaWRnZTogbHZkcy1lbmNv
ZGVyOiBGaXggYnVpbGQgZXJyb3Igd2hpbGUgQ09ORklHX0RSTV9LTVNfSEVMUEVSPW0KICAgICAg
ZHJtL2JyaWRnZTogdGMzNTg3NjQ6IEZpeCBidWlsZCBlcnJvcgoKIGRyaXZlcnMvZ3B1L2RybS9L
Y29uZmlnICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2tt
cy5jIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZyAgICB8ICAgNCArLQog
ZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnQuYyAgICAgIHwgIDYwICsrKysrKysrKysrKysrLS0t
LQogZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyAgIHwgIDUxICsrKysrKysrKysrLS0t
LQogZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYyAgIHwgMTMwICsrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiBpbmNsdWRlL2RybS9kcm1fY2xpZW50LmggICAgICAg
ICAgfCAgIDIgKwogaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggICAgIHwgICA3ICsrCiA4
IGZpbGVzIGNoYW5nZWQsIDE4NiBpbnNlcnRpb25zKCspLCA3MSBkZWxldGlvbnMoLSkKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
