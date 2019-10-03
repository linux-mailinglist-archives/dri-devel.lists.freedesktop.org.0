Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF927CAF58
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 21:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C46D6EA6A;
	Thu,  3 Oct 2019 19:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2186EA68;
 Thu,  3 Oct 2019 19:37:16 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 12:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,253,1566889200"; d="scan'208";a="196444159"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 03 Oct 2019 12:37:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2019 22:37:11 +0300
Date: Thu, 3 Oct 2019 22:37:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PULL] drm-intel-fixes
Message-ID: <20191003193711.GS1208@intel.com>
References: <20191003193051.GA26421@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003193051.GA26421@intel.com>
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
 dri-devel@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMTI6MzA6NTFQTSAtMDcwMCwgUm9kcmlnbyBWaXZpIHdy
b3RlOgo+IEhpIERhdmUgYW5kIERhbmllbCwKPiAKPiBUaGlzIHYyIGNvbnRhaW5zIGEgY3JpdGlj
YWwgRFAtTVNUIGZpeCB0aGF0IGl0IHdvdWxkIGJlIHJlYWxseSBnb29kIHRvIGJlCj4gcHJvcGFn
YXRlZCBhcyBzb29uIGFzIHBvc3NpYmxlLgo+IAo+IEJlc2lkZXMgYWxsIHRoZSBkcm0taW50ZWwt
bmV4dC1maXhlcyB0aGF0IEkgbWVudGlvbmVkIG9uIHByZXZpb3VzIGVtYWlsLgo+IAo+IEhlcmUg
Z29lcyBkcm0taW50ZWwtZml4ZXMtMjAxOS0xMC0wMy0xOgo+IC0gRml4IERQLU1TVCBjcnRjX21h
c2sKPiAtIEZpeCBkc2MgZHBwIGNhbGN1bGF0aW9ucwo+IC0gRml4IGc0eCBzcHJpdGUgc2NhbGlu
ZyBzdHJpZGUgY2hlY2sgd2l0aCBHVFQgcmVtYXBwaW5nCj4gCj4gU2hvcnQgc3VtbWFyeSBvZiBm
aXhlcyBwdWxsIChsZXNzIHRoYW4gd2hhdCBnaXQgc2hvcnRsb2cgcHJvdmlkZXMpOgo+IC0gZXhw
bGFpbiBhbnl0aGluZyBub24tZml4ZXMgKGUuZy4gY2xlYW51cHMpIGFuZCB3aHkgaXQncyBhcHBy
b3ByaWF0ZQo+IC0gaGlnaGxpZ2h0IHJlZ3Jlc3Npb25zCj4gLSBzdW1tYXJpemUgcHVsbCByZXF1
ZXN0cyBjb250YWluZWQKPiBUaGlzIHNob3VsZG4ndCBiZSBtb3JlIHRoYW4gYSBmZXcgbGluZXMg
KG9yIGl0IGluZGljYXRlcyB5b3VyIGZpeGVzIHB1bGwgaXMgYQo+IGJpdCB0b28gYmlnKS4KPiAK
PiBUaGFua3MsCj4gUm9kcmlnby4KPiAKPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29t
bWl0IDU0ZWNiOGY3MDI4YzVlYjNkNzQwYmI4MmIwZjFkOTBmMmRmNjNjNWM6Cj4gCj4gICBMaW51
eCA1LjQtcmMxICgyMDE5LTA5LTMwIDEwOjM1OjQwIC0wNzAwKQo+IAo+IGFyZSBhdmFpbGFibGUg
aW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+IAo+ICAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3Rv
cC5vcmcvZHJtL2RybS1pbnRlbCB0YWdzL2RybS1pbnRlbC1maXhlcy0yMDE5LTEwLTAzLTEKPiAK
PiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNDg1ZjY4MmJlOWZjOGQ0MTM3NjkzNmEz
YjAxNDIzZWRkMDdiOWE3NToKPiAKPiAgIFJldmVydCAiZHJtL2k5MTU6IEZpeCBEUC1NU1QgY3J0
Y19tYXNrIiAoMjAxOS0xMC0wMyAxMjoyMzowNyAtMDcwMCkKPiAKPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gLSBGaXgg
RFAtTVNUIGNydGNfbWFzawo+IC0gRml4IGRzYyBkcHAgY2FsY3VsYXRpb25zCj4gLSBGaXggZzR4
IHNwcml0ZSBzY2FsaW5nIHN0cmlkZSBjaGVjayB3aXRoIEdUVCByZW1hcHBpbmcKPiAKPiBTaG9y
dCBzdW1tYXJ5IG9mIGZpeGVzIHB1bGwgKGxlc3MgdGhhbiB3aGF0IGdpdCBzaG9ydGxvZyBwcm92
aWRlcyk6Cj4gLSBleHBsYWluIGFueXRoaW5nIG5vbi1maXhlcyAoZS5nLiBjbGVhbnVwcykgYW5k
IHdoeSBpdCdzIGFwcHJvcHJpYXRlCj4gLSBoaWdobGlnaHQgcmVncmVzc2lvbnMKPiAtIHN1bW1h
cml6ZSBwdWxsIHJlcXVlc3RzIGNvbnRhaW5lZAo+IFRoaXMgc2hvdWxkbid0IGJlIG1vcmUgdGhh
biBhIGZldyBsaW5lcyAob3IgaXQgaW5kaWNhdGVzIHlvdXIgZml4ZXMgcHVsbCBpcyBhCj4gYml0
IHRvbyBiaWcpLgo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBNYWFydGVuIExhbmtob3JzdCAoMSk6Cj4gICAgICAg
ZHJtL2k5MTUvZHA6IEZpeCBkc2MgYnBwIGNhbGN1bGF0aW9ucywgdjUuCj4gCj4gVmlsbGUgU3ly
asOkbMOkICgyKToKPiAgICAgICBkcm0vaTkxNTogRml4IGc0eCBzcHJpdGUgc2NhbGluZyBzdHJp
ZGUgY2hlY2sgd2l0aCBHVFQgcmVtYXBwaW5nCj4gICAgICAgUmV2ZXJ0ICJkcm0vaTkxNTogRml4
IERQLU1TVCBjcnRjX21hc2siCgpOb3cgSSBjYW4gc2xlZXAgYmV0dGVyIDopIFRoYW5rcyBmb3Ig
cmVzcGlubmluZy4KCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheS5jIHwgIDEyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheS5oIHwgICAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAu
YyAgICAgIHwgMTg0ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmggICAgICB8ICAgNiArLQo+ICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jICB8ICAgNCArLQo+ICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nwcml0ZS5jICB8ICAgNSArLQo+ICA2IGZpbGVzIGNoYW5n
ZWQsIDExMSBpbnNlcnRpb25zKCspLCAxMDIgZGVsZXRpb25zKC0pCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBJbnRlbC1nZnggbWFpbGluZyBsaXN0
Cj4gSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4CgotLSAKVmlsbGUgU3lyasOkbMOk
CkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
