Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F80D9036B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 15:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859736E432;
	Fri, 16 Aug 2019 13:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FD46E408;
 Fri, 16 Aug 2019 13:47:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Aug 2019 06:47:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,393,1559545200"; d="scan'208";a="194994660"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 16 Aug 2019 06:47:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>,
 Nathaniel Russell <naterussell83@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] Linux Kernel 5.2.8 (uvc or i915?)
In-Reply-To: <abcae5c9-b3dc-7403-d628-5d7543d19702@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAONH+Jm-O6=DQ+K2n5pNTNMg2Sq1KcVNFLuweVh6W82OPEFJoQ@mail.gmail.com>
 <abcae5c9-b3dc-7403-d628-5d7543d19702@infradead.org>
Date: Fri, 16 Aug 2019 16:47:29 +0300
Message-ID: <87wofddxxq.fsf@intel.com>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxNSBBdWcgMjAxOSwgUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+
IHdyb3RlOgo+IE9uIDgvMTUvMTkgNjoxNSBQTSwgTmF0aGFuaWVsIFJ1c3NlbGwgd3JvdGU6Cj4+
IEkgd291bGQgcmVhbGx5IGxpa2UgaGVscCB3aXRoIHRoZSBrZXJuZWwgZXJyb3Igd2l0aCBteSB1
dmN2aWRlbyBkcml2ZXIuCj4+IAo+Cj4gSGkgYWdhaW4uCj4KPiBXaGF0IG1ha2VzIHlvdSB0aGlu
ayB0aGF0IHRoZSBwcm9ibGVtIGlzIHJlbGF0ZWQgdG8gdGhlIHV2Y3ZpZGVvIGRyaXZlcj8KPiBE
b2VzIHNvbWUgcHJldmlvdXMga2VybmVsIHZlcnNpb24gd29yayBjb3JyZWN0bHk/ICBJZiBzbywg
d2hhdCB2ZXJzaW9uKHMpPwo+Cj4KPiBEb2VzIHRoaXMgd2FybmluZyBtZXNzYWdlIG9ubHkgaGFw
cGVuIHdoZW4gdGhlIHV2Y3ZpZGVvIGRyaXZlciBpcyBiZWluZyBsb2FkZWQ/Cj4gQ2FuIHlvdSBz
dXBwcmVzcyBsb2FkaW5nIG9mIHRoZSB1dmN2aWRlbyBkcml2ZXIgdG8gZmluZCBvdXQ/Cj4KPiBN
b3N0IG9mIHRoZSBwcm9ibGVtcy9lcnJvcnMvd2FybmluZ3MgdGhhdCBJIHNlZSBhcmUgcmVsYXRl
ZCB0byB0aGUgaTkxNSBkcml2ZXI6Cj4KPiBbICAgMTMuMDMyMzQxXSB0aW1lZCBvdXQgd2FpdGlu
ZyBmb3IgcG9ydCBDIHJlYWR5OiBnb3QgMHgyMCwgZXhwZWN0ZWQgMHhlMAo+IFsgICAxMy4wMzI4
NzJdIFdBUk5JTkc6IENQVTogMSBQSUQ6IDIzOSBhdCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRl
bF9kaXNwbGF5LmM6MTU5NyB2bHZfd2FpdF9wb3J0X3JlYWR5KzB4OTkvMHhlMCBbaTkxNV0KPiBb
ICAgMTMuMDMzNjMyXSBSSVA6IDAwMTA6dmx2X3dhaXRfcG9ydF9yZWFkeSsweDk5LzB4ZTAgW2k5
MTVdCj4KPiBhbHRob3VnaCB0aGVyZSBhcmUgYSBmZXcgdXZjdmlkZW8gd2FybmluZ3M6Cj4gWyAg
IDEzLjAzOTMwNV0gdXZjdmlkZW8gMS01OjEuMDogRW50aXR5IHR5cGUgZm9yIGVudGl0eSBFeHRl
bnNpb24gNCB3YXMgbm90IGluaXRpYWxpemVkIQo+IFsgICAxMy4wMzkzMThdIHV2Y3ZpZGVvIDEt
NToxLjA6IEVudGl0eSB0eXBlIGZvciBlbnRpdHkgRXh0ZW5zaW9uIDMgd2FzIG5vdCBpbml0aWFs
aXplZCEKPiBbICAgMTMuMDM5MzMwXSB1dmN2aWRlbyAxLTU6MS4wOiBFbnRpdHkgdHlwZSBmb3Ig
ZW50aXR5IFByb2Nlc3NpbmcgMiB3YXMgbm90IGluaXRpYWxpemVkIQo+IFsgICAxMy4wMzkzMzld
IHV2Y3ZpZGVvIDEtNToxLjA6IEVudGl0eSB0eXBlIGZvciBlbnRpdHkgQ2FtZXJhIDEgd2FzIG5v
dCBpbml0aWFsaXplZCEKPgo+Cj4gTGF1cmVudCwgZG8geW91IHNlZSBhbnkgdXZjIGlzc3VlcyBo
ZXJlPyAgQW55IGlkZWFzL3N1Z2dlc3Rpb25zPwo+Cj4KPiBAaW50ZWwtZ2Z4OiAgYW55IGlkZWFz
IGFib3V0IHdoYXQgaXMgZ29pbmcgb24gaGVyZSB3aXRoIHRoZSBpOTE1IGRyaXZlcj8KClBsZWFz
ZSBmaWxlIGEgYnVnIG92ZXIgYXQgWzFdLCBhZGQgZHJtLmRlYnVnPTE0IG1vZHVsZSBwYXJhbWV0
ZXIsIGF0dGFjaApkbWVzZyB0byB0aGUgYnVnLCBhbGwgdGhlIHdheSBmcm9tIGJvb3QgdG8gcmVw
cm9kdWNpbmcgdGhlIGlzc3VlLgoKCkJSLApKYW5pLgoKWzFdIGh0dHBzOi8vYnVncy5mcmVlZGVz
a3RvcC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PURSSSZjb21wb25lbnQ9RFJNL0ludGVsCgoK
Cgo+Cj4KPgo+IE9yaWdpbmFsIG1lc3NhZ2UgdG8gbGttbDoKPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sL0NBT05IK0ptLU82PURRK0sybjVwTlROTWcyU3ExS2NWTkZMdXdlVmg2VzgyT1BF
RkpvUUBtYWlsLmdtYWlsLmNvbS9ULyN1Cj4KPiBQcmV2aW91cyBtZXNzYWdlIGZvciA1LjEuMjEg
a2VybmVsOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0FPTkgrSmtURnVqWTl2RXlO
TnVlbSs5ckoycUJLa2YtUGJLazk9REJTVkVwNmtXPXl3QG1haWwuZ21haWwuY29tLwo+Cj4KPiB0
aGFua3MuCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRl
cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
