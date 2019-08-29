Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B10A11D8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 08:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570BB89F38;
	Thu, 29 Aug 2019 06:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A546B89EFF;
 Thu, 29 Aug 2019 06:37:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 23:37:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; d="scan'208";a="197734723"
Received: from alinassi-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.247])
 by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2019 23:37:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 29 Aug 2019 09:37:45 +0300
Message-ID: <87a7bseati.fsf@intel.com>
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhdmUgYW5kIERhbmllbCwgZml4ZXMgZm9yIHY1LjMtcmM3LCBhbGwgY2M6IHN0YWJsZS4K
CmRybS1pbnRlbC1maXhlcy0yMDE5LTA4LTI5Ogpkcm0vaTkxNSBmaXhlcyBmb3IgdjUuMy1yYzc6
Ci0gRml4IERQIE1TVCBtYXggQlBDIHByb3BlcnR5IGNyZWF0aW9uIGFmdGVyIERSTSByZWdpc3Rl
cgotIEZpeCB1bnVzZWQgZ2d0dCBkZWJhbGxvb25pbmcgYW5kIE5VTEwgZGVyZWZlcmVuY2UgaW4g
Z3Vlc3QKLSBGaXggRFNDIGVEUCB0cmFuc2NvZGVyIGlkZW50aWZpY2F0aW9uCi0gRml4IFdBUk4g
ZnJvbSBETUEgQVBJIGRlYnVnIGJ5IHNldHRpbmcgRE1BIG1heCBzZWdtZW50IHNpemUKCkJSLApK
YW5pLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBhNTVhYTg5YWFiOTBmYWU3
YzgxNWIwNTUxYjA3YmUzN2RiMzU5ZDc2OgoKICBMaW51eCA1LjMtcmM2ICgyMDE5LTA4LTI1IDEy
OjAxOjIzIC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cgog
IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0taW50ZWwgdGFncy9kcm0taW50
ZWwtZml4ZXMtMjAxOS0wOC0yOQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDMyZjBh
OTgyNjUwYjEyM2JkYWIzNjg2NTYxN2QzZTAzZWJjYWNmM2I6CgogIGRybS9pOTE1OiBDYWxsIGRt
YV9zZXRfbWF4X3NlZ19zaXplKCkgaW4gaTkxNV9kcml2ZXJfaHdfcHJvYmUoKSAoMjAxOS0wOC0y
NyAxMDo1NzozMiArMDMwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJtL2k5MTUgZml4ZXMgZm9yIHY1LjMtcmM3Ogot
IEZpeCBEUCBNU1QgbWF4IEJQQyBwcm9wZXJ0eSBjcmVhdGlvbiBhZnRlciBEUk0gcmVnaXN0ZXIK
LSBGaXggdW51c2VkIGdndHQgZGViYWxsb29uaW5nIGFuZCBOVUxMIGRlcmVmZXJlbmNlIGluIGd1
ZXN0Ci0gRml4IERTQyBlRFAgdHJhbnNjb2RlciBpZGVudGlmaWNhdGlvbgotIEZpeCBXQVJOIGZy
b20gRE1BIEFQSSBkZWJ1ZyBieSBzZXR0aW5nIERNQSBtYXggc2VnbWVudCBzaXplCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Ckx5dWRlIFBhdWwgKDEpOgogICAgICBkcm0vaTkxNTogQ2FsbCBkbWFfc2V0X21heF9zZWdfc2l6
ZSgpIGluIGk5MTVfZHJpdmVyX2h3X3Byb2JlKCkKCk1hbmFzaSBOYXZhcmUgKDEpOgogICAgICBk
cm0vaTkxNS9kcDogRml4IERTQyBlbmFibGUgY29kZSB0byB1c2UgY3B1X3RyYW5zY29kZXIgaW5z
dGVhZCBvZiBlbmNvZGVyLT50eXBlCgpWaWxsZSBTeXJqw6Rsw6QgKDEpOgogICAgICBkcm0vaTkx
NTogRG8gbm90IGNyZWF0ZSBhIG5ldyBtYXhfYnBjIHByb3AgZm9yIE1TVCBjb25uZWN0b3JzCgpY
aW9uZyBaaGFuZyAoMSk6CiAgICAgIGRybS9pOTE1OiBEb24ndCBkZWJhbGxvb24gdW51c2VkIGdn
dHQgZHJtX21tX25vZGUgaW4gbGludXggZ3Vlc3QKCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2RwX21zdC5jIHwgMTAgKysrKysrKysrLQogZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF92ZHNjLmMgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1
X2Rydi5jICAgICAgICAgICAgIHwgIDYgKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1
X3ZncHUuYyAgICAgICAgICAgIHwgIDMgKysrCiA0IGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNl
IEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
