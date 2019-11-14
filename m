Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041DFFC8FF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 15:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939F56EAE5;
	Thu, 14 Nov 2019 14:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672506E992;
 Thu, 14 Nov 2019 14:35:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 06:35:37 -0800
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="198836815"
Received: from schmulew-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.58.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 06:35:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PULL] topic/drm-mipi-dsi-dsc-updates
In-Reply-To: <87tv7a4eq3.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87tv7a4eq3.fsf@intel.com>
Date: Thu, 14 Nov 2019 16:35:48 +0200
Message-ID: <87v9rm1q63.fsf@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Simha BN <simhavcs@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxMSBOb3YgMjAxOSwgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4g
d3JvdGU6Cj4gSGkgU2VhbiwgTWFhcnRlbiBhbmQgTWF4aW1lIC0KPgo+IEhlcmUncyB0aGUgdG9w
aWMgYnJhbmNoIGFib3V0IERTSSBjaGFuZ2VzIGFzIEkgd3JvdGUgaW4gWzFdLiBPbmNlIHlvdSd2
ZQo+IHB1bGxlZCB0aGlzIGluIGRybS1taXNjLCBJJ2xsIGZvbGxvdyBzdWl0IGluIGk5MTUuCgpQ
aW5nLgoKRldJVyBEYW5pZWwgYWNrZWQgdGhlIGFwcHJvYWNoIG9uIElSQy4KCkJSLApKYW5pLgoK
Cj4KPgo+IFRoYW5rcywKPiBKYW5pLgo+Cj4gWzFdIGh0dHA6Ly9tYXJjLmluZm8vP2k9ODdzZ216
NmN3MC5mc2ZAaW50ZWwuY29tCj4KPgo+Cj4gdG9waWMvZHJtLW1pcGktZHNpLWRzYy11cGRhdGVz
LTIwMTktMTEtMTE6Cj4gQ29yZSBDaGFuZ2VzOgo+IC0gVXBkYXRlIERTSSBkYXRhIHR5cGUgYW5k
IGNvbW1hbmQgZGVmaW5pdGlvbnMKPiAtIEFkZCBoZWxwZXJzIGZvciBzZW5kaW5nIGNvbXByZXNz
aW9uIG1vZGUgYW5kIFBQUyBwYWNrZXRzCj4KPiBEcml2ZXIgQ2hhbmdlczoKPiAtIFVwZGF0ZSB0
aW55L3N0NzU4NiB0byByZWZsZWN0IGEgZGVmaW5pdGlvbiBjaGFuZ2UKPgo+Cj4gVGhlIGZvbGxv
d2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA1NGVjYjhmNzAyOGM1ZWIzZDc0MGJiODJiMGYxZDkw
ZjJkZjYzYzVjOgo+Cj4gICBMaW51eCA1LjQtcmMxICgyMDE5LTA5LTMwIDEwOjM1OjQwIC0wNzAw
KQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGdpdDov
L2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0taW50ZWwgdGFncy90b3BpYy9kcm0tbWlw
aS1kc2ktZHNjLXVwZGF0ZXMtMjAxOS0xMS0xMQo+Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIGY0ZGVhMWFhYTlhMTI0ODZmNTgxM2ZhZGE1NzQxOTJmZWIzODUwY2Q6Cj4KPiAgIGRy
bS9kc2k6IGFkZCBoZWxwZXJzIGZvciBEU0kgY29tcHJlc3Npb24gbW9kZSBhbmQgUFBTIHBhY2tl
dHMgKDIwMTktMTEtMDcgMTU6MDA6MTYgKzAyMDApCj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gQ29yZSBDaGFuZ2Vz
Ogo+IC0gVXBkYXRlIERTSSBkYXRhIHR5cGUgYW5kIGNvbW1hbmQgZGVmaW5pdGlvbnMKPiAtIEFk
ZCBoZWxwZXJzIGZvciBzZW5kaW5nIGNvbXByZXNzaW9uIG1vZGUgYW5kIFBQUyBwYWNrZXRzCj4K
PiBEcml2ZXIgQ2hhbmdlczoKPiAtIFVwZGF0ZSB0aW55L3N0NzU4NiB0byByZWZsZWN0IGEgZGVm
aW5pdGlvbiBjaGFuZ2UKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBKYW5pIE5pa3VsYSAoNSk6Cj4gICAgICAgZHJt
L2RzaTogY2xlYW4gdXAgRFNJIGRhdGEgdHlwZSBkZWZpbml0aW9ucwo+ICAgICAgIGRybS9kc2k6
IGFkZCBtaXNzaW5nIERTSSBkYXRhIHR5cGVzCj4gICAgICAgZHJtL2RzaTogYWRkIG1pc3Npbmcg
RFNJIERDUyBjb21tYW5kcwo+ICAgICAgIGRybS9kc2k6IHJlbmFtZSBNSVBJX0RDU19TRVRfUEFS
VElBTF9BUkVBIHRvIE1JUElfRENTX1NFVF9QQVJUSUFMX1JPV1MKPiAgICAgICBkcm0vZHNpOiBh
ZGQgaGVscGVycyBmb3IgRFNJIGNvbXByZXNzaW9uIG1vZGUgYW5kIFBQUyBwYWNrZXRzCj4KPiAg
ZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RzaS5jIHwgNTcgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS90aW55L3N0NzU4Ni5jICB8
ICAyICstCj4gIGluY2x1ZGUvZHJtL2RybV9taXBpX2RzaS5oICAgICB8ICA0ICsrKwo+ICBpbmNs
dWRlL3ZpZGVvL21pcGlfZGlzcGxheS5oICAgfCAyNCArKysrKysrKysrKysrLS0tLS0KPiAgNCBm
aWxlcyBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKLS0gCkphbmkg
TmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
