Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFFD434A9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 11:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5056289829;
	Thu, 13 Jun 2019 09:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1540F89829;
 Thu, 13 Jun 2019 09:29:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 02:29:43 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 13 Jun 2019 02:29:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 13 Jun 2019 12:32:39 +0300
Message-ID: <87y325x22w.fsf@intel.com>
MIME-Version: 1.0
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
Cc: , dim-tools@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhdmUsIERhbmllbCwgb24gYmVoYWxmIG9mIEpvb25hcywKCmRybS1pbnRlbC1maXhlcy0y
MDE5LTA2LTEzOgpkcm0vaTkxNSBmaXhlcyBmb3IgdjUuMi1yYzU6Ci0gRml4IERNQyBmaXJtd2Fy
ZSBpbnB1dCB2YWxpZGF0aW9uIHRvIGF2b2lkIGJ1ZmZlciBvdmVyZmxvdwotIEZpeCBwZXJmIHJl
Z2lzdGVyIGFjY2VzcyB3aGl0ZWxpc3QgZm9yIHVzZXJzcGFjZQotIEZpeCBEU0kgcGFuZWwgb24g
R1BEIE1pY3JvUEMKLSBGaXggcGVyLXBpeGVsIGFscGhhIHdpdGggQ0NTCi0gRml4IEhETUkgYXVk
aW8gZm9yIFNEVk8KCkJSLApKYW5pLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1p
dCBkMWZkYjZkOGY2YTQxMDlhNDI2MzE3NmM4NGI4OTkwNzZhNWY4MDA4OgoKICBMaW51eCA1LjIt
cmM0ICgyMDE5LTA2LTA4IDIwOjI0OjQ2IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0
IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0t
aW50ZWwgdGFncy9kcm0taW50ZWwtZml4ZXMtMjAxOS0wNi0xMwoKZm9yIHlvdSB0byBmZXRjaCBj
aGFuZ2VzIHVwIHRvIGM1Y2MwYmY4NzBjZmI4MGIyNzg5OWU5MTZiNDM5N2NlMTFjNjFkOTY6Cgog
IGRybS9pOTE1L3BlcmY6IGZpeCB3aGl0ZWxpc3Qgb24gR2VuMTArICgyMDE5LTA2LTEyIDEwOjQy
OjIyICswMzAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpkcm0vaTkxNSBmaXhlcyBmb3IgdjUuMi1yYzU6Ci0gRml4IERN
QyBmaXJtd2FyZSBpbnB1dCB2YWxpZGF0aW9uIHRvIGF2b2lkIGJ1ZmZlciBvdmVyZmxvdwotIEZp
eCBwZXJmIHJlZ2lzdGVyIGFjY2VzcyB3aGl0ZWxpc3QgZm9yIHVzZXJzcGFjZQotIEZpeCBEU0kg
cGFuZWwgb24gR1BEIE1pY3JvUEMKLSBGaXggcGVyLXBpeGVsIGFscGhhIHdpdGggQ0NTCi0gRml4
IEhETUkgYXVkaW8gZm9yIFNEVk8KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSGFucyBkZSBHb2VkZSAoMSk6CiAgICAgIGRy
bS9pOTE1L2RzaTogVXNlIGEgZnV6enkgY2hlY2sgZm9yIGJ1cnN0IG1vZGUgY2xvY2sgY2hlY2sK
Ckxpb25lbCBMYW5kd2VybGluICgxKToKICAgICAgZHJtL2k5MTUvcGVyZjogZml4IHdoaXRlbGlz
dCBvbiBHZW4xMCsKCkx1Y2FzIERlIE1hcmNoaSAoMSk6CiAgICAgIGRybS9pOTE1L2RtYzogcHJv
dGVjdCBhZ2FpbnN0IHJlYWRpbmcgcmFuZG9tIG1lbW9yeQoKVmlsbGUgU3lyasOkbMOkICgyKToK
ICAgICAgZHJtL2k5MTU6IEZpeCBwZXItcGl4ZWwgYWxwaGEgd2l0aCBDQ1MKICAgICAgZHJtL2k5
MTUvc2R2bzogSW1wbGVtZW50IHByb3BlciBIRE1JIGF1ZGlvIHN1cHBvcnQgZm9yIFNEVk8KCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3BlcmYuYyAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfcmVnLmggICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUv
aW50ZWxfY3NyLmMgICAgICAgfCAxOCArKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUv
aW50ZWxfZGlzcGxheS5jICAgfCAxNCArKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50
ZWxfZHJ2LmggICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kc2lfdmJ0
LmMgICB8IDExICsrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3Nkdm8uYyAgICAg
IHwgNTggKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQogZHJpdmVycy9ncHUvZHJt
L2k5MTUvaW50ZWxfc2R2b19yZWdzLmggfCAgMyArKwogOCBmaWxlcyBjaGFuZ2VkLCA5MSBpbnNl
cnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBT
b3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
