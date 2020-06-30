Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC7B20F762
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 16:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408296E287;
	Tue, 30 Jun 2020 14:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6136E287
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 14:39:06 +0000 (UTC)
IronPort-SDR: hlCJ+tPSW+7rpW67wSbWX5ESjuvZLX50orSJJxGUMVnWjBY0A0dncQ0gRrGTRMACJ6Mreh3Pym
 fV5fXnbodH9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="147792320"
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="147792320"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 07:39:05 -0700
IronPort-SDR: XLNacdmHsm8Ygj1mTLTITjsDbA6eKZGLqWzNJ8RZcr6JRNxr83w6/Tl31ZP1ZZoKSgJMNtEFeh
 ikchY8YYk2zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="295231318"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 30 Jun 2020 07:39:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 30 Jun 2020 17:39:02 +0300
Date: Tue, 30 Jun 2020 17:39:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: warning in omap_connector
Message-ID: <20200630143902.GG6112@intel.com>
References: <CAPM=9tz7E5rmRdqWwGQCsS+q+UcPU7XTxsGgkCggQXA8ktn0pw@mail.gmail.com>
 <20200630141505.GE6112@intel.com>
 <CADnq5_PdqNjD2OnWGWJxv-Q-YUN4ymLUxTdT9km_ESS2cwm68A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PdqNjD2OnWGWJxv-Q-YUN4ymLUxTdT9km_ESS2cwm68A@mail.gmail.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMzAsIDIwMjAgYXQgMTA6MTk6MjNBTSAtMDQwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IE9uIFR1ZSwgSnVuIDMwLCAyMDIwIGF0IDEwOjE1IEFNIFZpbGxlIFN5cmrDpGzDpAo+
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBK
dW4gMzAsIDIwMjAgYXQgMDQ6MzM6MzdQTSArMTAwMCwgRGF2ZSBBaXJsaWUgd3JvdGU6Cj4gPiA+
IEhleSBMYXVyZW50LAo+ID4gPgo+ID4gPiBJIG1lcmdlZCBkcm0tbWlzYy1uZXh0IGFuZCBub3Rp
Y2VkIHRoaXMsIEknbSBub3Qgc3VyZSBpZiBpdCdzCj4gPiA+IGNvbGxhdGVyYWwgZGFtYWdlIGZy
b20gc29tZXRoaW5nIGVsc2UgY2hhbmdpbmcgb3IgSSd2ZSBqdXN0IG1pc3NlZCBpdAo+ID4gPiBw
cmV2aW91c2x5LiAzMi1iaXQgYXJtIGJ1aWxkLgo+ID4gPgo+ID4gPgo+ID4gPiAvaG9tZS9haXJs
aWVkL2RldmVsL2tlcm5lbC9kaW0vc3JjL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY29u
bmVjdG9yLmM6Cj4gPiA+IEluIGZ1bmN0aW9uIOKAmG9tYXBfY29ubmVjdG9yX21vZGVfdmFsaWTi
gJk6Cj4gPiA+IC9ob21lL2FpcmxpZWQvZGV2ZWwva2VybmVsL2RpbS9zcmMvZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vb21hcF9jb25uZWN0b3IuYzo5Mjo5Ogo+ID4gPiB3YXJuaW5nOiBicmFjZXMg
YXJvdW5kIHNjYWxhciBpbml0aWFsaXplcgo+ID4gPiAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
IG5ld19tb2RlID0geyB7IDAgfSB9Owo+ID4KPiA+IFByb2JhYmx5IGZhbGxvdXQgZnJvbSBteSBk
cm1fZGlzcGxheV9tb2RlIHNocmlua2FnZS4KPiA+Cj4gPiBHb2luZyB0byByZXBlYXQgbXkgdXN1
YWwgImp1c3QgdXNlIHt9IHdoZW4gemVybyBpbml0aWFsaXppbmcKPiA+IHN0cnVjdHMiIHJlY29t
bWVuZGF0aW9uLiBBdm9pZHMgdGhlc2Ugc3R1cGlkIHdhcm5pbmdzLCBhbmQgSU1PCj4gPiBhbHNv
IGNvbnZleXMgdGhlIG1lYW5pbmcgYmV0dGVyIHNpbmNlIHRoZXJlJ3Mgbm8gYW1iaWd1aXR5Cj4g
PiBiZXR3ZWVuIHplcm8gaW5pdGlhbGl6aW5nIHRoZSB3aG9sZSBzdHJ1Y3QgdnMuIHplcm8gaW5p
dGlhbGl6aW5nCj4gPiBqdXN0IHRoZSBmaXJzdCBtZW1iZXIuCj4gCj4gSUlSQywgTExWTSBhbmQg
R0NDIHRyZWF0IHRoZXNlIHNsaWdodGx5IGRpZmZlcmVudGx5LiAgV2UndmUgZ2VuZXJhbGx5Cj4g
anVzdCBtb3ZlZCB0byB1c2luZyBtZW1zZXQgdG8gYXZvaWQgZGlmZmVyZW50IGNvbXBpbGVyIGNv
bXBsYWludHMgd2hlbgo+IHVzaW5nIHRoZXNlLgoKSSBkb24ndCBwYXJ0aWN1bGFybHkgbGlrZSBt
ZW1zZXQoKSBzaW5jZSB0aGUgcmVxdWlyZW1lbnQgdG8KcGFzcyB0aGUgc2l6ZSBqdXN0IGFkZHMg
YW5vdGhlciB3YXkgdG8gc2NyZXcgdGhpbmdzIHVwLiBUaGUKdXN1YWwgJ3NpemVvZigqdGhpbmcp
JyBtYWtlcyB0aGF0IHNsaWdodGx5IGxlc3Mgb2YgYW4gaXNzdWUsCmJ1dCBJJ3ZlIG5vdGljZWQg
dGhhdCBwZW9wbGUgb2Z0ZW4gZG9uJ3QgdXNlIHRoYXQuCgpBbm90aGVyIGlzc3VlIHdpdGggbWVt
c2V0KCkgaXMgdGhhdCB5b3UgdGhlbiBjYW4gZW5kIHVwIHdpdGgKYSBibG9jayBvZiBzZWVtaW5n
bHkgcmFuZG9tIGNvbGxlY3Rpb24gb2YgbWVtc2V0cygpcyBiZXR3ZWVuCnRoZSB2YXJpYWJsZSBk
ZWNsYXJhdGlvbnMgYW5kIHRoZSByZXN0IG9mIHRoZSBjb2RlLiBJIHN1cHBvc2UKaWYgd2UgY291
bGQgZGVjbGFyZSB2YXJpYWJsZXMgYW55d2hlcmUgd2UgY291bGQgYWx3YXlzIGtlZXAKdGhlIHR3
byB0b2dldGhlciBzbyBpdCB3b3VsZG4ndCBsb29rIHNvIHdlaXJkLCBidXQgY2FuJ3QgZG8KdGhh
dCBmb3IgdGhlIHRpbWUgYmVpbmcuIEFuZCBldmVuIHdpdGggdGhhdCBpdCB3b3VsZCBzdGlsbAps
ZWFkIHRvIGxlc3Mgc3VjY2luY3QgY29kZSwgd2hpY2ggSSBnZW5lcmFsbHkgZGlzbGlrZS4KCi0t
IApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
