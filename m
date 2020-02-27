Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB4E1710D0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 07:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60176E43B;
	Thu, 27 Feb 2020 06:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6760B6E43B;
 Thu, 27 Feb 2020 06:04:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 22:04:14 -0800
X-IronPort-AV: E=Sophos;i="5.70,490,1574150400"; d="scan'208";a="231703581"
Received: from lohmeies-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.249])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 22:04:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 27 Feb 2020 08:04:31 +0200
Message-ID: <874kvcsh00.fsf@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhdmUgJiBEYW5pZWwgLQoKU3dpdGNoaW5nIGdlbjcgYmFjayB0byBhbGlhc2luZy1wcGd0
dCBzZWVtcyB0byBiZSB0aGUgbWFpbiBoaWdobGlnaHQKaGVyZS4KCkJSLApKYW5pLgoKCmRybS1p
bnRlbC1maXhlcy0yMDIwLTAyLTI3Ogpkcm0vaTkxNSBmaXhlcyBmb3IgdjUuNi1yYzQ6Ci0gZG93
bmdyYWRlIGdlbjcgYmFjayB0byBhbGlhc2luZy1wcGd0dCB0byBhdm9pZCBHUFUgaGFuZ3MKLSBz
aHJpbmtlciBmaXgKLSBwbXUgbGVhayBhbmQgZG91YmxlIGZyZWUgZml4ZXMKLSBndnQgdXNlciBh
ZnRlciBmcmVlIGFuZCB2aXJ0dWFsIGRpc3BsYXkgcmVzZXQgZml4ZXMKLSByYW5kY29uZmlnIGJ1
aWxkIGZpeAoKQlIsCkphbmkuCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGY4
Nzg4ZDg2YWIyOGY2MWY3YjQ2ZWI2YmUzNzVmOGE3MjY3ODM2MzY6CgogIExpbnV4IDUuNi1yYzMg
KDIwMjAtMDItMjMgMTY6MTc6NDIgLTA4MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1pbnRl
bCB0YWdzL2RybS1pbnRlbC1maXhlcy0yMDIwLTAyLTI3Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5n
ZXMgdXAgdG8gOGU5YTQwMGM3MDZlZTViY2JjMDUyZDNlYzlmODdjZmRiYmQzZjVjYjoKCiAgTWVy
Z2UgdGFnICdndnQtZml4ZXMtMjAyMC0wMi0yNicgb2YgaHR0cHM6Ly9naXRodWIuY29tL2ludGVs
L2d2dC1saW51eCBpbnRvIGRybS1pbnRlbC1maXhlcyAoMjAyMC0wMi0yNiAyMjo1ODoyNSArMDIw
MCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KZHJtL2k5MTUgZml4ZXMgZm9yIHY1LjYtcmM0OgotIGRvd25ncmFkZSBnZW43
IGJhY2sgdG8gYWxpYXNpbmctcHBndHQgdG8gYXZvaWQgR1BVIGhhbmdzCi0gc2hyaW5rZXIgZml4
Ci0gcG11IGxlYWsgYW5kIGRvdWJsZSBmcmVlIGZpeGVzCi0gZ3Z0IHVzZXIgYWZ0ZXIgZnJlZSBh
bmQgdmlydHVhbCBkaXNwbGF5IHJlc2V0IGZpeGVzCi0gcmFuZGNvbmZpZyBidWlsZCBmaXgKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KQ2hyaXMgV2lsc29uICgyKToKICAgICAgZHJtL2k5MTUvZ3R0OiBEb3duZ3JhZGUgZ2Vu
NyAoaXZiLCBieXQsIGhzdykgYmFjayB0byBhbGlhc2luZy1wcGd0dAogICAgICBkcm0vaTkxNTog
QXZvaWQgcmVjdXJzaW5nIG9udG8gYWN0aXZlIHZtYSBmcm9tIHRoZSBzaHJpbmtlcgoKSmFuaSBO
aWt1bGEgKDIpOgogICAgICBkcm0vaTkxNTogZml4IGhlYWRlciB0ZXN0IHdpdGggR0NPVgogICAg
ICBNZXJnZSB0YWcgJ2d2dC1maXhlcy0yMDIwLTAyLTI2JyBvZiBodHRwczovL2dpdGh1Yi5jb20v
aW50ZWwvZ3Z0LWxpbnV4IGludG8gZHJtLWludGVsLWZpeGVzCgpNaWNoYcWCIFdpbmlhcnNraSAo
Mik6CiAgICAgIGRybS9pOTE1L3BtdTogQXZvaWQgdXNpbmcgZ2xvYmFscyBmb3IgQ1BVIGhvdHBs
dWcgc3RhdGUKICAgICAgZHJtL2k5MTUvcG11OiBBdm9pZCB1c2luZyBnbG9iYWxzIGZvciBQTVUg
ZXZlbnRzCgpUaW5hIFpoYW5nICgyKToKICAgICAgZHJtL2k5MTUvZ3Z0OiBTZXBhcmF0ZSBkaXNw
bGF5IHJlc2V0IGZyb20gQUxMX0VOR0lORVMgcmVzZXQKICAgICAgZHJtL2k5MTUvZ3Z0OiBGaXgg
b3JwaGFuIHZncHUgZG1hYnVmX29ianMnIGxpZmV0aW1lCgogZHJpdmVycy9ncHUvZHJtL2k5MTUv
TWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX3Nocmlua2VyLmMgfCAgNCArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Rt
YWJ1Zi5jICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUu
YyAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wY2kuYyAg
ICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wbXUuYyAgICAg
ICAgICAgICAgfCA1OSArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9pOTE1X3BtdS5oICAgICAgICAgICAgICB8IDExICsrKysrLQogNyBmaWxlcyBjaGFu
Z2VkLCA0NiBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkKCi0tIApKYW5pIE5pa3VsYSwg
SW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
