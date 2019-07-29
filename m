Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B72237889A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 11:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F95C89BB2;
	Mon, 29 Jul 2019 09:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6E789BB2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 09:39:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 02:15:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,322,1559545200"; d="scan'208";a="190507384"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2019 02:15:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: OLED panel brightness support
In-Reply-To: <A9EF1920-08DF-4153-AA2E-351C7C999566@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <28D3097A-5295-4445-BD73-1A338EFA546D@canonical.com>
 <87d0htp7pl.fsf@intel.com>
 <A9EF1920-08DF-4153-AA2E-351C7C999566@canonical.com>
Date: Mon, 29 Jul 2019 12:19:57 +0300
Message-ID: <8736ipp58i.fsf@intel.com>
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
Cc: Anthony Wong <anthony.wong@canonical.com>, dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@dell.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyOSBKdWwgMjAxOSwgS2FpLUhlbmcgRmVuZyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmlj
YWwuY29tPiB3cm90ZToKPiBhdCAxNjoyNiwgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4
LmludGVsLmNvbT4gd3JvdGU6Cj4KPj4gT24gVHVlLCAyMyBKdWwgMjAxOSwgS2FpLUhlbmcgRmVu
ZyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IEN1
cnJlbnRseSwgT0xFRCBwYW5lbCBicmlnaHRuZXNzIFsxXSBpcyBub3Qgc3VwcG9ydGVkLgo+Pgo+
PiBBcyBhIGdlbmVyYWwgc3RhdGVtZW50IHRoaXMgaXMgbm90IHRydWUsIGFuZCBub3QgYmFja2Vk
IHVwIGJ5IHRoZQo+PiByZWZlcmVuY2VkIGJ1Zy4gV2UganVzdCBkb24ndCBrbm93IGhvdyBicmln
aHRuZXNzIGlzIGNvbnRyb2xsZWQgb24gdGhhdAo+PiBwYXJ0aWN1bGFyIGxhcHRvcCwgYmVjYXVz
ZSBpdCBhcHBhcmVudGx5IHVzZXMgYSBwcm9wZXJpZXRhcnkgbWVjaGFuaXNtLgo+Pgo+PiBJZiBp
dCB1c2VkIHRoZSBicmlnaHRuZXNzIGNvbnRyb2wgbWVjaGFtaXNtIHNwZWNpZmllZCBpbiB0aGUg
VkVTQSBlRFAKPj4gc3BlYywgaXQgc2hvdWxkIHdvcmsganVzdCBmaW5lIHdpdGggdGhlIGk5MTUg
YXV4IGJhY2tsaWdodCBzdXBwb3J0LCBhbmQKPj4gd2Ugc2hvdWxkIGFsc28gZXhwb3J0IHRoZSBy
ZWd1bGFyIGJhY2tsaWdodCBzeXNmcyBmb3IgdGhpcy4KPgo+IEkgYW0gdG9sZCB0aGF0IFdpbmRv
d3MgaW50cm9kdWNlZCDigJxOaXRzQnJpZ2h0bmVzc+KAnSBbMV0gdG8gc3VwcG9ydCBPTEVEIHBh
bmVsLgo+IEkgZG9u4oCZdCBrbm93IGhvdyBpdOKAmXMgcGx1bWJlZCB0byB0aGUgYXV4IGludGVy
ZmFjZSB0aG91Z2guCgpUaGF0IHdvdWxkIGJlIGFib3V0IHdoYXQgdGhlIG51bWJlcnMgd2UgZXhw
b3NlIHRvIHVzZXJzcGFjZSBtZWFuLiBUaGF0J3MKYSBjb21wbGV0ZWx5IGRpZmZlcmVudCBwcm9i
bGVtIGZyb20gdGhlIGtlcm5lbCBub3QgYmVpbmcgYWJsZSB0byBhZGp1c3QKdGhlIGJyaWdodG5l
c3Mgb2YgYSBwYW5lbCwgT0xFRCBvciBub3QsIHZpYSB0aGUgRFBDRCBiZWNhdXNlIG9mIHRoZQpu
b24tc3RhbmRhcmQgaW50ZXJmYWNlIGJlaW5nIHVzZWQuCgpCUiwKSmFuaS4KCgo+Cj4gSXMgaXQg
cG9zc2libGUgdG8gYXNrIFdpbmRvd3MgZ3JhcGhpY3MgdGVhbSBob3cgV2luZG93cyBoYW5kbGUg
T0xFRCBwYW5lbD8KPgo+IFsxXSAgCj4gaHR0cHM6Ly9kb2NzLm1pY3Jvc29mdC5jb20vZW4tdXMv
d2luZG93cy1oYXJkd2FyZS9kcml2ZXJzL2RkaS9jb250ZW50L2QzZGttZHQvbnMtZDNka21kdC1f
ZHhna19icmlnaHRuZXNzX2NhcHMKPgo+IEthaS1IZW5nCj4KPj4KPj4gQlIsCj4+IEphbmkuCj4+
Cj4+Cj4+PiBXZSBoYXZlIGEgc2ltaWxhciBEZWxsIHN5c3RlbSB0aGF0IGFsc28gYWZmZWN0IGJ5
IGxhY2sgb2YgT0xFRCBicmlnaHRuZXNzCj4+PiBzdXBwb3J0Lgo+Pj4KPj4+IEnigJl2ZSBpbnZl
c3RpZ2F0ZWQgYm90aCBrZXJuZWwgYW5kIHVzZXIgc3BhY2UgYnV0IEkgaGF2ZW7igJl0IGZvdW5k
IGEgZ29vZAo+Pj4gZ2VuZXJhbCBzb2x1dGlvbiB5ZXQuCj4+PiBEZWxsIHN5c3RlbXMgdXNlIEVE
SUQgZGVzY3JpcHRvciA0IGFzIERlbGwgc3BlY2lmaWMgZGVzY3JpcHRvciwgd2hpY2gKPj4+IHJl
cG9ydHMgaXRzIHBhbmVsIHR5cGUgYW5kIHdlIGNhbiBrbm93IGl04oCZcyBhbiBPTEVEIHBhbmVs
IG9yIG5vdC4KPj4+Cj4+PiBNeSBpbml0aWFsIHRob3VnaHQgaXMgdG8gYWRkIGEgbmV3IGF0dHJp
YnV0ZSDigJxvbGVkIiBpbiBkcm1fc3lzZnMuYyBbMl0gdG8KPj4+IGxldCB1c2Vyc3BhY2UgbGlr
ZSBjbHV0dGVyIFszXSB0byBjb250cm9sIHRoZSBicmlnaHRuZXNzLgo+Pj4gSG93ZXZlciBvdGhl
ciBERXMgbWF5IG5lZWQgdG8gaW1wbGVtZW50IHRoZWlyIG93biBPTEVEIGJyaWdodG5lc3Mgc3Vw
cG9ydAo+Pj4gd2hpY2ggaXNu4oCZdCBpZGVhbC4KPj4+Cj4+PiBTbyBJ4oCZZCBsaWtlIHRvIGtu
b3cgaWYgdGhlcmXigJlzIGFueSBnb29kIHdheSB0byBzdXBwb3J0IE9MRUQgYnJpZ2h0bmVzcyBp
bgo+Pj4gZ29vZCBvbGQgYmFja2xpZ2h0IHN5c2ZzLCB0byBsZXQgdXNlcnNwYWNlIGtlZXAgdG8g
dGhlIGN1cnJlbnQgaW50ZXJmYWNlLgo+Pj4KPj4+IFsxXSBodHRwczovL2J1Z3MuZnJlZWRlc2t0
b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD05Nzg4Mwo+Pj4gWzJdIGh0dHBzOi8vcGFzdGViaW4udWJ1
bnR1LmNvbS9wL1FZclJCcHBWVDkvCj4+PiBbM10KPj4+IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9y
Zy9HTk9NRS9jbHV0dGVyL2Jsb2IvbWFzdGVyL2NsdXR0ZXIvY2x1dHRlci1icmlnaHRuZXNzLWNv
bnRyYXN0LWVmZmVjdC5jI0w1NTkKPj4+Cj4+PiBLYWktSGVuZwo+Pgo+PiAtLSAKPj4gSmFuaSBO
aWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgo+Cj4KCi0tIApKYW5pIE5p
a3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
