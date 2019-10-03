Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F7DCADDD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 20:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADE96EA39;
	Thu,  3 Oct 2019 18:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9216EA37;
 Thu,  3 Oct 2019 18:12:39 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 11:12:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,253,1566889200"; d="scan'208";a="204043083"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 03 Oct 2019 11:12:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2019 21:12:33 +0300
Date: Thu, 3 Oct 2019 21:12:33 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <20191003181233.GR1208@intel.com>
References: <20191003175852.GA20662@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003175852.GA20662@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMTA6NTg6NTJBTSAtMDcwMCwgUm9kcmlnbyBWaXZpIHdy
b3RlOgo+IEhpIERhdmUgYW5kIERhbmllbCwKPiAKPiBJIGtub3cgeW91IGFyZSBvbiBYREMgYW5k
IEkgd2FzIGV2ZW4gY29uc2lkZXJpbmcgbm90IHNlbmQgYW55IHRoaXMgd2VlaywKPiBidXQgbGV0
IG1lIHNlbmQgdGhpcyBiZWZvcmUgSSBmb3JnZXQuCj4gCj4gVGhlcmUgYXJlIHRoZSBkcm0taW50
ZWwtbmV4dC1maXhlcyBwdWxsIHJlcXVlc3RzIHRoYXQgSSBoYWQgc2VudAo+IHRoYXQgYXJlIHN0
aWxsIG5lZWRlZCBhbmQgaXQgd291bGQgYmUgZ29vZCBpZiB5b3UgY291bGQgcHVsbCB0aG9zZS4K
PiAKPiBCZXNpZGVzIHdlIGhhdmUgbW9yZSAyIGZpeGVzIGhlcmUuCj4gCj4gSWYgbmVjZXNzYXJ5
IGFuZCBlYXNpZXIgSSBjYW4gc2VuZCBhbGwgZml4ZXMgdG9nZXRoZXIgbmV4dCB3ZWVrLCBpbmNs
dWRpbmcKPiB0aGUgb25lcyBtaXNzZWQgb24gLXJjMSBhbmQgdGhlc2Ugb25lcyBoZXJlIHBsdXMg
YW55IHVwY29taW5nLgo+IAo+IEp1c3QgbGV0IG1lIGtub3cgaG93IHlvdSBwcmVmZXIuCj4gCj4g
SGVyZSBnb2VzIGRybS1pbnRlbC1maXhlcy0yMDE5LTEwLTAzOgo+IAo+IC0gRml4IGRzYyBkcHAg
Y2FsY3VsYXRpb25zCj4gLSBGaXggZzR4IHNwcml0ZSBzY2FsaW5nIHN0cmlkZSBjaGVjayB3aXRo
IEdUVCByZW1hcHBpbmcKCldoZXJlIGlzIGU4MzhiZmE4ZTE3MCAoIlJldmVydCAiZHJtL2k5MTU6
IEZpeCBEUC1NU1QgY3J0Y19tYXNrIiIpID8KSSBjYW4ndCBzZWUgaXQgaW4gYW55IGZpeGVzIGJy
YW5jaC4gVGhhdCBuZWVkcyB0byBnZXQgaW4gQVNBUC4KCj4gCj4gVGhhbmtzLAo+IFJvZHJpZ28u
Cj4gCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA1NGVjYjhmNzAyOGM1ZWIz
ZDc0MGJiODJiMGYxZDkwZjJkZjYzYzVjOgo+IAo+ICAgTGludXggNS40LXJjMSAoMjAxOS0wOS0z
MCAxMDozNTo0MCAtMDcwMCkKPiAKPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9y
eSBhdDoKPiAKPiAgIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0taW50ZWwg
dGFncy9kcm0taW50ZWwtZml4ZXMtMjAxOS0xMC0wMwo+IAo+IGZvciB5b3UgdG8gZmV0Y2ggY2hh
bmdlcyB1cCB0byBlYjAxOTJmZWQwMTZkYjFjNWE5NzAxY2Q2Y2E0NzIzM2ZmNGE0M2U1Ogo+IAo+
ICAgZHJtL2k5MTU6IEZpeCBnNHggc3ByaXRlIHNjYWxpbmcgc3RyaWRlIGNoZWNrIHdpdGggR1RU
IHJlbWFwcGluZyAoMjAxOS0xMC0wMiAyMjoyMDozMyAtMDcwMCkKPiAKPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gLSBG
aXggZHNjIGRwcCBjYWxjdWxhdGlvbnMKPiAtIEZpeCBnNHggc3ByaXRlIHNjYWxpbmcgc3RyaWRl
IGNoZWNrIHdpdGggR1RUIHJlbWFwcGluZwo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBNYWFydGVuIExhbmtob3Jz
dCAoMSk6Cj4gICAgICAgZHJtL2k5MTUvZHA6IEZpeCBkc2MgYnBwIGNhbGN1bGF0aW9ucywgdjUu
Cj4gCj4gVmlsbGUgU3lyasOkbMOkICgxKToKPiAgICAgICBkcm0vaTkxNTogRml4IGc0eCBzcHJp
dGUgc2NhbGluZyBzdHJpZGUgY2hlY2sgd2l0aCBHVFQgcmVtYXBwaW5nCj4gCj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIHwgIDEyICstCj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5oIHwgICAyICstCj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyAgICAgIHwgMTg0ICsrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmgg
ICAgICB8ICAgNiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21z
dC5jICB8ICAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nwcml0
ZS5jICB8ICAgNSArLQo+ICA2IGZpbGVzIGNoYW5nZWQsIDExMCBpbnNlcnRpb25zKCspLCAxMDEg
ZGVsZXRpb25zKC0pCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkaW0tdG9vbHMgbWFpbGluZyBsaXN0Cj4gZGltLXRvb2xzQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZGltLXRvb2xzCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
