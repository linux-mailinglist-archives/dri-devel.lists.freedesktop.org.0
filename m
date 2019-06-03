Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F90A33105
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 15:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E14891A4;
	Mon,  3 Jun 2019 13:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B05891A4;
 Mon,  3 Jun 2019 13:29:33 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 06:29:33 -0700
X-ExtLoop1: 1
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.3.73])
 by fmsmga004.fm.intel.com with ESMTP; 03 Jun 2019 06:29:29 -0700
Date: Mon, 3 Jun 2019 16:29:29 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20190603132928.GA4866@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
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

SGkgRGF2ZSAmIERhbmllbCwKCk1pc3NlZCBsYXN0IHdlZWsncyB3aW5kb3cgb2Ygb3Bwb3J0dW5p
dHkgZHVlIHRvIHRyb3VibGUgZ2V0dGluZwpDSSByZXN1bHRzIGZvciBJY2VsYWtlLiBTbyB0aGlz
IGlzIGFnYWluc3QgLXJjMiBzdGlsbCB0byBhdm9pZApyZS1kb2luZyB0aGUgR1ZUIHB1bGwgdGhp
cmQgdGltZS4KCkp1c3QgYSBzaW5nbGUgSWNlbGFrZSBXL0EgZm9yIGk5MTUuIEZvciBHVlQgYSBm
aXggZm9yIHJlY2VudGx5CnNlZW4gYXJiaXRyYXJ5IERNQSBtYXAgZmF1bHQgYW5kIG1vcmUgZW5m
b3JjZW1lbnQgZml4ZXMuCgpJJ2xsIGJlIG9uIG15IHN1bW1lciB2YWNhdGlvbiBzdGFydGluZyBl
bmQgb2YgdGhpcyB3ZWVrLCBzbwpKYW5pL1JvZHJpZ28gd2lsbCBjb3ZlciBmb3IgdGhlIHJlc3Qg
b2YgdGhlIC1yY3MuCgpSZWdhcmRzLCBKb29uYXMKCioqKgoKZHJtLWludGVsLWZpeGVzLTIwMTkt
MDYtMDM6CgotIEFkZCBtaXNzaW5nIEljZWxha2UgVy9BIHRvIGRpc2FibGUgR1BVIGhhbmcgb24g
Y2FjaGUgRUNDIGVycm9yCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGNkNmM4
NGQ4ZjBjZGM5MTFkZjQzNWJiMDc1YmEyMmNlM2M2MDViMDc6CgogIExpbnV4IDUuMi1yYzIgKDIw
MTktMDUtMjYgMTY6NDk6MTkgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1pbnRlbCB0
YWdzL2RybS1pbnRlbC1maXhlcy0yMDE5LTA2LTAzCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gYWZiMjg2YmNhZTg1ZWU4MTZlODQ5NzU5NmJmOGU3ZjgzMzQ3ZjQ3YjoKCiAgTWVyZ2Ug
dGFnICdndnQtZml4ZXMtMjAxOS0wNS0zMCcgb2YgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2d2
dC1saW51eCBpbnRvIGRybS1pbnRlbC1maXhlcyAoMjAxOS0wNS0zMSAxMDo1MTo1OSArMDMwMCkK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KLSBBZGQgbWlzc2luZyBJY2VsYWtlIFcvQSB0byBkaXNhYmxlIEdQVSBoYW5nIG9u
IGNhY2hlIEVDQyBlcnJvcgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpDb2xpbiBYdSAoMyk6CiAgICAgIGRybS9pOTE1L2d2
dDogVXBkYXRlIGZvcmNlLXRvLW5vbnByaXYgcmVnaXN0ZXIgd2hpdGVsaXN0CiAgICAgIGRybS9p
OTE1L2d2dDogRml4IEdGWF9NT0RFIGhhbmRsaW5nCiAgICAgIGRybS9pOTE1L2d2dDogRml4IHZH
UFUgQ1NGRV9DSElDS0VOMV9SRUcgbW1pbyBoYW5kbGVyCgpHYW8sIEZyZWQgKDEpOgogICAgICBk
cm0vaTkxNS9ndnQ6IEZpeCBjbWQgbGVuZ3RoIG9mIFZFQl9ESV9JRUNQCgpKb29uYXMgTGFodGlu
ZW4gKDEpOgogICAgICBNZXJnZSB0YWcgJ2d2dC1maXhlcy0yMDE5LTA1LTMwJyBvZiBodHRwczov
L2dpdGh1Yi5jb20vaW50ZWwvZ3Z0LWxpbnV4IGludG8gZHJtLWludGVsLWZpeGVzCgpUaW5hIFpo
YW5nICgxKToKICAgICAgZHJtL2k5MTUvZ3Z0OiBJbml0aWFsaXplIGludGVsX2d2dF9ndHRfZW50
cnkgaW4gc3RhY2sKClR2cnRrbyBVcnN1bGluICgxKToKICAgICAgZHJtL2k5MTUvaWNsOiBBZGQg
V2FEaXNhYmxlQmFua0hhbmdNb2RlCgpYaW9uZyBaaGFuZyAoMSk6CiAgICAgIGRybS9pOTE1L2d2
dDogcmVmaW5lIGdndHQgcmFuZ2UgdmFsaWRhdGlvbgoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9jbWRfcGFyc2VyLmMgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5j
ICAgICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKy0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvaGFuZGxlcnMuYyAgICAgIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggICAgICAgICAgfCAgMyArKysK
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3dvcmthcm91bmRzLmMgfCAgNiArKysrKysKIDUg
ZmlsZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
