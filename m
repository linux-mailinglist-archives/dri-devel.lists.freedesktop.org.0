Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1700FCAF91
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 21:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1F46EA72;
	Thu,  3 Oct 2019 19:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77F66EA69;
 Thu,  3 Oct 2019 19:52:16 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 12:52:16 -0700
X-IronPort-AV: E=Sophos;i="5.67,253,1566889200"; d="scan'208";a="186020879"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Oct 2019 12:52:16 -0700
Date: Thu, 3 Oct 2019 12:52:45 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] drm-intel-fixes
Message-ID: <20191003195245.GB17892@intel.com>
References: <20191003193051.GA26421@intel.com>
 <20191003193711.GS1208@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003193711.GS1208@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMTA6Mzc6MTFQTSArMDMwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIFRodSwgT2N0IDAzLCAyMDE5IGF0IDEyOjMwOjUxUE0gLTA3MDAsIFJvZHJp
Z28gVml2aSB3cm90ZToKPiA+IEhpIERhdmUgYW5kIERhbmllbCwKPiA+IAo+ID4gVGhpcyB2MiBj
b250YWlucyBhIGNyaXRpY2FsIERQLU1TVCBmaXggdGhhdCBpdCB3b3VsZCBiZSByZWFsbHkgZ29v
ZCB0byBiZQo+ID4gcHJvcGFnYXRlZCBhcyBzb29uIGFzIHBvc3NpYmxlLgo+ID4gCj4gPiBCZXNp
ZGVzIGFsbCB0aGUgZHJtLWludGVsLW5leHQtZml4ZXMgdGhhdCBJIG1lbnRpb25lZCBvbiBwcmV2
aW91cyBlbWFpbC4KPiA+IAo+ID4gSGVyZSBnb2VzIGRybS1pbnRlbC1maXhlcy0yMDE5LTEwLTAz
LTE6Cj4gPiAtIEZpeCBEUC1NU1QgY3J0Y19tYXNrCj4gPiAtIEZpeCBkc2MgZHBwIGNhbGN1bGF0
aW9ucwo+ID4gLSBGaXggZzR4IHNwcml0ZSBzY2FsaW5nIHN0cmlkZSBjaGVjayB3aXRoIEdUVCBy
ZW1hcHBpbmcKPiA+IAo+ID4gU2hvcnQgc3VtbWFyeSBvZiBmaXhlcyBwdWxsIChsZXNzIHRoYW4g
d2hhdCBnaXQgc2hvcnRsb2cgcHJvdmlkZXMpOgo+ID4gLSBleHBsYWluIGFueXRoaW5nIG5vbi1m
aXhlcyAoZS5nLiBjbGVhbnVwcykgYW5kIHdoeSBpdCdzIGFwcHJvcHJpYXRlCj4gPiAtIGhpZ2hs
aWdodCByZWdyZXNzaW9ucwo+ID4gLSBzdW1tYXJpemUgcHVsbCByZXF1ZXN0cyBjb250YWluZWQK
PiA+IFRoaXMgc2hvdWxkbid0IGJlIG1vcmUgdGhhbiBhIGZldyBsaW5lcyAob3IgaXQgaW5kaWNh
dGVzIHlvdXIgZml4ZXMgcHVsbCBpcyBhCj4gPiBiaXQgdG9vIGJpZykuCj4gPiAKPiA+IFRoYW5r
cywKPiA+IFJvZHJpZ28uCj4gPiAKPiA+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21t
aXQgNTRlY2I4ZjcwMjhjNWViM2Q3NDBiYjgyYjBmMWQ5MGYyZGY2M2M1YzoKPiA+IAo+ID4gICBM
aW51eCA1LjQtcmMxICgyMDE5LTA5LTMwIDEwOjM1OjQwIC0wNzAwKQo+ID4gCj4gPiBhcmUgYXZh
aWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiA+IAo+ID4gICBnaXQ6Ly9hbm9uZ2l0
LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLWludGVsIHRhZ3MvZHJtLWludGVsLWZpeGVzLTIwMTkt
MTAtMDMtMQo+ID4gCj4gPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNDg1ZjY4MmJl
OWZjOGQ0MTM3NjkzNmEzYjAxNDIzZWRkMDdiOWE3NToKPiA+IAo+ID4gICBSZXZlcnQgImRybS9p
OTE1OiBGaXggRFAtTVNUIGNydGNfbWFzayIgKDIwMTktMTAtMDMgMTI6MjM6MDcgLTA3MDApCj4g
PiAKPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiA+IC0gRml4IERQLU1TVCBjcnRjX21hc2sKPiA+IC0gRml4IGRzYyBk
cHAgY2FsY3VsYXRpb25zCj4gPiAtIEZpeCBnNHggc3ByaXRlIHNjYWxpbmcgc3RyaWRlIGNoZWNr
IHdpdGggR1RUIHJlbWFwcGluZwo+ID4gCj4gPiBTaG9ydCBzdW1tYXJ5IG9mIGZpeGVzIHB1bGwg
KGxlc3MgdGhhbiB3aGF0IGdpdCBzaG9ydGxvZyBwcm92aWRlcyk6Cj4gPiAtIGV4cGxhaW4gYW55
dGhpbmcgbm9uLWZpeGVzIChlLmcuIGNsZWFudXBzKSBhbmQgd2h5IGl0J3MgYXBwcm9wcmlhdGUK
PiA+IC0gaGlnaGxpZ2h0IHJlZ3Jlc3Npb25zCj4gPiAtIHN1bW1hcml6ZSBwdWxsIHJlcXVlc3Rz
IGNvbnRhaW5lZAo+ID4gVGhpcyBzaG91bGRuJ3QgYmUgbW9yZSB0aGFuIGEgZmV3IGxpbmVzIChv
ciBpdCBpbmRpY2F0ZXMgeW91ciBmaXhlcyBwdWxsIGlzIGEKPiA+IGJpdCB0b28gYmlnKS4KPiA+
IAo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+ID4gTWFhcnRlbiBMYW5raG9yc3QgKDEpOgo+ID4gICAgICAgZHJtL2k5
MTUvZHA6IEZpeCBkc2MgYnBwIGNhbGN1bGF0aW9ucywgdjUuCj4gPiAKPiA+IFZpbGxlIFN5cmrD
pGzDpCAoMik6Cj4gPiAgICAgICBkcm0vaTkxNTogRml4IGc0eCBzcHJpdGUgc2NhbGluZyBzdHJp
ZGUgY2hlY2sgd2l0aCBHVFQgcmVtYXBwaW5nCj4gPiAgICAgICBSZXZlcnQgImRybS9pOTE1OiBG
aXggRFAtTVNUIGNydGNfbWFzayIKPiAKPiBOb3cgSSBjYW4gc2xlZXAgYmV0dGVyIDopIFRoYW5r
cyBmb3IgcmVzcGlubmluZy4KClRoYW5rcyBmb3IgdGhlIGhlYWRzIHVwLgoKSXQgc2VlbXMgdGhh
dCB3ZSB3aWxsIG5lZWQgdG8gZml4IGRpbSBjaGVycnktcGljayBmdW5jdGlvbnMgdG8gY29uc2lk
ZXIKUmV2ZXJ0cyBhcyBGaXhlcyB3aXRob3V0IGRlcGVuZGluZyBvbiB0aGUgRml4ZXM6IHRhZy4K
CkJ1dCBmb3Igbm93IGl0IHNlZW1zIHRoZSBzYWZlc3QgYXBwcm9hY2ggaXMgdG8gYWRkIEZpeGVz
IHRhZ3MgZXZlbiBvbgpyZXZlcnRzIHNvIG5laXRoZXIgb2YgdXMgbG9vc2Ugc2xlZXAgbm93IG9y
IGxhdGVyIDspCgpUaGFua3MgYSBsb3QKUm9kcmlnby4KCj4gCj4gPiAKPiA+ICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8ICAxMiArLQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5oIHwgICAyICstCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jICAgICAgfCAxODQgKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cC5oICAgICAgfCAgIDYgKy0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2RwX21zdC5jICB8ICAgNCArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfc3ByaXRlLmMgIHwgICA1ICstCj4gPiAgNiBmaWxlcyBjaGFuZ2VkLCAxMTEgaW5zZXJ0aW9u
cygrKSwgMTAyIGRlbGV0aW9ucygtKQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+IEludGVsLWdmeCBtYWlsaW5nIGxpc3QKPiA+IEludGVsLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cj4gCj4gLS0gCj4gVmlsbGUgU3lyasOkbMOkCj4g
SW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
